.conformToProto <- function(mat, proto) {
  ans <- lapply(seq_along(proto), function(i) {
    if (isS4(proto[[i]])) {
      methods::as(mat[, i], class(proto[[i]]))
    }
    else {
      fun <- match.fun(paste0("as.", class(proto[[i]])))
      fun(mat[, i])
    }
  })
  names(ans) <- names(proto)
  if (isS4(proto)) {
    methods::as(ans, class(proto))
  }
  else {
    as.data.frame(ans, optional = TRUE, stringsAsFactors = FALSE)
  }
}

#' @title Backport of strcapture for R < 3.4.0
#'
#' @description
#' See the original description in \code{utils::strcapture}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.4.0") export(strcapture)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_strcapture = getFromNamespace("strcapture", "backports")
#'
#' x <- "chr1:1-1000"
#' pattern <- "(.*?):([[:digit:]]+)-([[:digit:]]+)"
#' proto <- data.frame(chr=character(), start=integer(), end=integer())
#' bp_strcapture(pattern, x, proto)
strcapture <- function(pattern, x, proto, perl = FALSE, useBytes = FALSE) {
    if (getRversion() < "3.3.0") {
      if (perl) {
        stop("`perl` parameter not available in this R version of regexec", call.=FALSE)
      }
      m <- regexec(pattern, x, useBytes = useBytes)
    } else {
      rxc <- regexec
      m <- rxc(pattern, x, perl = perl, useBytes = useBytes)
    }
  str <- regmatches(x, m)
  ntokens <- length(proto) + 1L
  nomatch <- lengths(str) == 0L
  str[nomatch] <- list(rep.int(NA_character_, ntokens))
  if (length(str) > 0L && length(str[[1L]]) != ntokens) {
    stop("The number of captures in 'pattern' != 'length(proto)'")
  }
  mat <- matrix(as.character(unlist(str)),
    ncol = ntokens,
    byrow = TRUE
  )[, -1L, drop = FALSE]
  .conformToProto(mat, proto)
}