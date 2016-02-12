#' @title Backport of trimws
#'
#' @description
#' See the original description in \code{\link[base]{trimws}}.
#'
#' @param x
#'  See description.
#' @param which
#'  See description.
#' @export
trimws = NULL

trimws_backport = function(x, which = c("both", "left", "right")) {
  which <- match.arg(which)
  mysub <- function(re, x) sub(re, "", x, perl = TRUE)
  if (which == "left")
    return(mysub("^[ \t\r\n]+", x))
  if (which == "right")
    return(mysub("[ \t\r\n]+$", x))
  mysub("[ \t\r\n]+$", mysub("^[ \t\r\n]+", x))
}
