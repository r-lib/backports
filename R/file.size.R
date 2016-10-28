#' @title Backports of wrappers around \code{file.info} for R < 3.2.0
#' @rdname file.size
#'
#' @description
#' See the original description in \code{base::file.size}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(file.size)
#' @examples
#' # get functions from namespace instead of possibly getting
#' # implementations shipped with recent R versions:
#' bp_file.size = getFromNamespace("file.size", "backports")
#' bp_file.mode = getFromNamespace("file.size", "backports")
#' bp_file.mtime = getFromNamespace("file.size", "backports")
#'
#' fn = file.path(R.home(), "COPYING")
#' bp_file.size(fn)
#' bp_file.mode(fn)
#' bp_file.size(fn)
file.size = function(...) {
  base::file.info(...)$size
}
