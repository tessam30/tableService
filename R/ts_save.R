#' Save a gt table with sensible defaults
#'
#' @description
#' Wrapper around \code{gt::gtsave()} with convenient defaults for common
#' output formats. Supports HTML and PNG. Automatically creates the output
#' directory if it does not exist.
#'
#' @param gt_object An existing gt table object of class `gt_tbl`
#' @param filename Output filename (e.g. `"my_table.html"` or `"my_table.png"`).
#' @param path Output directory. Default `"table_outputs"`.
#' @param ... Additional arguments passed to \code{gt::gtsave()}.
#'
#' @return The gt object (invisibly), for continued piping.
#' @export
#'
#' @examples
#' # achv_data %>% gt() %>% ts_gt_base() %>% ts_save("achv_table.html")
#' # achv_data %>% gt() %>% ts_gt_base() %>% ts_save("achv_table.png")
ts_save <- function(gt_object,
                    filename,
                    path = "table_outputs",
                    ...) {

  check_gt_object(gt_object)

  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }

  gt::gtsave(gt_object, filename = filename, path = path, ...)

  cli::cli_alert_success("Saved: {.file {file.path(path, filename)}}")

  invisible(gt_object)
}
