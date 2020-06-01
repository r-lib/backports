#' @title Backport of vignetteInfo for R < 3.6.0
#'
#' @description
#' See the original description in \code{tools::vignetteInfo}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "3.6.0") export(vignetteInfo)
#' @examples
#' # get function from namespace instead of possibly getting
#' # implementation shipped with recent R versions:
#' bp_vignetteInfo = getFromNamespace("vignetteInfo", "backports")
vignetteInfo <- getFromNamespace("vignetteInfo", ns = "tools")
