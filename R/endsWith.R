#' @title Backport of endsWith for R < 3.3.0
#' @rdname endsWith
#'
#' @description
#' See the original description in \code{base::endsWith}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.3.0") export(endsWith)
#' @examples
#' bp_endsWith = getFromNamespace("endsWith", "backports")
#' bp_endsWith(c("aabb", "bbcc"), "bb")
endsWith = function(x, suffix) {
  if (!is.character(x) || !is.character(suffix))
    stop("non-character object(s)")
  n = nchar(x)
  suppressWarnings(substr(x, n - nchar(suffix) + 1L, n) == suffix)
}
