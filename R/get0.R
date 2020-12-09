#' @title Backport of get0 for R < 3.2.0
#' @rdname get0
#'
#' @description
#' See the original description in \code{base::get0}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(get0)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_get0 = getFromNamespace("get0", "backports")
#'
#' bp_get0("a")
#' bp_get0("a", ifnotfound = 0)
#'
#' foo = 12
#' bp_get0("foo")
get0 = function(x, envir = pos.to.env(-1L), mode = "any", inherits = TRUE, ifnotfound = NULL) {
  if (!is.character(x) || length(x) == 0L) {
    stop("Invalid first argument")
  }
  if (length(x) > 1L && getRversion() >= "4.1.0") {
    # this check was introduced in R-4.1.0
    # We can remove the version check as soon as all CRAN packages have been updated,
    # i.e. as soon as 4.1.0 is released
    stop("first argument has length > 1")
  }
  mget(x[1L], envir = envir, mode = mode, inherits = inherits, ifnotfound = list(ifnotfound))[[1L]]
}
