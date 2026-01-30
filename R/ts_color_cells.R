#' Color cells by breakpoints
#'
#' @description
#' Applies background fill colors to cells in a numeric column based on
#' user-defined breakpoints. Each bin between breakpoints gets its own
#' color, making it easy to build heatmap-style tables from any BDO
#' palette or custom color vector.
#'
#' Breakpoints define the boundaries. If you supply \code{n} breakpoints
#' you need \code{n + 1} colors (one for each bin including below-min and
#' above-max).
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param column The column to color (unquoted or quoted name).
#' @param breaks Numeric vector of breakpoints (sorted ascending).
#' @param colors Character vector of fill colors. Length must be
#'   `length(breaks) + 1`.
#' @param text_color Optional text color applied to all colored cells.
#'   Default `NULL` (no override).
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # 3-color stoplight: red < 0.5, gold 0.5-0.9, jade >= 0.9
#' # achv_data %>%
#' #   gt() %>%
#' #   ts_gt_base() %>%
#' #   ts_color_cells(Achievement,
#' #     breaks = c(0.5, 0.9),
#' #     colors = c(bdo_red, bdo_gold, bdo_jade))
ts_color_cells <- function(gt_object,
                           column,
                           breaks,
                           colors,
                           text_color = NULL) {

  check_gt_object(gt_object)

  if (length(colors) != length(breaks) + 1) {
    cli::cli_abort(
      "Expected {length(breaks) + 1} colors for {length(breaks)} breakpoints, got {length(colors)}."
    )
  }

  data <- gt_object$`_data`
  col_name <- rlang::as_name(rlang::enquo(column))
  vals <- data[[col_name]]

  # Bin assignment: findInterval returns 0 for below first break,

  # 1 for between breaks[1] and breaks[2], etc.
  bins <- findInterval(vals, breaks, left.open = FALSE) + 1L

  for (i in seq_along(colors)) {
    target_rows <- which(bins == i)
    if (length(target_rows) == 0) next

    styles <- list(gt::cell_fill(color = colors[i]))
    if (!is.null(text_color)) {
      styles <- c(styles, list(gt::cell_text(color = text_color)))
    }

    gt_object <- gt_object %>%
      gt::tab_style(
        style = styles,
        locations = gt::cells_body(columns = col_name, rows = target_rows)
      )
  }

  gt_object
}
