#' @title Backport of startsWith
#' @rdname startsWith
#'
#' @description
#' See the original description in \code{base::startsWith}.
#'
#' @param x
#'  See description.
#' @param prefix
#'  See description.
#' @rawNamespace if (getRversion() < "3.3.0") export(startsWith)
startsWith = function(x, prefix) {
  if (!is.character(x) || !is.character(prefix))
    stop("non-character object(s)")
  suppressWarnings(substr(x, 1L, nchar(prefix)) == prefix)
}
