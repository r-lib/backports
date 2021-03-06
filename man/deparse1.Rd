% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deparse1.R
\name{deparse1}
\alias{deparse1}
\title{Backport of deparse1 for R < 4.0.0}
\usage{
deparse1(expr, collapse = " ", width.cutoff = 500L, ...)
}
\description{
See the original description in \code{base::deparse1}.
}
\examples{
# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_deparse1 = getFromNamespace("deparse1", "backports")

bp_deparse1(quote(`foo bar`))
}
\keyword{internal}
