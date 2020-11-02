#' @title Backport of removeSource for R < 3.6.0
#' @rdname removeSource
#'
#' @description
#' See the original description in \code{utils::removeSource}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(removeSource)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_removeSource = getFromNamespace("removeSource", "backports")
#'
#' bp_removeSource(mean)
removeSource = function (fn) {
  recurse <- function(part) {
    if (is.name(part))
      return(part)
    attr(part, "srcref") <- NULL
    attr(part, "wholeSrcref") <- NULL
    attr(part, "srcfile") <- NULL
    if (is.language(part) && is.recursive(part)) {
      for (i in seq_along(part)) part[i] <- list(recurse(part[[i]]))
    }
    part
  }
  if (is.function(fn)) {
    if (!is.primitive(fn)) {
      attr(fn, "srcref") <- NULL
      attr(body(fn), "wholeSrcref") <- NULL
      attr(body(fn), "srcfile") <- NULL
      body(fn) <- recurse(body(fn))
    }
    fn
  } else if (is.language(fn)) {
    recurse(fn)
  } else {
    stop("argument is not a function or language object:", typeof(fn))
  }
}
