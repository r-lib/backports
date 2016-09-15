#' @title Backport of anyNA
#' @rdname anyNA
#'
#' @description
#' See the original description in \code{base::anyNA}.
#'
#' @param x
#'  See description.
#' @param recursive
#'  See description.
#' @rawNamespace if (getRversion() < "3.2.0") export(anyNA)
anyNA = function(x, recursive = FALSE) {
  if (isTRUE(recursive) && (is.list(x) || is.pairlist(x)))
    return(any(rapply(x, anyNA, how = "unlist", recursive = FALSE)))
  any(is.na(x))
}
