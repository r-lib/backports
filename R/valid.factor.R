#' @title Backport of .valid.factor for R < 3.4.0
#' @rdname valid.factor
#'
#' @description
#' See the original description in \code{base::.valid.factor}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.4.0") export(.valid.factor)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_.valid_factor = getFromNamespace(".valid.factor", "backports")
#' bp_.valid_factor(factor(letters[1:3]))
.valid.factor = function (object) {
  levs <- levels(object)
  if (!is.character(levs))
    return("factor levels must be \"character\"")
  if (d <- anyDuplicated(levs))
    return(sprintf("duplicated level [%d] in factor", d))
  TRUE
}
