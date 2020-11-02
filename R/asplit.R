#' @title Backport of asplit for R < 3.6.0
#' @rdname asplit
#'
#' @description
#' See the original description in \code{base::asplit}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(asplit)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_asplit = getFromNamespace("asplit", "backports")
#' x = matrix(1:6, 2, 3)
#' bp_asplit(x, 1)
asplit = function (x, MARGIN) {
    dl <- length(dim(x))
    if (!dl)
        stop("dim(x) must have a positive length")
    if (is.object(x))
        x <- if (dl == 2L)
            as.matrix(x)
        else as.array(x)
    d <- dim(x)
    dn <- dimnames(x)
    ds <- seq_len(dl)
    if (is.character(MARGIN)) {
        if (is.null(dnn <- names(dn)))
            stop("'x' must have named dimnames")
        MARGIN <- match(MARGIN, dnn)
        if (anyNA(MARGIN))
            stop("not all elements of 'MARGIN' are names of dimensions")
    }
    s.call <- ds[-MARGIN]
    s.ans <- ds[MARGIN]
    d.call <- d[-MARGIN]
    d.ans <- d[MARGIN]
    dn.call <- dn[-MARGIN]
    dn.ans <- dn[MARGIN]
    d2 <- prod(d.ans)
    newx <- aperm(x, c(s.call, s.ans))
    dim(newx) <- c(prod(d.call), d2)
    ans <- vector("list", d2)
    for (i in seq_len(d2)) {
        ans[[i]] <- array(newx[, i], d.call, dn.call)
    }
    array(ans, d.ans, dn.ans)
}
