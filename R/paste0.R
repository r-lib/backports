#' @title Backport of paste0 for R < 4.0.1
#' @rdname paste0
#'
#' @description
#' See the original description in \code{base::paste0}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.0.1") export(paste0)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_paste0 = getFromNamespace("paste0", "backports")
#' bp_paste0(letters[1:3], character(), collapse = NULL, recycle0 = TRUE)
paste0 <- function(..., collapse = NULL, recycle0 = FALSE) {
  paste(..., sep = "", collapse = collapse, recycle0 = recycle0)
}
