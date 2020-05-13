#' @title Backport of deparse1 for R < 4.0.0
#' @rdname deparse1
#'
#' @description
#' See the original description in \code{base::deparse1}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.0.0") export(deparse1)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_deparse1 = getFromNamespace("deparse1", "backports")
#'
#' bp_deparse1(quote(`foo bar`))
deparse1 = function (expr, collapse = " ", width.cutoff = 500L, ...) {
  paste(deparse(expr, width.cutoff, ...), collapse = collapse)
}
