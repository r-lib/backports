#' @title Backport of strrep
#' @rdname strrep
#'
#' @description
#' See the original description in \code{base::strrep}.
#'
#' @param x
#'  See description.
#' @param times
#'  See description.
#' @rawNamespace if (getRversion() < "3.3.0") export(strrep)
strrep = function(x, times) {
  stringi::stri_dup(x, times)
}
