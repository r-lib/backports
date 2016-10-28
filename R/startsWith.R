#' @title Backport of startsWith for R < 3.3.0
#' @rdname startsWith
#'
#' @description
#' See the original description in \code{base::startsWith}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.3.0") export(startsWith)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_startsWith = getFromNamespace("startsWith", "backports")
#'
#' bp_startsWith(c("aabb", "bbcc"), "bb")
startsWith = function(x, prefix) {
  if (!is.character(x) || !is.character(prefix))
    stop("non-character object(s)")
  suppressWarnings(substr(x, 1L, nchar(prefix)) == prefix)
}
