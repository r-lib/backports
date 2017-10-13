#' @importFrom utils getFromNamespace tail
NULL

.onUnload = function (libpath) {
  library.dynam.unload("backports", libpath)
}
