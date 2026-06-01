#' @title Backport of the not-in operator for R < 4.6.0
#' @name notin_operator
#' @rdname notin_operator
#'
#' @usage x \%notin\% table
#'
#' @description
#' See the original description in \code{match}.
#'
#' @param x (any).
#' @param table (any).
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.6.0") export(`%notin%`)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_notin = getFromNamespace("%notin%", "backports")
#'
#' bp_notin(1, 2:4)
"%notin%" = function(x, table) {
  !match(x, table, nomatch = 0L)
}
