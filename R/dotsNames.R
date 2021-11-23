#' @title Backport of ...names for R < 4.1.0
#' @rdname dotsNames
#'
#' @description
#' See the original description in \code{base::...names}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.1.0") export(...names)
#' @useDynLib backports dotsNames
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_...names = getFromNamespace("...names", "backports")
#'
#' foo = function(...) bp_...names()
#' foo(a = 1, b = 2, 3)
...names = function() {
  .Call(dotsNames, parent.frame())
}
