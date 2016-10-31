#' @title Backport of \code{sort} for R < 3.3.0
#'
#' @description
#' Allows value \code{"radix"} for argument \code{method}.
#' See the original description in \code{base::sort}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.3.0") export(sort)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_sort = getFromNamespace("sort", "backports")
#'
#' bp_sort(runif(10), method = "radix")
sort = function (x, decreasing = FALSE, method = c("shell", "quick", "radix"), ...) {
  method = match.arg(method)
  if (identical(method, "radix"))
    method = "shell"
  base::sort(x, decreasing = FALSE, method = method, ...)
}
