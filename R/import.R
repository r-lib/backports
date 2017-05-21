#' @title Import backported functions into your package
#'
#' @description
#' Imports objects from \pkg{backports} into the namespace of other packages
#' by assigning it during load-time.
#' See examples for a code snippet to copy to your package.
#'
#' @param pkgname [\code{character(1)}]\cr
#'   Name of the package where the backported function should be assigned.
#' @param obj [\code{character}]\cr
#'   Name of objects to assign, as character vector.
#'   If \code{NULL}, all backports which are not provided by R itself are assigned.
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
#' }
import = function(pkgname, obj = NULL) {
  if (getRversion() < "3.4.0") {
    pkg = getNamespace(pkgname)
    backports = getNamespace("backports")

    assignIfNotExists = function(x, where) {
      if (!exists(x, envir = where))
        assign(x, get(x, envir = backports), envir = pkg)
    }

    if (!is.null(obj)) {
      BASE = intersect(BASE, obj)
      UTILS = intersect(UTILS, obj)
    }

    lapply(BASE, assignIfNotExists, where = baseenv())
    lapply(UTILS, assignIfNotExists, where = getNamespace("utils"))
  }
  invisible(TRUE)
}

# constants used in import()
BASE = c("anyNA", "dir.exists", "endsWith", "file.info", "file.mode", "file.mtime", "file.size", "get0", "lengths", "startsWith", "strrep", "trimws")
UTILS = "hasName"
