#' Format a column as percent change with signs and color
#'
#' @description
#' Formats a numeric column as a percent change with automatic `+`/`-` signs
#' and colored text (green for positive, red for negative, gray for zero).
#' Values are multiplied by 100 unless `already_pct = TRUE`.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param column Column to format (unquoted or string).
#' @param decimals Number of decimal places. Default `1`.
#' @param pos_color Color for positive values. Default `"#009966"` (`bdo_jade`).
#' @param neg_color Color for negative values. Default `"#e81a3b"` (`bdo_red`).
#' @param zero_color Color for zero values. Default `"#5b6e7f"` (`bdo_slate_2`).
#' @param already_pct Logical. If `TRUE`, values are already in percent form
#'   (e.g. 5.2 means 5.2\%). If `FALSE` (default), values are proportions
#'   (e.g. 0.052 means 5.2\%).
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Format a proportion column
#' # df %>% gt() %>% ts_gt_base() %>% ts_fmt_pct_change(pct_change)
#'
#' # Already in percent form
#' # df %>% gt() %>% ts_gt_base() %>% ts_fmt_pct_change(delta, already_pct = TRUE)
ts_fmt_pct_change <- function(gt_object,
                              column,
                              decimals = 1,
                              pos_color = "#009966",
                              neg_color = "#e81a3b",
                              zero_color = "#5b6e7f",
                              already_pct = FALSE) {

  check_gt_object(gt_object)

  col_name <- rlang::as_name(rlang::enquo(column))
  data <- gt_object$`_data`
  vals <- data[[col_name]]

  # Format values with sign and % suffix
  multiplier <- if (already_pct) 1 else 100
  formatted <- dplyr::case_when(
    is.na(vals) ~ NA_character_,
    vals > 0  ~ paste0("+", formatC(vals * multiplier, format = "f", digits = decimals), "%"),
    vals < 0  ~ paste0(formatC(vals * multiplier, format = "f", digits = decimals), "%"),
    TRUE      ~ paste0(formatC(vals * multiplier, format = "f", digits = decimals), "%")
  )

  # Apply formatted text via text_transform
  gt_object <- gt_object %>%
    gt::text_transform(
      locations = gt::cells_body(columns = col_name),
      fn = function(x) formatted
    )

  # Color positive values
  pos_rows <- which(vals > 0)
  if (length(pos_rows) > 0) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(color = pos_color, weight = "bold"),
        locations = gt::cells_body(columns = col_name, rows = pos_rows)
      )
  }

  # Color negative values
  neg_rows <- which(vals < 0)
  if (length(neg_rows) > 0) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(color = neg_color, weight = "bold"),
        locations = gt::cells_body(columns = col_name, rows = neg_rows)
      )
  }

  # Color zero values
  zero_rows <- which(vals == 0)
  if (length(zero_rows) > 0) {
    gt_object <- gt_object %>%
      gt::tab_style(
        style = gt::cell_text(color = zero_color),
        locations = gt::cells_body(columns = col_name, rows = zero_rows)
      )
  }

  gt_object
}
