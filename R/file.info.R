#' @title Backport of \code{file.info} for R < 3.2.0
#'
#' @description
#' Argument \code{extra_cols} has been backported.
#' See the original description in \code{base::file.info}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(file.info)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_file.info = getFromNamespace("file.info", "backports")
#'
#' bp_file.info(file.path(R.home(), "COPYING"), extra_cols = FALSE)
file.info = function (..., extra_cols = TRUE) {
  if (isTRUE(extra_cols))
    base::file.info(...)
  else
    base::file.info(...)[, 1:6, drop = FALSE]
}
