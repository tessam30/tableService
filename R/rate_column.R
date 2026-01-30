#' Rate a numeric column against a threshold
#'
#' @description
#' Evaluates a numeric column against a threshold and applies colored text
#' styling directly in the gt table. Values at or above the threshold are
#' styled with `pass_color`; values below are styled with `fail_color`.
#'
#' This is a generalized version of threshold-based performance rating
#' suitable for any indicator that has a pass/fail cutoff.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param column The column to evaluate (unquoted or quoted name).
#' @param threshold Numeric threshold. Default `0.85`.
#' @param pass_color Color for values >= threshold. Default `"#009966"` (`bdo_jade`).
#' @param fail_color Color for values < threshold. Default `"#e81a3b"` (`bdo_red`).
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # achv_data %>% gt() %>% ts_gt_base() %>% rate_column(Achievement, threshold = 0.90)
rate_column <- function(gt_object,
                        column,
                        threshold = 0.85,
                        pass_color = "#009966",
                        fail_color = "#e81a3b") {

  check_gt_object(gt_object)

  data <- gt_object$`_data`
  col_name <- rlang::as_name(rlang::enquo(column))

  pass_rows <- which(data[[col_name]] >= threshold)
  fail_rows <- which(data[[col_name]] < threshold)

  if (length(pass_rows) > 0) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(color = pass_color, weight = "bold"),
        locations = gt::cells_body(columns = col_name, rows = pass_rows)
      )
  }

  if (length(fail_rows) > 0) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(color = fail_color, weight = "bold"),
        locations = gt::cells_body(columns = col_name, rows = fail_rows)
      )
  }

  gt_object
}
