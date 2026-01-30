#' Darken column header text
#'
#' @description
#' Overrides the column header text color without changing the header
#' background fill. Useful for fine-tuning contrast when using lighter
#' header fills.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param color Text color for column headers. Default `"#333333"` (`bdo_charcoal`).
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # achv_data %>% gt() %>% ts_gt_base() %>% drkn_clmn_hdr("#000000")
drkn_clmn_hdr <- function(gt_object, color = "#333333") {

  check_gt_object(gt_object)

  gt_object %>%
    gt::tab_style(
      style = gt::cell_text(color = color),
      locations = gt::cells_column_labels(tidyselect::everything())
    )
}
