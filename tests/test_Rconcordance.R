source("helper/helper.R")

if (exists("as.Rconcordance", envir = asNamespace("tools"), inherits = FALSE)) {
  f <- get("as.Rconcordance", envir = asNamespace("tools"))
  expect_same <- makeCompareFun(f, backports:::as.Rconcordance.default)
   
  expect_same("<!-- concordance::Sample.Rmd:1 9 1 1 6 14 1 -->")
}

if (exists("matchConcordance", envir = asNamespace("tools"), inherits = FALSE)) {
  f = get("matchConcordance", envir = asNamespace("tools"))
  expect_same = makeCompareFun(f, backports:::matchConcordance)

  conc <- tools::as.Rconcordance("<!-- concordance::Sample.Rmd:1 9 1 1 6 14 1 -->")
  
  expect_same(20, conc)
}
