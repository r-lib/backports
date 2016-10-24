#' @title Backports of wrappers around \code{file.info}
#' @rdname file.size
#'
#' @description
#' See the original description in \code{base::file.size}.
#'
#' @param ...
#'  See description.
#' @rawNamespace if (getRversion() < "3.2.0") export(file.size)
file.size = function(...) {
  base::file.info(...)$size
}
