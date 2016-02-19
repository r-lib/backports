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
  i = !nzchar(prefix)
  prefix[i] = NA_character_
  res = suppressWarnings(stringi::stri_startswith_fixed(x, prefix))
  res[i] = TRUE
  return(res)
}
