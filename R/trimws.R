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
  mysub = function(re, x) sub(re, "", x, perl = TRUE)
  if (which == "left")
    return(mysub("^[ \t\r\n]+", x))
  if (which == "right")
    return(mysub("[ \t\r\n]+$", x))
  mysub("[ \t\r\n]+$", mysub("^[ \t\r\n]+", x))
}
