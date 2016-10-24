#' @rdname file.size
#' @rawNamespace if (getRversion() < "3.2.0") export(file.mode)
file.mode = function(...) {
  base::file.info(...)$mode
}
