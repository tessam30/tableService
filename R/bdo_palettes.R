#' BDO color tokens and palettes
#'
#' A set of BDO-aligned color tokens and pre-built palettes intended for
#' data visualization in TPM reporting workflows. Every token and palette
#' vector is exported individually so you can use them directly
#' (e.g. \code{bdo_ocean_deep}) without subsetting.
#'
#' @details
#' The objects exported here are:
#' \itemize{
#'   \item Individual color tokens (e.g. \code{bdo_red}, \code{bdo_ocean_deep}).
#'   \item \code{bdo_colors}: named vector of all color tokens (hex).
#'   \item Individual palette vectors (e.g. \code{bdo_blues_t}).
#'   \item \code{bdo_palettes}: named list of all palette vectors (hex).
#' }
#'
#' @name bdo_palettes
#' @rdname bdo_palettes
#'
#' @examples
#' # Use a single token directly
#' bdo_ocean_deep
#'
#' # Inspect all tokens
#' bdo_colors
#'
#' # Use a tint palette in ggplot2
#' # ggplot(...) + scale_color_manual(values = bdo_blues_t)
#'
#' # Diverging palette
#' bdo_palettes$divergent
NULL

# ---- Single color tokens (hex) ----

#' @rdname bdo_palettes
#' @export
bdo_red <- "#e81a3b"

#' @rdname bdo_palettes
#' @export
bdo_charcoal <- "#333333"

#' @rdname bdo_palettes
#' @export
bdo_slate_2 <- "#5b6e7f"

#' @rdname bdo_palettes
#' @export
bdo_burgundy <- "#98002e"

#' @rdname bdo_palettes
#' @export
bdo_pale_charcoal <- "#e7e7e7"

#' @rdname bdo_palettes
#' @export
bdo_gold <- "#d67900"

#' @rdname bdo_palettes
#' @export
bdo_jade <- "#009966"

#' @rdname bdo_palettes
#' @export
bdo_ocean2 <- "#008fd2"

#' @rdname bdo_palettes
#' @export
bdo_red_tint <- "#F66A68"

#' @rdname bdo_palettes
#' @export
bdo_red_soft <- "#FB8680"

#' @rdname bdo_palettes
#' @export
bdo_ocean_deep <- "#006FA6"

#' @rdname bdo_palettes
#' @export
bdo_ocean_soft <- "#5FB3E3"

#' @rdname bdo_palettes
#' @export
bdo_gold_muted <- "#E1A95F"

#' @rdname bdo_palettes
#' @export
bdo_jade_deep <- "#007A52"

#' @rdname bdo_palettes
#' @export
bdo_jade_soft <- "#6FC3A1"

#' @rdname bdo_palettes
#' @export
bdo_slate_teal <- "#5F8F8B"

#' @rdname bdo_palettes
#' @export
bdo_neutral_pale <- "#EEF4F3"

#' BDO color tokens (named vector)
#'
#' Named vector containing all BDO-aligned color tokens.
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

#' @rdname bdo_palettes
#' @export
bdo_blues_t <- c(
  "#008fd2", "#3f9dd9", "#5eabe1", "#78b9e8", "#91c7f0", "#a8d6f7", "#bfe4ff"
)

#' @rdname bdo_palettes
#' @export
bdo_oranges_t <- c(
  "#d67900", "#df882f", "#e8984c", "#efa868", "#f6b883", "#fbc89e", "#ffd8ba"
)

#' @rdname bdo_palettes
#' @export
bdo_greens_t <- c(
  "#009966", "#39a777", "#57b488", "#71c299", "#8ad0ab", "#a2ddbd", "#baebd0"
)

#' @rdname bdo_palettes
#' @export
bdo_reds_t <- c(
  "#e81a3b", "#f04a51", "#f66a68", "#fb8680", "#fea098", "#ffb9b2", "#ffd2cd"
)

#' @rdname bdo_palettes
#' @export
bdo_divergent <- c(
  "#d67900", "#e4964c", "#edb482", "#f2d2b9", "#f1f1f1",
  "#c0dbcc", "#90c6a9", "#5baf87", "#009966"
)

#' BDO palettes (named list)
#'
#' Named list of all palettes aligned to the BDO color system.
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
