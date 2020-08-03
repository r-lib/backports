#' @title Backport of str2lang for R < 3.6.0
#' @rdname str2lang
#'
#' @description
#' See the original description in \code{base::str2lang}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(str2lang)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' str2lang <- getFromNamespace("str2lang", "backports")
#'
#' str2lang("x[3] <- 1+4")
str2lang       <- function(s) {
  stopifnot(length(s) == 1L)
  ex <- parse(text=s, keep.source=FALSE)
  stopifnot(length(ex) == 1L)
  ex[[1L]]
}
