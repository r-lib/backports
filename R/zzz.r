.onLoad = function(libname, pkgname) {
  r.version = getRversion()
  if (r.version > "3.2.0") {
    dir.exists <<- base::dir.exists
    trimws <<- base::trimws
    anyNA <<- base::anyNA
  } else {
    dir.exists <<- dir.exists_backport
    trimws <<- trimws_backport
    anyNA <<- anyNA_backport
  }

  if (r.version > "3.2.1") {
    lengths <<- base::lengths
  } else {
    lengths <<- lengths_backport
  }
}
