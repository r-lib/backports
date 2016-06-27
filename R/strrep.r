#' @title Backport of strrep
#' @rdname strrep
#'
#' @description
#' See the original description in \code{base::strrep}.
#'
#' @param x
#'  See description.
#' @param times
#'  See description.
#' @rawNamespace if (getRversion() < "3.3.0") export(strrep)
strrep = function(x, times) {
  x = as.character(x)
  if (length(x) == 0L)
    return(x)
  unlist(.mapply(function(x, times) {
    if (is.na(x) || is.na(times))
      return(NA_character_)
    if (times <= 0L)
      return("")
    paste0(replicate(times, x), collapse = "")
  }, list(x = x, times = times), MoreArgs = list()), use.names = FALSE)
}
