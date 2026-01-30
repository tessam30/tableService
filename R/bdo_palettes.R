#' BDO color tokens and palettes
#'
#' A set of BDO-aligned color tokens and pre-built palettes intended for
#' data visualization in TPM reporting workflows.
#'
#' @details
#' The objects exported here are:
#' \itemize{
#'   \item \code{bdo_colors}: named vector of single color tokens (hex).
#'   \item \code{bdo_palettes}: named list of palette vectors (hex).
#' }
#'
#' @name bdo_palettes
#' @rdname bdo_palettes
#'
#' @format
#' \describe{
#'   \item{bdo_colors}{A named character vector of hex color tokens.}
#'   \item{bdo_palettes}{A named list of character vectors (palettes).}
#' }
#'
#' @examples
#' # Inspect available tokens
#' bdo_colors
#'
#' # Use a tint palette in ggplot2
#' # ggplot(...) + scale_color_manual(values = bdo_palettes$blues_t)
#'
#' # Diverging palette
#' bdo_palettes$divergent
NULL

# ---- Single color tokens (hex) ----
bdo_red           <- "#e81a3b"
bdo_charcoal      <- "#333333"
bdo_slate_2       <- "#5b6e7f"
bdo_burgundy      <- "#98002e"
bdo_pale_charcoal <- "#e7e7e7"

bdo_gold   <- "#d67900"
bdo_jade   <- "#009966"
bdo_ocean2 <- "#008fd2"

bdo_red_tint <- "#F66A68"
bdo_red_soft <- "#FB8680"

bdo_ocean_deep <- "#006FA6"
bdo_ocean_soft <- "#5FB3E3"

bdo_gold_muted <- "#E1A95F"

bdo_jade_deep <- "#007A52"
bdo_jade_soft <- "#6FC3A1"

bdo_slate_teal  <- "#5F8F8B"
bdo_neutral_pale <- "#EEF4F3"

#' BDO color tokens (hex)
#'
#' Named vector of BDO-aligned color tokens.
#'
#' @rdname bdo_palettes
#' @export
bdo_colors <- c(
  bdo_red           = bdo_red,
  bdo_charcoal      = bdo_charcoal,
  bdo_slate_2       = bdo_slate_2,
  bdo_burgundy      = bdo_burgundy,
  bdo_pale_charcoal = bdo_pale_charcoal,
  bdo_gold          = bdo_gold,
  bdo_jade          = bdo_jade,
  bdo_ocean2        = bdo_ocean2,
  bdo_red_tint      = bdo_red_tint,
  bdo_red_soft      = bdo_red_soft,
  bdo_ocean_deep    = bdo_ocean_deep,
  bdo_ocean_soft    = bdo_ocean_soft,
  bdo_gold_muted    = bdo_gold_muted,
  bdo_jade_deep     = bdo_jade_deep,
  bdo_jade_soft     = bdo_jade_soft,
  bdo_slate_teal    = bdo_slate_teal,
  bdo_neutral_pale  = bdo_neutral_pale
)

# ---- Palette vectors ----
bdo_blues_t <- c(
  "#008fd2", "#3f9dd9", "#5eabe1", "#78b9e8", "#91c7f0", "#a8d6f7", "#bfe4ff"
)

bdo_oranges_t <- c(
  "#d67900", "#df882f", "#e8984c", "#efa868", "#f6b883", "#fbc89e", "#ffd8ba"
)

bdo_greens_t <- c(
  "#009966", "#39a777", "#57b488", "#71c299", "#8ad0ab", "#a2ddbd", "#baebd0"
)

bdo_reds_t <- c(
  "#e81a3b", "#f04a51", "#f66a68", "#fb8680", "#fea098", "#ffb9b2", "#ffd2cd"
)

bdo_divergent <- c(
  "#d67900", "#e4964c", "#edb482", "#f2d2b9", "#f1f1f1",
  "#c0dbcc", "#90c6a9", "#5baf87", "#009966"
)

#' BDO palettes (tints and diverging)
#'
#' Named list of palettes aligned to the BDO color system.
#'
#' @rdname bdo_palettes
#' @export
bdo_palettes <- list(
  blues_t    = bdo_blues_t,
  oranges_t  = bdo_oranges_t,
  greens_t   = bdo_greens_t,
  reds_t     = bdo_reds_t,
  divergent  = bdo_divergent
)
