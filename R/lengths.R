#' @title Backport of lengths for R < 3.2.0
#' @rdname lengths
#'
#' @description
#' See the original description in \code{base::lengths}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.3.0") export(lengths)
#' @examples
#' bp_lengths = getFromNamespace("lengths", "backports")
#' bp_lengths(list(1:3, 2))
lengths = function(x, use.names = TRUE) {
  vapply(x, length, FUN.VALUE = NA_integer_, USE.NAMES = use.names)
}
