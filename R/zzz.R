#' @importFrom utils getFromNamespace head
"_PACKAGE"

.onUnload = function (libpath) {
  library.dynam.unload("backports", libpath)
}
