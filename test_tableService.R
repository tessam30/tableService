# test_tableService.R
# ------------------------------------------------------------------
# Interactive test script for the tableService package.
# Source this file in RStudio (or run line-by-line) to preview every
# major feature and confirm the BDO color palette is applied correctly.
# Each section saves an HTML table to the "test_outputs/" folder so
# you can inspect them in a browser.
# ------------------------------------------------------------------

library(gt)
library(dplyr)

# Source all package files so we don't need a formal install
pkg_dir <- here::here()
r_files <- list.files(file.path(pkg_dir, "R"), full.names = TRUE, pattern = "\\.R$")
invisible(lapply(r_files, source))

# Load bundled example data
load(file.path(pkg_dir, "data", "achv_data.rda"))

# Create output directory for rendered tables
dir.create("test_outputs", showWarnings = FALSE)


# ── 1. BDO Color Palette Verification ────────────────────────────
cat("\n── 1. BDO Color Tokens ──\n")
print(bdo_colors)

cat("\n── 2. BDO Palettes ──\n")
str(bdo_palettes)


# ── 2. Basic theme (ts_gt_base) ──────────────────────────────────
tbl_basic <- achv_data %>%
  gt() %>%
  ts_gt_base() %>%
  add_labs(
    title    = "Basic BDO Theme",
    subtitle = "ts_gt_base() with default BDO colors",
    caption  = "Source: tableService test script"
  )

gtsave(tbl_basic, "test_outputs/01_basic_theme.html")
cat("Saved: test_outputs/01_basic_theme.html\n")


# ── 3. Numeric formatting ────────────────────────────────────────
tbl_fmt <- achv_data %>%
  gt() %>%
  ts_gt_base() %>%
  format_numeric_columns() %>%
  add_labs(
    title    = "Numeric Formatting",
    subtitle = "Whole numbers get commas, decimals become percentages",
    caption  = "Source: tableService test script"
  )

gtsave(tbl_fmt, "test_outputs/02_numeric_formatting.html")
cat("Saved: test_outputs/02_numeric_formatting.html\n")


# ── 4. Column alignment ──────────────────────────────────────────
tbl_align <- achv_data %>%
  gt() %>%
  ts_gt_base() %>%
  format_numeric_columns() %>%
  align_columns() %>%
  add_labs(
    title    = "Column Alignment",
    subtitle = "Text left-aligned, numbers right-aligned",
    caption  = "Source: tableService test script"
  )

gtsave(tbl_align, "test_outputs/03_column_alignment.html")
cat("Saved: test_outputs/03_column_alignment.html\n")


# ── 5. Row striping (default BDO neutral_pale) ───────────────────
tbl_stripe <- achv_data %>%
  gt() %>%
  ts_gt_base() %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping() %>%
  add_labs(
    title    = "Row Striping (default)",
    subtitle = paste0("apply_row_striping() using bdo_neutral_pale (", bdo_neutral_pale, ")"),
    caption  = "Source: tableService test script"
  )

gtsave(tbl_stripe, "test_outputs/04_row_striping_default.html")
cat("Saved: test_outputs/04_row_striping_default.html\n")


# ── 6. Row striping with custom BDO color ─────────────────────────
tbl_stripe_ocean <- achv_data %>%
  gt() %>%
  ts_gt_base() %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping(stripe_color = bdo_ocean_soft) %>%
  add_labs(
    title    = "Row Striping (ocean soft)",
    subtitle = paste0("Custom stripe using bdo_ocean_soft (", bdo_ocean_soft, ")"),
    caption  = "Source: tableService test script"
  )

gtsave(tbl_stripe_ocean, "test_outputs/05_row_striping_ocean.html")
cat("Saved: test_outputs/05_row_striping_ocean.html\n")


# ── 7. Row padding variants ──────────────────────────────────────
for (pad in c("condensed", "regular", "relaxed")) {
  tbl_pad <- achv_data %>%
    gt() %>%
    ts_gt_base() %>%
    format_numeric_columns() %>%
    adjust_row_padding(padding_setting = pad) %>%
    add_labs(
      title    = paste("Row Padding:", pad),
      subtitle = paste0("adjust_row_padding('", pad, "')"),
      caption  = "Source: tableService test script"
    )

  fname <- paste0("test_outputs/06_padding_", pad, ".html")
  gtsave(tbl_pad, fname)
  cat("Saved:", fname, "\n")
}


# ── 8. Grouped rows ──────────────────────────────────────────────
tbl_grouped <- achv_data %>%
  gt(groupname_col = "operating_unit") %>%
  ts_gt_base() %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping() %>%
  add_labs(
    title    = "Grouped Rows by Operating Unit",
    subtitle = "Row groups styled with BDO charcoal + Trebuchet MS",
    caption  = "Source: tableService test script"
  )

gtsave(tbl_grouped, "test_outputs/07_grouped_rows.html")
cat("Saved: test_outputs/07_grouped_rows.html\n")


# ── 9. Custom header colors using BDO tokens ─────────────────────
tbl_burgundy <- achv_data %>%
  gt() %>%
  ts_gt_base(
    header_fill       = bdo_burgundy,
    header_font_color = "white",
    table_font_color  = bdo_slate_2
  ) %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping() %>%
  add_labs(
    title    = "Burgundy Header Variant",
    subtitle = paste0("header_fill = bdo_burgundy (", bdo_burgundy, ")"),
    caption  = "Source: tableService test script"
  )

gtsave(tbl_burgundy, "test_outputs/08_burgundy_header.html")
cat("Saved: test_outputs/08_burgundy_header.html\n")

tbl_ocean <- achv_data %>%
  gt() %>%
  ts_gt_base(
    header_fill       = bdo_ocean_deep,
    header_font_color = "white",
    table_font_color  = bdo_charcoal
  ) %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping() %>%
  add_labs(
    title    = "Ocean Deep Header Variant",
    subtitle = paste0("header_fill = bdo_ocean_deep (", bdo_ocean_deep, ")"),
    caption  = "Source: tableService test script"
  )

gtsave(tbl_ocean, "test_outputs/09_ocean_header.html")
cat("Saved: test_outputs/09_ocean_header.html\n")

tbl_jade <- achv_data %>%
  gt() %>%
  ts_gt_base(
    header_fill       = bdo_jade_deep,
    header_font_color = "white",
    table_font_color  = bdo_charcoal
  ) %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping(stripe_color = bdo_jade_soft) %>%
  add_labs(
    title    = "Jade Header Variant",
    subtitle = paste0("header_fill = bdo_jade_deep (", bdo_jade_deep, ")"),
    caption  = "Source: tableService test script"
  )

gtsave(tbl_jade, "test_outputs/10_jade_header.html")
cat("Saved: test_outputs/10_jade_header.html\n")


# ── 10. si_gt_base backward compatibility ────────────────────────
tbl_compat <- achv_data %>%
  gt() %>%
  si_gt_base() %>%
  format_numeric_columns() %>%
  add_labs(
    title    = "Backward Compatibility: si_gt_base()",
    subtitle = "si_gt_base() is an alias for ts_gt_base()",
    caption  = "Source: tableService test script"
  )

gtsave(tbl_compat, "test_outputs/11_si_gt_base_compat.html")
cat("Saved: test_outputs/11_si_gt_base_compat.html\n")


# ── 11. Full kitchen-sink table ───────────────────────────────────
tbl_kitchen <- achv_data %>%
  gt(groupname_col = "operating_unit") %>%
  ts_gt_base() %>%
  format_numeric_columns() %>%
  align_columns() %>%
  apply_row_striping() %>%
  adjust_row_padding("condensed") %>%
  add_labs(
    title    = "Kitchen Sink: All Features Combined",
    subtitle = "BDO theme + formatting + alignment + striping + condensed padding",
    caption  = "Source: tableService test script | BDO palette v1"
  )

gtsave(tbl_kitchen, "test_outputs/12_kitchen_sink.html")
cat("Saved: test_outputs/12_kitchen_sink.html\n")


# ── Summary ───────────────────────────────────────────────────────
cat("\n", strrep("─", 60), "\n")
cat("All test tables saved to test_outputs/\n")
cat("Open them in a browser to verify BDO colors and Trebuchet MS font.\n")
cat(strrep("─", 60), "\n")
