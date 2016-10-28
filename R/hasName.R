#' @title Backport of hasName for R < 3.4.0
#' @rdname hasName
#'
#' @description
#' See the original description in \code{utils::hasName}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.4.0") export(hasName)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_hasName = getFromNamespace("hasName", "backports")
#'
#' bp_hasName(list(a = 1, b = 2), c("a", "b", "c"))
hasName = function(x, name) {
  match(name, names(x), nomatch = 0L) > 0L
}
