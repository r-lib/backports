#' @title Backport of str2expression for R < 3.6.0
#' @rdname str2expression
#'
#' @description
#' See the original description in \code{base::str2expression}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(str2expression)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' str2expression <- getFromNamespace("str2expression", "backports")
#'
#' str2expression("x[3] <- 1+4")
str2expression <- function(text) parse(text=text, keep.source=FALSE)
