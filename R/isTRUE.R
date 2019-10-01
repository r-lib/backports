#' @title Backport of isTRUE for R < 3.5.0
#' @rdname isTRUE
#'
#' @description
#' The implementation of `isTRUE` has been changed in R-3.5.0 from
#' \code{identical(x, TRUE)} to \code{is.logical(x) && length(x) == 1L && !is.na(x) && x}.
#' This backport overloads the old implementation for R versions prior to 3.5.0.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.5.0") export(isTRUE)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_isTRUE = getFromNamespace("isTRUE", "backports")
#'
#' bp_isTRUE(FALSE)
#' bp_isTRUE(iris)
isTRUE = function(x) {
  is.logical(x) && length(x) == 1L && !is.na(x) && x
}
