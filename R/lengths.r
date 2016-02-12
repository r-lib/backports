#' @title Backport of lengths
#' @export
lengths = function(x, use.names = TRUE) {
  vapply(x, length, FUN.VALUE = NA_integer_, USE.NAMES = use.names)
}
