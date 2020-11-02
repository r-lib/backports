#' @title Backport of isNamespaceLoaded for R < 3.2.0
#' @rdname isNamespaceLoaded
#'
#' @description
#' See the original description in \code{base::isNamespaceLoaded}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(isNamespaceLoaded)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_isNamespaceLoaded = getFromNamespace("isNamespaceLoaded", "backports")
#'
#' bp_isNamespaceLoaded("backports")
isNamespaceLoaded = function(name) {
  name %in% loadedNamespaces()
}
