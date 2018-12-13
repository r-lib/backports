#' @importFrom utils getFromNamespace tail
"_PACKAGE"

.onUnload = function (libpath) {
  library.dynam.unload("backports", libpath)
}
