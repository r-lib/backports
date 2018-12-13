#' @title Backport of warningCondition and errorCondition for R < 3.6.0
#' @rdname warningCondition
#'
#' @description
#' See the original description in \code{base::warningCondition}/\code{base::errorCondition}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(warningCondition)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_warningCondition = getFromNamespace("warningCondition", "backports")
#' bp_warningCondition("package backports not found")
warningCondition <- function(msg, ..., class = NULL, call = NULL) {
  structure(list(message = msg, call = call, ...),
    class = c(class, "warning", "condition"))
}

#' @rdname warningCondition
#' @rawNamespace if (getRversion() < "3.6.0") export(errorCondition)
errorCondition <- function(msg, ..., class = NULL, call = NULL) {
  structure(list(message = msg, call = call, ...),
    class = c(class, "error", "condition"))
}
