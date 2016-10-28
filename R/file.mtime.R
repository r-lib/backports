#' @rdname file.size
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(file.mtime)
file.mtime = function(...) {
  base::file.info(...)$mtime
}
