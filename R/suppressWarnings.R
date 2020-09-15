#' @title Backport of suppressWarnings and suppressMessages for R < 4.0.0
#' @rdname suppressWarnings
#'
#' @description
#' Backport for new argument `classes`.
#' See the original description in \code{base::suppressWarnings}/\code{base::suppressMessages}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.0.0") export(suppressWarnings)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_suppressWarnings = getFromNamespace("suppressWarnings", "backports")
#' bp_suppressWarnings(warningCondition("warning", class = "testWarning"), "testWarning")
suppressWarnings = function (expr, classes = "warning") {
  withCallingHandlers(expr, warning = function(w)
    if (inherits(w, classes))
      tryInvokeRestart("muffleWarning")
  )
}

#' @rdname suppressWarnings
#' @rawNamespace if (getRversion() < "4.0.0") export(suppressMessages)
suppressMessages = function (expr, classes = "message") {
  withCallingHandlers(expr, message = function(c)
    if (inherits(c, classes))
      tryInvokeRestart("muffleMessage")
  )
}


tryInvokeRestart = function (r, ...) {
  if (!isRestart(r))
    r <- findRestart(r)
  if (is.null(r))
    invisible(NULL)
  else invokeRestart(r, ...)
}
