#' @title Backport of endsWith
#' @rdname endsWith
#'
#' @description
#' See the original description in \code{base::endsWith}.
#'
#' @param x
#'  See description.
#' @param suffix
#'  See description.
#' @rawNamespace if (getRversion() < "3.3.0") export(endsWith)
endsWith = function(x, suffix) {
  if (!is.character(x) || !is.character(suffix))
    stop("non-character object(s)")
  i = !nzchar(suffix)
  suffix[i] = NA_character_
  res = suppressWarnings(stringi::stri_endswith_fixed(x, suffix))
  res[i] = TRUE
  return(res)
}
