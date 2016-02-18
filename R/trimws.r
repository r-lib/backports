#' @title Backport of trimws
#' @rdname trimws
#'
#' @description
#' See the original description in \code{\link[base]{trimws}}.
#'
#' @param x
#'  See description.
#' @param which
#'  See description.
#' @rawNamespace if (getRversion() < "3.2.0") export(trimws)
#' @importFrom stringi stri_trim
trimws = function(x, which = c("both", "left", "right")) {
  which = match.arg(which)
  stri_trim(x, side = which)
}
