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
#' @param ... Optional additional arguments to `gt::table_options()`
#'
#' @return An object of class `gt_tbl`.
#' @export
#'
#' @examples
ts_gt_base <- function(gt_object,
                       header_fill = bdo_slate_2,
                       header_font_color = "white",
                       table_font = "Trebuchet MS",
                       table_font_color = bdo_charcoal,
                       ...) {

  # Test that the object entered is in fact a gt object, if not it needs to be passed through gt()
  check_gt_object(gt_object)

  # Base theme settings using BDO color system
  gt_object %>%
    gt::tab_options(
      heading.align = "left",
      column_labels.border.top.style = "none",
      table.border.top.style = "none",
      column_labels.border.bottom.style = "none",
      column_labels.border.bottom.width = 1,
      column_labels.border.bottom.color = bdo_ocean2,
      table_body.border.top.style = "none",
      table_body.border.bottom.color = bdo_pale_charcoal,
      table_body.hlines.width = 0,
      heading.border.bottom.style = "none",
      data_row.padding = gt::px(5),
      column_labels.font.size = gt::px(14),
      row_group.padding = gt::px(4),
      source_notes.font.size = gt::px(10),
      ...
    ) %>%
    gt::tab_style(
      style = gt::cell_text(
        color = header_font_color, font = gt::google_font(table_font),
        weight = 700, transform = "uppercase"
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
      style = gt::cell_text(
        color = table_font_color, font = gt::google_font("Trebuchet MS"), weight = 750,
        transform = "uppercase"
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
      style = gt::cell_text(
        color = table_font_color, font = gt::google_font(table_font), weight = 600,
        transform = "uppercase"
      ),
      locations = gt::cells_row_groups()
    ) %>%
    # Stub text
    gt::tab_style(
      style = gt::cell_text(
        color = table_font_color, font = gt::google_font(table_font), weight = 500,
        transform = "uppercase"
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
