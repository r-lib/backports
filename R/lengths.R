#' @title Backport of lengths
#' @rdname lengths
#'
#' @description
#' See the original description in \code{base::trimws}.
#'
#' @param x
#'  See description.
#' @param use.names
#'  See description.
#' @rawNamespace if (getRversion() < "3.3.0") export(lengths)
lengths = function(x, use.names = TRUE) {
  vapply(x, length, FUN.VALUE = NA_integer_, USE.NAMES = use.names)
}
