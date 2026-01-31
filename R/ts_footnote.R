#' Add a styled footnote to a gt table
#'
#' @description
#' Attaches a footnote to a column label or specific cell(s), automatically
#' styled with the BDO font. A thin convenience wrapper around
#' \code{gt::tab_footnote()}.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param note Footnote text.
#' @param columns Column(s) to attach the footnote to (column header).
#'   Uses tidyselect syntax.
#' @param rows Optional row indices to attach the footnote to specific cells
#'   instead of the column header. Default `NULL` (attaches to header).
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Footnote on a column header
#' # achv_data %>% gt() %>% ts_gt_base() %>%
#' #   ts_footnote("Cumulative FY24 results", columns = Result)
#'
#' # Footnote on specific cells
#' # achv_data %>% gt() %>% ts_gt_base() %>%
#' #   ts_footnote("Preliminary", columns = Result, rows = c(1, 2))
ts_footnote <- function(gt_object,
                        note,
                        columns,
                        rows = NULL) {

  check_gt_object(gt_object)

  if (is.null(rows)) {
    locations <- gt::cells_column_labels(columns = {{ columns }})
  } else {
    locations <- gt::cells_body(columns = {{ columns }}, rows = rows)
  }

  gt_object %>%
    gt::tab_footnote(
      footnote = note,
      locations = locations
    )
}
