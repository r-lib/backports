#' @rdname file.size
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(file.mode)
file.mode = function(...) {
  base::file.info(...)$mode
}
