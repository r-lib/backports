#' @title Backport of lengths
#' @rdname dir.exists
#'
#' @description
#' See the original description in \code{base::dir.exists}.
#'
#' @param paths
#'  See description.
#' @rawNamespace if (getRversion() < "3.2.0") export(dir.exists)
dir.exists = function(paths) {
  x = file.info(paths)$isdir
  !is.na(x) & x
}
