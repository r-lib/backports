#' @title Backport of anyNA for R versions < 3.2.0.
#'
#' @description
#' See the original description in \code{base::anyNA}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(anyNA)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_anyNA = getFromNamespace("anyNA", "backports")
#'
#' bp_anyNA(letters)
anyNA = function(x, recursive = FALSE) {
  if (isTRUE(recursive) && (is.list(x) || is.pairlist(x)))
    return(any(rapply(x, anyNA, how = "unlist", recursive = FALSE)))
  any(is.na(x))
}
