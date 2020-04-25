#' @title Backport of list2DF for R < 4.0.0
#'
#' @description
#' See the original description in \code{base::R_user_dir}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.0.0") export(R_user_dir)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_list2DF = getFromNamespace("list2DF", "backports")
#'
#' bp_R_user_dir("backports")
list2DF <- function (x = list(), nrow = NULL) {
  stopifnot(is.list(x), is.null(nrow) || nrow >= 0L)
  if (n <- length(x)) {
    if (is.null(nrow)) {
      nrow <- max(lengths(x), 0L)
    }
    x <- lapply(x, rep_len, nrow)
  }
  else {
    if (is.null(nrow)) {
      nrow <- 0L
    }
  }
  if (is.null(names(x))) {
    names(x) <- character(n)
  }
  class(x) <- "data.frame"
  attr(x, "row.names") <- if (nrow > 0) c(NA_integer_, -n) else integer()
  x
}