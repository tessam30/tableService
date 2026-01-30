# Creates a base tableService theme from which variations can be created
#' tableService base theme
#'
#' Applies a BDO-branded base theme to a gt table object. Uses BDO color
#' tokens for a consistent, professional look across all tables.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param header_fill Fill color for the header background, defaults to `bdo_slate_2` (`#5b6e7f`)
#' @param header_font_color Font color for the header text, defaults to white
#' @param table_font Font type as called from `google_font()`
#' @param table_font_color Font color for the table body, defaults to `bdo_charcoal` (`#333333`)
#' @param text_case Text transform applied to column labels, title, row
#'   groups, and stub text. One of `"uppercase"` (default), `"lowercase"`,
#'   `"capitalize"`, or `"none"` to preserve original casing. Also
#'   accepts `TRUE` (same as `"uppercase"`) and `FALSE` (same as `"none"`)
#'   for convenience.
#' @param ... Optional additional arguments to `gt::table_options()`
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # Default (uppercase headers)
#' # achv_data %>% gt() %>% ts_gt_base()
#'
#' # Capitalize first letter only
#' # achv_data %>% gt() %>% ts_gt_base(text_case = "capitalize")
#'
#' # Preserve original casing
#' # achv_data %>% gt() %>% ts_gt_base(text_case = "none")
ts_gt_base <- function(gt_object,
                       header_fill = "#5b6e7f",
                       header_font_color = "white",
                       table_font = "Trebuchet MS",
                       table_font_color = "#333333",
                       text_case = "uppercase",
                       ...) {

  # Test that the object entered is in fact a gt object, if not it needs to be passed through gt()
  check_gt_object(gt_object)

  # Accept TRUE/FALSE for backward compatibility
  if (is.logical(text_case)) {
    text_case <- if (text_case) "uppercase" else "none"
  }
  text_case <- match.arg(text_case, choices = c("uppercase", "lowercase", "capitalize", "none"))

  # Helper: build cell_text with optional text transform
  styled_text <- function(...) {
    if (text_case != "none") {
      gt::cell_text(..., transform = text_case)
    } else {
      gt::cell_text(...)
    }
  }

  # Base theme settings using BDO color system
  gt_object %>%
    gt::tab_options(
      heading.align = "left",
      column_labels.border.top.style = "none",
      table.border.top.style = "none",
      column_labels.border.bottom.style = "none",
      column_labels.border.bottom.width = 1,
      column_labels.border.bottom.color = "#008fd2",
      table_body.border.top.style = "none",
      table_body.border.bottom.color = "#e7e7e7",
      table_body.hlines.width = 0,
      heading.border.bottom.style = "none",
      data_row.padding = gt::px(5),
      column_labels.font.size = gt::px(14),
      row_group.padding = gt::px(4),
      source_notes.font.size = gt::px(10),
      ...
    ) %>%
    gt::tab_style(
      style = styled_text(
        color = header_font_color, font = gt::google_font(table_font),
        weight = 700
      ),
      locations = gt::cells_column_labels(tidyselect::everything())
    ) %>%
    # Header fill using BDO slate
    gt::tab_style(
      style = gt::cell_fill(color = header_fill),
      locations = gt::cells_column_labels(tidyselect::everything())
    ) %>%
    # Table title font
    gt::tab_style(
      style = styled_text(
        color = table_font_color, font = gt::google_font("Trebuchet MS"), weight = 750
      ),
      locations = gt::cells_title(groups = "title")
    ) %>%
    # Cell body text
    gt::tab_style(
      style = gt::cell_text(color = table_font_color, font = gt::google_font(table_font), weight = 400),
      locations = gt::cells_body()
    ) %>%
    # Row group headers
    gt::tab_style(
      style = styled_text(
        color = table_font_color, font = gt::google_font(table_font), weight = 600
      ),
      locations = gt::cells_row_groups()
    ) %>%
    # Stub text
    gt::tab_style(
      style = styled_text(
        color = table_font_color, font = gt::google_font(table_font), weight = 500
      ),
      locations = gt::cells_stub()
    ) %>%
    # Source notes
    gt::tab_style(
      style = gt::cell_text(color = table_font_color, font = gt::google_font(table_font), weight = 400),
      locations = gt::cells_source_notes()
    )
}

# Keep backward compatibility alias
#' @rdname ts_gt_base
#' @export
si_gt_base <- ts_gt_base


#' Compressed tableService theme
#'
#' A convenience wrapper around \code{\link{ts_gt_base}} that produces a
#' tightly packed table suited for dashboards, slide decks, or any context
#' where vertical space is at a premium. Applies minimal row padding, a
#' smaller base font size, and compact column-label and source-note sizing.
#'
#' All arguments from \code{ts_gt_base()} are accepted via \code{...} so
#' you can still override header colors, fonts, uppercase, etc.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param row_padding Row padding in pixels. Default is `1`.
#' @param font_size Body font size in pixels. Default is `11`.
#' @param ... Additional arguments passed to \code{\link{ts_gt_base}}
#'   (e.g. `text_case = "capitalize"`, `header_fill = bdo_burgundy`)
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
#' # achv_data %>% gt() %>% ts_gt_compressed()
#' # achv_data %>% gt() %>% ts_gt_compressed(text_case = "none")
#' # achv_data %>% gt() %>% ts_gt_compressed(header_fill = bdo_burgundy)
ts_gt_compressed <- function(gt_object,
                             row_padding = 1,
                             font_size = 11,
                             ...) {

  gt_object %>%
    ts_gt_base(...) %>%
    gt::tab_options(
      data_row.padding = gt::px(row_padding),
      column_labels.font.size = gt::px(font_size),
      source_notes.font.size = gt::px(8),
      row_group.padding = gt::px(2)
    ) %>%
    gt::tab_style(
      style = gt::cell_text(size = gt::px(font_size)),
      locations = gt::cells_body()
    )
}
