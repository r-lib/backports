#' @title Backport of the null-coalescing operator for R < 4.4.0
#' @name null_coalesce_operator
#' @rdname null_coalesce_operator
#'
#' @usage x \%||\% y
#'
#' @description
#' See the original description in \code{Control}.
#'
#' @param x (any).
#' @param y (any).
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.4.0") export(`%||%`)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_null_coalesce = getFromNamespace("%||%", "backports")
#'
#' bp_null_coalesce(NULL, FALSE)
"%||%" = function(x, y) {
  if (is.null(x)) y else x
}
