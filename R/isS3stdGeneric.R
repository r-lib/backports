#' @title Backport of isS3stdGeneric for R < 4.1.0
#'
#' @description
#' See the original description in \code{utils::isS3stdGeneric}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.1.0") export(isS3stdGeneric)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_isS3stdGeneric <- getFromNamespace("isS3stdGeneric", "backports")
#'
#' bp_isS3stdGeneric(mean)
#' 
#' f <- function(x) x
#' bp_isS3stdGeneric(f)
isS3stdGeneric <- function(f) {
	bdexpr <- body(if(inherits(f, "traceable")) f@original else f)
	## protect against technically valid but bizarre
	## function(x) { { { UseMethod("gen")}}} by
	## repeatedly consuming the { until we get to the first non { expr
	while(is.call(bdexpr) && bdexpr[[1L]] == "{")
		bdexpr <- bdexpr[[2L]]
	
	## We only check if it is a "standard" s3 generic. i.e. the first non-{
	## expression is a call to UseMethod. This will return FALSE if any
	## work occurs before the UseMethod call ("non-standard" S3 generic)
	ret <- is.call(bdexpr) && bdexpr[[1L]] == "UseMethod"
	if(ret)
		names(ret) <- bdexpr[[2L]] ## arg passed to UseMethod naming generic
	ret
}