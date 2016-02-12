.onLoad = function(libname, pkgname) {
  r.version = getRversion()
  if (r.version > "3.2.0") {
    dir.exists <<- base::dir.exists
    trimws <<- base::trimws
    anyNA <<- base::anyNA
  }

  if (r.version > "3.2.1") {
    lengths <<- base::lengths
  }
}
