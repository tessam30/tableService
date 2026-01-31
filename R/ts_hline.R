#' Insert a horizontal rule between rows
#'
#' @description
#' Adds a top border to specified rows, creating a visual separator without
#' requiring row groups. Useful for sectioning a flat table.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param rows Integer vector of row indices that should receive a top border.
#'   The line appears *above* these rows.
#' @param color Border color. Default `"#333333"` (`bdo_charcoal`).
#' @param weight Border weight in pixels. Default `1`.
#' @param style Border style. Default `"solid"`.
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Add a line above row 7
#' # achv_data %>% gt() %>% ts_gt_base() %>% ts_hline(rows = 7)
#'
#' # Multiple separators
#' # achv_data %>% gt() %>% ts_gt_base() %>% ts_hline(rows = c(5, 9))
ts_hline <- function(gt_object,
                     rows,
                     color = "#333333",
                     weight = 1,
                     style = "solid") {

  check_gt_object(gt_object)

  gt_object %>%
    gt::tab_style(
      style = gt::cell_borders(
        sides = "top",
        color = color,
        weight = gt::px(weight),
        style = style
      ),
      locations = gt::cells_body(rows = rows)
    )
}
