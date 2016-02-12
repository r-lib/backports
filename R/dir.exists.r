#' @title Backport of lengths
#'
#' @description
#' See the original description in \code{\link[base]{dir.exists}}.
#'
#' @param paths
#'  See description.
#' @export
dir.exists = NULL

dir.exists_backport = function(paths) {
  x = file.info(paths)$isdir
  !is.na(x) & x
}
