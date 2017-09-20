#' @title Backport of isFALSE for R < 3.4.2
#' @rdname isFALSE
#'
#' @description
#' See the original description in \code{base::isFALSE}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.5.0") export(isFALSE)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_isFALSE = getFromNamespace("isFALSE", "backports")
#'
#' bp_isFALSE(FALSE)
#' bp_isFALSE(iris)
isFALSE = function(x) {
  is.logical(x) && length(x) == 1L && !is.na(x) && !x
}
