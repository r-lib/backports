#' @title Backport of \code{file.info}
#'
#' @description
#' Argument \code{extra_cols} has been backported.
#' See the original description in \code{base::file.info}.
#'
#' @param ...
#'  See description.
#' @param extra_cols
#'  See description.
#' @rawNamespace if (getRversion() < "3.2.0") export(file.info)
file.info = function (..., extra_cols = TRUE) {
  if (isTRUE(extra_cols))
    base::file.info(...)
  else
    base::file.info(...)[, 1:6, drop = FALSE]
}
