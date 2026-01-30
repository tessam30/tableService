#' Add directional arrow column to a gt table
#'
#' @description
#' Appends a column of colored directional arrows (up/down) to a gt table by
#' comparing a numeric column against either a fixed baseline value or another
#' column. Arrows are colored using BDO tokens by default (jade for up,
#' red for down).
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param column The column containing current values (unquoted name).
#' @param compare_to Optional column to compare against (unquoted name).
#'   Supply either `compare_to` or `baseline`, not both.
#' @param baseline Optional fixed numeric value to compare against.
#' @param up_color Color for upward arrows. Default `"#009966"` (`bdo_jade`).
#' @param down_color Color for downward arrows. Default `"#e81a3b"` (`bdo_red`).
#' @param new_col_name Name of the new arrow column. Default `"delta"`.
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Compare Achievement against a fixed baseline
#' # achv_data %>% gt() %>% add_arrow_column_gt(Achievement, baseline = 0.90)
#'
#' # Compare two columns
#' # achv_data %>% gt() %>% add_arrow_column_gt(Result, compare_to = Target)
add_arrow_column_gt <- function(gt_object,
                                column,
                                compare_to = NULL,
                                baseline = NULL,
                                up_color = "#009966",
                                down_color = "#e81a3b",
                                new_col_name = "delta") {

  check_gt_object(gt_object)

  col_quo <- rlang::enquo(column)
  col_name <- rlang::as_name(col_quo)
  comp_quo <- rlang::enquo(compare_to)

  if (is.null(baseline) && rlang::quo_is_null(comp_quo)) {
    cli::cli_abort("Supply either {.arg compare_to} or {.arg baseline}.")
  }

  data <- gt_object$`_data`

  if (!is.null(baseline)) {
    data[[new_col_name]] <- dplyr::case_when(
      data[[col_name]] > baseline  ~ "\u25B2",
      data[[col_name]] < baseline  ~ "\u25BC",
      TRUE                         ~ "\u25B6"
    )
  } else {
    comp_name <- rlang::as_name(comp_quo)
    data[[new_col_name]] <- dplyr::case_when(
      data[[col_name]] > data[[comp_name]] ~ "\u25B2",
      data[[col_name]] < data[[comp_name]] ~ "\u25BC",
      TRUE                                 ~ "\u25B6"
    )
  }

  gt_object <- gt::gt(data)

  # Style up arrows
  gt_object <- gt_object %>%
    gt::tab_style(
      style = gt::cell_text(color = up_color, weight = "bold"),
      locations = gt::cells_body(
        columns = new_col_name,
        rows = data[[new_col_name]] == "\u25B2"
      )
    )

  # Style down arrows

  gt_object <- gt_object %>%
    gt::tab_style(
      style = gt::cell_text(color = down_color, weight = "bold"),
      locations = gt::cells_body(
        columns = new_col_name,
        rows = data[[new_col_name]] == "\u25BC"
      )
    )

  gt_object
}
