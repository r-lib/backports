#' @title Backport of dQuote and sQuote for R < 3.6.0
#'
#' @description
#' Argument \code{q} has been backported.
#' See the original description in \code{base::dQuote()} and \code{base::sQuote()}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(dQuote)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_dQuote <- getFromNamespace("dQuote", "backports")
#' bp_dQuote("foo")
#' bp_dQuote("foo", q = TRUE)
dQuote <- function(x, q = getOption("useFancyQuotes")) {
  if (!length(x)) return(character())
  before <- after <- "\""
  if(!is.null(q)) {
    if(isTRUE(q)) {
      li <- l10n_info()
      if(li$"UTF-8") q <- "UTF-8"
      if(!is.null(li$codepage) && li$codepage > 0L) {
        if(li$codepage >= 1250L && li$codepage <= 1258L
          || li$codepage == 874L) {
          before <- rawToChar(as.raw(0x93))
          after <- rawToChar(as.raw(0x94))
        } else {
          z <- iconv(c(intToUtf8(0x201c), intToUtf8(0x201d)),
            "UTF-8", "")
          before <- z[1L]; after <- z[2L]
        }
      }
    }
    if(identical(q, "TeX")) {
      before <- "``"; after <- "''"
    }
    if(identical(q, "UTF-8")) {
      before <- intToUtf8(0x201c); after <- intToUtf8(0x201d)
    }
    if(is.character(q) && length(q) >= 4L) {
      before <- q[3L]; after <- q[4L]
    }
  }
  paste0(before, x, after)
}


#' @rdname dQuote
#' @rawNamespace if (getRversion() < "3.6.0") export(sQuote)
sQuote <- function(x, q = getOption("useFancyQuotes")) {
  if (!length(x)) return(character())
  before <- after <- "'"
  if(!is.null(q)) {
    if(isTRUE(q)) {
      li <- l10n_info()
      if(li$"UTF-8") q <- "UTF-8"
      if(!is.null(li$codepage) && li$codepage > 0L) {
        ## we can't just use iconv, as that seems to think
        ## it is in latin1 in CP1252
        if(li$codepage >= 1250L && li$codepage <= 1258L
          || li$codepage == 874L) {
          before <- rawToChar(as.raw(0x91))
          after <- rawToChar(as.raw(0x92))
        } else {
          z <- iconv(c(intToUtf8(0x2018), intToUtf8(0x2019)),
            "UTF-8", "")
          before <- z[1L]; after <- z[2L]
        }
      }
    }
    if(identical(q, "TeX")) {
      before <- "`"; after <- "'"
    }
    if(identical(q, "UTF-8")) {
      before <- intToUtf8(0x2018); after <- intToUtf8(0x2019)
    }
    if(is.character(q) && length(q) >= 4L) {
      before <- q[1L]; after <- q[2L]
    }
  }
  paste0(before, x, after)
}
