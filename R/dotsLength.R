#' @title Backport of ...length for R < 3.4.2
#' @rdname dotsLength
#'
#' @description
#' See the original description in \code{base::...length}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.5.0") export(...length)
#' @useDynLib backports dotsLength
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_...length = getFromNamespace("...length", "backports")
#'
#' foo = function(...) bp_...length()
#' foo(1, 2, 3)
...length = function() {
  .Call(dotsLength, parent.frame())
}
