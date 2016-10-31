#' @title Backport of \code{order} for R < 3.3.0
#'
#' @description
#' Allows value \code{"radix"} for argument \code{method}.
#' See the original description in \code{base::order}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.3.0") export(order)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_order = getFromNamespace("order", "backports")
#'
#' x = runif(10)
#' data.frame(x = x, order = bp_order(x, method = "radix"))
order = function (..., na.last = TRUE, decreasing = FALSE, method = c("shell", "radix")) {
  base::order(..., na.last = na.last, decreasing = decreasing)
}
