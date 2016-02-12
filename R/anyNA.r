#' @title Backport of anyNA
#'
#' @description
#' See the original description in \code{\link[base]{anyNA}}.
#'
#' @param x
#'  See description.
#' @param recursive
#'  See description.
#' @export
anyNA = NULL

anyNA_backport = function(x, recursive = FALSE) {
  if (isTRUE(recursive) && (is.list(x) || is.pairlist(x)))
    return(any(rapply(x, anyNA, how = "unlist", recursive = FALSE)))
  any(is.na(x))
}
