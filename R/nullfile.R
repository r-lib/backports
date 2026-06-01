#' @title Backport of nullfile for R < 3.6.0
#'
#' @description
#' See the original description in \code{base::nullfile}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(nullfile)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_nullfile = getFromNamespace("nullfile", "backports")
#'
#' bp_nullfile()
nullfile = function() {
  if (.Platform$OS.type == "windows") "nul:" else "/dev/null"
}
