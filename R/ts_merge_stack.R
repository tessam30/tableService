#' Stack two columns into a single merged cell
#'
#' @description
#' Merges two columns into one cell with the primary value on top and the
#' secondary value below in smaller, lighter text. Useful for making compact
#' tables (e.g. indicator name over program area, name over ID).
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param col_top Column to display on top (unquoted or string).
#' @param col_bottom Column to display below in smaller text (unquoted or string).
#' @param small_size Font size for the bottom value in pixels. Default `10`.
#' @param small_color Color for the bottom value. Default `"#5b6e7f"` (`bdo_slate_2`).
#' @param sep HTML separator between the two values. Default `"<br>"`.
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Stack indicator over program_area
#' # achv_data %>% gt() %>% ts_gt_base() %>%
#' #   ts_merge_stack(indicator, program_area)
ts_merge_stack <- function(gt_object,
                           col_top,
                           col_bottom,
                           small_size = 10,
                           small_color = "#5b6e7f",
                           sep = "<br>") {

  check_gt_object(gt_object)

  col_top_name <- rlang::as_name(rlang::enquo(col_top))
  col_bottom_name <- rlang::as_name(rlang::enquo(col_bottom))

  pattern <- paste0(
    "{1}", sep,
    "<span style='font-size:", small_size, "px;color:", small_color, ";'>",
    "{2}</span>"
  )

  gt_object %>%
    gt::cols_merge(
      columns = c(col_top_name, col_bottom_name),
      pattern = pattern
    )
}
