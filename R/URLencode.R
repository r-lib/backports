#' @title Backport of URLencode for R < 3.2.0
#' @rdname URLencode
#'
#' @description
#' See the original description in \code{utils::URLencode}.
#' Argument \code{repeated} is backported.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.2.0") export(URLencode)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_URLencode = getFromNamespace("URLencode", "backports")
#'
#' URLdecode(z <- "ab%20cd")
#' c(bp_URLencode(z), bp_URLencode(z, repeated = TRUE))
URLencode = function(URL, reserved = FALSE, repeated = FALSE) {
  if (!repeated && grepl("%[[:xdigit:]]{2}", URL, useBytes = TRUE))
    return(URL)
  OK <- paste0(
    "[^",
    if (!reserved) "][!$&'()*+,;=:/?@#",
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "abcdefghijklmnopqrstuvwxyz0123456789._~-",
    "]"
  )
  x <- strsplit(URL, "")[[1L]]
  z <- grep(OK, x)
  if (length(z)) {
    y <- sapply(x[z], function(x) paste0("%", toupper(as.character(charToRaw(x))),
        collapse = ""))
    x[z] <- y
  }
  paste(x, collapse = "")
}
