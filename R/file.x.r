#' @title Backports of wrappers around \code{file.info}
#' @rdname file.size
#'
#' @description
#' See the original description in \code{base::file.size}.
#'
#' @param ...
#'  See description.
#' @rawNamespace if (getRversion() < "3.2.0") export(file.size)
file.size = function(...) file.info(...)$size

#' @rdname file.size
#' @rawNamespace if (getRversion() < "3.2.0") export(file.mode)
file.mode = function(...) file.info(...)$mode

#' @rdname file.size
#' @rawNamespace if (getRversion() < "3.2.0") export(file.mtime)
file.mtime = function(...) file.info(...)$mtime
