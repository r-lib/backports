#' @title Import backported functions into your package environment
#'
#' @description
#' Imports objects from \pkg{backports} into the namespace of other packages
#' by assigning it.
#' See examples for a code snippet to add to your package to do this during load-time.
#'
#' @param pkgname [\code{character(1)}]\cr
#'   Name of the package where the function should be assigned.
#' @param obj [\code{character}]\cr
#'   Name of objects to assign, as character vector.
#'   If \code{NULL}, all backports which are not provided by R are assigned.
#' @export
#' @seealso \code{\link[base]{.onLoad}}
#' @examples
#' \dontrun{
#' # This imports all functions implemented in backports while the package is loaded
#' .onLoad <- function(libname, pkgname) {
#'   backports::import(pkgname)
#' }
#'
#' # This only imports the function "trimws"
#' .onLoad <- function(libname, pkgname) {
#'   backports::import(pkgname, "trimws")
#' }
#'}
import = function(pkgname, obj = NULL) {
  pkg = getNamespace(pkgname)
  backports = getNamespace("backports")

  assignIfNotExists = function(x, where) {
    if (!exists(x, envir = where))
      assign(x, get(x, envir = backports), envir = pkg)
  }

  if (!is.null(obj)) {
    bp.base = intersect(bp.base, obj)
    bp.utils = intersect(bp.utils, obj)
  }

  lapply(bp.base, assignIfNotExists, where = baseenv())
  lapply(bp.utils, assignIfNotExists, where = getNamespace("utils"))
  invisible(TRUE)
}

bp.base = c("anyNA", "dir.exists", "endsWith", "file.info", "file.mode", "file.mtime", "file.size", "get0", "lengths", "startsWith", "strrep", "trimws")

bp.utils = "hasName"
