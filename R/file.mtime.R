#' @rdname file.size
#' @rawNamespace if (getRversion() < "3.2.0") export(file.mtime)
file.mtime = function(...) {
  base::file.info(...)$mtime
}
