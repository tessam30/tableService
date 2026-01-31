#' Highlight rows conditionally
#'
#' @description
#' Applies a background fill and/or text color to rows matching a condition.
#' Rows are identified by matching a value in a specified column, or by
#' providing explicit row indices.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param rows Integer vector of row indices to highlight. If `NULL`,
#'   uses `match_col` and `match_val` instead.
#' @param match_col Column name (string) to search for `match_val`.
#' @param match_val Value(s) to match in `match_col`. Can be a vector
#'   to match multiple values.
#' @param fill_color Background fill color. Default `"#EEF4F3"` (`bdo_neutral_pale`).
#' @param text_color Text color override. Default `NULL` (no change).
#' @param bold Logical. Bold the highlighted rows? Default `FALSE`.
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Highlight by column value
#' # achv_data %>% gt() %>% ts_gt_base() %>%
#' #   ts_highlight_rows(match_col = "operating_unit", match_val = "Minoria")
#'
#' # Highlight specific rows with a custom color
#' # achv_data %>% gt() %>% ts_gt_base() %>%
#' #   ts_highlight_rows(rows = c(1, 3, 5), fill_color = bdo_ocean_soft)
ts_highlight_rows <- function(gt_object,
                              rows = NULL,
                              match_col = NULL,
                              match_val = NULL,
                              fill_color = "#EEF4F3",
                              text_color = NULL,
                              bold = FALSE) {

  check_gt_object(gt_object)

  if (is.null(rows)) {
    if (is.null(match_col) || is.null(match_val)) {
      cli::cli_abort("Supply either {.arg rows} or both {.arg match_col} and {.arg match_val}.")
    }
    data <- gt_object$`_data`
    rows <- which(data[[match_col]] %in% match_val)
    if (length(rows) == 0) {
      cli::cli_warn("No rows matched {.val {match_val}} in column {.val {match_col}}.")
      return(gt_object)
    }
  }

  # Background fill
  gt_object <- gt_object %>%
    gt::tab_style(
      style = gt::cell_fill(color = fill_color),
      locations = gt::cells_body(rows = rows)
    )

  # Optional text color
  if (!is.null(text_color)) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(color = text_color),
        locations = gt::cells_body(rows = rows)
      )
  }

  # Optional bold
  if (bold) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(weight = "bold"),
        locations = gt::cells_body(rows = rows)
      )
  }

  gt_object
}
