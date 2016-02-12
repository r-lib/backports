#' @title Backport of lengths
#'
#' @description
#' See the original description in \code{\link[base]{trimws}}.
#'
#' @param x
#'  See description.
#' @param use.names
#'  See description.
#' @export
lengths = NULL

lengths_backport = function(x, use.names = TRUE) {
  vapply(x, length, FUN.VALUE = NA_integer_, USE.NAMES = use.names)
}
