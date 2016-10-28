#' @title Backport of dir.exists for R < 3.2.0
#'
#' @description
#' See the original description in \code{base::dir.exists}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(dir.exists)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_dir.exists = getFromNamespace("dir.exists", "backports")
#'
#' bp_dir.exists(tempdir())
dir.exists = function(paths) {
  x = base::file.info(paths)$isdir
  !is.na(x) & x
}
