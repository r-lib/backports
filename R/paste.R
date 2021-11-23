#' @title Backport of paste for R < 4.0.1
#' @rdname paste
#'
#' @description
#' See the original description in \code{base::paste}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.0.1") export(paste)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_paste = getFromNamespace("paste", "backports")
#' x = matrix(1:6, 2, 3)
#' bp_paste(x, 1)
paste <- function(..., sep = " ", collapse = NULL, recycle0 = FALSE) {
  if(recycle0 && any(vapply(list(...), length, FUN.VALUE = NA_integer_) == 0L)) {
    base::paste(sep = sep, collapse = collapse) # for argument checking

    if (is.null(collapse)) character() else ""
  } else {
    base::paste(..., sep = sep, collapse = collapse)
  }
}
