#' @title Backport of grepv for R < 4.5.0
#' @rdname grepv
#'
#' @description
#' See the original description in [grepv()].
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.5.0") export(grepv)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_hasName = getFromNamespace("grepv", "backports")
#'
#' grepv("[a-m]", letters)
grepv = function(
  pattern,
  x,
  ignore.case = FALSE,
  perl = FALSE,
  value = TRUE,
  fixed = FALSE,
  useBytes = FALSE,
  invert = FALSE
) {
  grep(
    pattern = pattern,
    x = x,
    ignore.case = ignore.case,
    perl = perl,
    value = value,
    fixed = fixed,
    useBytes = useBytes,
    invert = invert
  )
}

