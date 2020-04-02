#' @title Backport of capture.output for R < 3.3.0
#'
#' @description
#' Argument \code{type} has been backported.
#' See the original description in \code{utils::capture.output}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.3.0") export(capture.output)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_capture.output <- getFromNamespace("capture.output", "backports")
#'
#' captured <- bp_capture.output({ message("hi") }, type = "message")
#' str(captured)
capture.output <- function(..., file=NULL, append=FALSE, type = c("output", "message"), split = FALSE) {
  args <- substitute(list(...))[-1L]
  type <- match.arg(type)
  rval <- NULL; closeit <- TRUE
  if (is.null(file))
    file <- textConnection("rval", "w", local = TRUE)
  else if (is.character(file))
    file <- file(file, if(append) "a" else "w")
  else if (inherits(file, "connection")) {
    if (!isOpen(file))
      open(file, if(append) "a" else "w")
    else
      closeit <- FALSE
  } else {
    stop("'file' must be NULL, a character string or a connection")
  }

  sink(file, type=type, split=split)
  ## for error recovery: all output will be lost if file=NULL
  on.exit({sink(type=type, split=split); if(closeit) close(file)})

  pf <- parent.frame()
  evalVis <- function(expr) withVisible(eval(expr, pf))

  for(i in seq_along(args)) {
    expr <- args[[i]]
    tmp <- switch(mode(expr),
      "expression" = lapply(expr, evalVis),
      "call" =, "name" =  list(evalVis(expr)),
      stop("bad argument")
    )
    for(item in tmp)
      if (item$visible) print(item$value)
  }
  ## we need to close the text connection before returning 'rval'
  on.exit()
  sink(type=type, split=split)
  if(closeit)
    close(file)
  if(is.null(rval)) invisible(NULL) else rval
}
