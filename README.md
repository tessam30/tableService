## tableService <img src='man/figures/logo.png' align="right" height="120" />

Custom styled gt themes to adorn your tables with a modern, polished look.

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

### About tableService

The `tableService` package makes it easy to create pre-formatted gt tables with a
clean, modern aesthetic. It provides a base theme, formatting helpers, and utility
functions for building publication-ready tables.

**New Color Scheme:**
- Deep navy headers (`#2C3E50`)
- Teal accents (`#1ABC9C`)
- Clean typography with Roboto font family

### Installing tableService

`tableService` is not on CRAN, so you will need to install it directly from GitHub.

``` r
# install from GitHub using pak
install.packages("pak")
pak::pak("tessam30/tableService")
```

### Core Functions

- `ts_gt_base()` - Apply the tableService base theme to a gt table
- `format_numeric_columns()` - Auto-format numbers and percentages
- `align_columns()` - Align columns by data type
- `apply_row_striping()` - Add alternating row shading
- `adjust_row_padding()` - Control row density
- `add_labs()` - Quickly add title, subtitle, and source notes
- `render_column_as_image()` - Display images in table columns
