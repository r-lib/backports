#' @importFrom utils getFromNamespace
NULL

.onUnload = function (libpath) {
  library.dynam.unload("backports", libpath)
}
