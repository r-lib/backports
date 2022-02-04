#' @title Backport of lengths for R < 3.2.0
#' @rdname lengths
#'
#' @description
#' See the original description in \code{base::lengths}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(lengths)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_lengths = getFromNamespace("lengths", "backports")
#'
#' bp_lengths(list(1:3, 2))
lengths = function(x, use.names = TRUE) {
  ans <- sapply(x, length, USE.NAMES = FALSE)
  if (!isTRUE(use.names)) {
    names(ans) <- NULL
  }
  ans
}
