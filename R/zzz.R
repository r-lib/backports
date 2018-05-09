#' @section Backports for R versions prior to 3.2.0:
#' \itemize{
#'  \item{\code{\link{anyNA}}}
#'  \item{\code{\link{dir.exists}}}
#'  \item{\code{\link{file.size}}, \code{\link{file.mode}}, \code{\link{file.mtime}}}
#'  \item{\code{\link{lengths}}}
#'  \item{Argument} \code{extra_cols} for \code{\link{file.info}}
#' }
#'
#' @section Backports for R versions prior to 3.3.0:
#' \itemize{
#'  \item{\code{\link{startsWith}} and \code{\link{endsWith}}}
#'  \item{\code{\link{strrep}}}
#'  \item{\code{\link{trimws}}}
#'  \item{Argument \code{type} for \code{\link{capture.output}}}
#' }
#'
#' @section Backports for R versions prior to 3.4.0:
#' \itemize{
#'  \item{\code{\link{.valid.factor}}}
#'  \item{\code{\link{hasName}} from \pkg{utils}}
#' }
#'
#' @section Backports for R versions prior to 3.5.0:
#' \itemize{
#'  \item{\code{\link{...length}}}
#'  \item{\code{\link{...elt}}}
#'  \item{\code{\link{isFALSE}}}
#' }
#'
#' @importFrom utils getFromNamespace tail
"_PACKAGE"

.onUnload = function (libpath) {
  library.dynam.unload("backports", libpath)
}
