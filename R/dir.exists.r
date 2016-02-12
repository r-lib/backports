#' @title Backport of lengths
#' @export
dir.exists = function(paths) {
  x = file.info(paths)$isdir
  !is.na(x) & x
}
