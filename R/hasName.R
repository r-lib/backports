#' @title Backport of hasName
#' @rdname hasName
#'
#' @description
#' See the original description in \code{utils::hasName}.
#'
#' @param x
#'  See description.
#' @param name
#'  See description.
#' @rawNamespace if (getRversion() < "3.4.0") export(hasName)
hasName = function(x, name) {
  match(name, names(x), nomatch = 0L) > 0L
}
