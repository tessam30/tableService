#' Add a themed spanner to a gt table
#'
#' @description
#' Wraps \code{gt::tab_spanner()} and applies BDO-consistent styling
#' (font, weight, optional fill color) to the spanner label so it
#' matches the rest of the table theme automatically.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param label Spanner label text.
#' @param columns Columns to span (tidyselect syntax).
#' @param fill_color Background fill for the spanner. Default `NULL`
#'   (inherits from column labels). Set to a hex value to override.
#' @param font_color Text color for the spanner. Default `"white"`.
#' @param font Font family. Default `"Trebuchet MS"`.
#' @param weight Font weight. Default `700`.
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # achv_data %>% gt() %>% ts_gt_base() %>%
#' #   ts_spanner("Performance", columns = c(Result, Target, Achievement))
ts_spanner <- function(gt_object,
                       label,
                       columns,
                       fill_color = NULL,
                       font_color = "white",
                       font = "Trebuchet MS",
                       weight = 700) {

  check_gt_object(gt_object)

  gt_object <- gt_object %>%
    gt::tab_spanner(
      label = label,
      columns = {{ columns }}
    )

  # Style the spanner label
  styles <- list(
    gt::cell_text(
      color = font_color,
      font = gt::google_font(font),
      weight = weight
    )
  )

  if (!is.null(fill_color)) {
    styles <- c(styles, list(gt::cell_fill(color = fill_color)))
  }

  gt_object %>%
    gt::tab_style(
      style = styles,
      locations = gt::cells_column_spanners(spanners = label)
    )
}
