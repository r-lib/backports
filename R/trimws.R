#' @title Backport of trimws for R < 3.3.0
#' @rdname trimws
#'
#' @description
#' See the original description in \code{base::trimws}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(trimws)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_trimws = getFromNamespace("trimws", "backports")
#' bp_trimws(c("  a  ", "b  ", "  c"))
#'
#' bp_trimws(c("  a  ", "b  ", "  c"), which = "left")
trimws = function(x, which = c("both", "left", "right")) {
  which = match.arg(which)
  if (which %in% c("left", "both"))
    x = gsub("^[[:space:]]", "", x)
  if (which %in% c("right", "both"))
    x = gsub("[[:space:]]$", "", x)
  return(x)
}
