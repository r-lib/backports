#' @title Backport of .libPaths for R < 4.1.0
#' @rdname libPaths
#'
#' @description
#' See the original description in \code{base::.libPaths}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.1.0") export(.libPaths)
#' @examples
#' save <- .libPaths()
#' save
#' # ignore the site library
#' .libPaths("test", include.site = FALSE)
#'
#' # restore the original
#' .libPaths(save)

.libPaths <- local({
  .lib.loc <- character() # This won't be used; see below
  function(new, include.site = TRUE) {
  if(!missing(new)) {
    ## paths don't really need to be unique, but searching
    ## large library trees repeatedly would be inefficient.
    ## Use normalizePath for display
    new <- Sys.glob(path.expand(new))
    paths <- c(new, if(include.site) .Library.site, .Library)
    paths <- paths[dir.exists(paths)]
    .lib.loc <<- unique(normalizePath(paths, "/"))
  }
  else
    .lib.loc
}})

# Run this in .onLoad:

# environment(.libPaths) <- environment(base::.libPaths)

# This will make our function see and modify the base
# function's copy of .lib.loc.  This relies on the
# implementation in base, which has been the 
# same since R 1.6.0 or earlier.
