#' @title Backport of list2DF for R < 4.0.0
#' @rdname list2DF
#'
#' @description
#' See the original description in \code{base::list2DF}.
#' Note that the behaviour of \code{list2DF()} changed in
#' R 4.2.0. Instead of recycling vectors to common length, an
#' exception is raised.
#' This backport implements the new behaviour,
#' throwing an error message.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.0.0") export(list2DF)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_list2DF = getFromNamespace("list2DF", "backports")
#'
#' bp_list2DF(list(x = 1:3, y = 2:4))
list2DF <- function(x = list(), nrow = 0L) {
    stopifnot(is.list(x), is.null(nrow) || nrow >= 0L)
    if (n <- length(x)) {
        if (length(nrow <- unique(lengths(x))) > 1L)
            stop("all variables should have the same length")
    } else {
        if (is.null(nrow))
            nrow <- 0L
    }
    if (is.null(names(x)))
        names(x) <- character(n)
    class(x) <- "data.frame"
    attr(x, "row.names") <- .set_row_names(nrow)
    x
}

.set_row_names = function (n) if (n > 0) c(NA_integer_, -n) else integer()

