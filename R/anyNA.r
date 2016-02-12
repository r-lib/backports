#' @title Backport of anyNA
#' @export
anyNA = function(x, recursive = FALSE) {
  if (recursive && (is.list(x) || is.pairlist(x))) {
    return(any(rapply(x, anyNA, how = "unlist", recursive = FALSE)))
  }
  any(is.na(x))
}
# x = list(1, 2, list(3, 4, list(NA)))
# recursive = TRUE
# anyNA(x, recursive = recursive)
# anyNA2(x, recursive = recursive)
