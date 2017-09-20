#' @title Backport of ...elt for R < 3.4.2
#' @rdname dotsElt
#'
#' @description
#' See the original description in \code{base::...elt}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.5.0") export(...elt)
#' @useDynLib backports dotsElt
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_...elt = getFromNamespace("...elt", "backports")
#'
#' foo = function(n, ...) bp_...elt(n)
#' foo(n = 2, "a", "b", "c")
...elt = function(n) {
  .Call(dotsElt, parent.frame(), as.integer(n))
}
