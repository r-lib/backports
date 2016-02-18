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
  if (!nzchar(prefix))
    return(rep_len(TRUE, length(x)))
  stringi::stri_startswith_fixed(x, prefix)
}
