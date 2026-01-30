#' Bold a summary or total row
#'
#' @description
#' Applies bold text and an optional top border to one or more rows,
#' typically used to highlight a summary or total row at the bottom
#' of a table. Rows can be identified by row number or by matching
#' a value in a specified column (e.g. "Total").
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param rows Row indices (integer vector) to style. If `NULL`,
#'   uses `match_col` and `match_val` instead.
#' @param match_col Column name (string) to search for `match_val`.
#' @param match_val Value to match in `match_col` to identify the
#'   summary row(s). Default `"Total"`.
#' @param bold_weight Font weight for the summary row. Default `700`.
#' @param border_color Color of the top border above the summary row.
#'   Set to `NULL` to omit the border. Default `"#333333"` (`bdo_charcoal`).
#' @param fill_color Optional background fill for the summary row.
#'   Default `NULL` (no fill).
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # By row index (last row)
#' # tbl %>% ts_gt_bold_sumrow(rows = nrow(data))
#'
#' # By matching a label
#' # tbl %>% ts_gt_bold_sumrow(match_col = "indicator", match_val = "Total")
ts_gt_bold_sumrow <- function(gt_object,
                              rows = NULL,
                              match_col = NULL,
                              match_val = "Total",
                              bold_weight = 700,
                              border_color = "#333333",
                              fill_color = NULL) {

  check_gt_object(gt_object)

  # Determine target rows
 if (is.null(rows)) {
    if (is.null(match_col)) {
      cli::cli_abort("Supply either {.arg rows} or {.arg match_col}.")
    }
    data <- gt_object$`_data`
    rows <- which(data[[match_col]] == match_val)
    if (length(rows) == 0) {
      cli::cli_warn("No rows matched {.val {match_val}} in column {.val {match_col}}.")
      return(gt_object)
    }
  }

  # Bold text
  gt_object <- gt_object %>%
    gt::tab_style(
      style = gt::cell_text(weight = bold_weight),
      locations = gt::cells_body(rows = rows)
    )

  # Top border
  if (!is.null(border_color)) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_borders(
          sides = "top",
          color = border_color,
          weight = gt::px(2)
        ),
        locations = gt::cells_body(rows = rows)
      )
  }

  # Optional fill
  if (!is.null(fill_color)) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_fill(color = fill_color),
        locations = gt::cells_body(rows = rows)
      )
  }

  gt_object
}
