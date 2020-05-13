source("helper/helper.R")

if (exists("deparse1", envir = baseenv())) {
  f = get("deparse1", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::deparse1)

  expect_same(args(stats::lm))
  e = quote(`foo bar`)
  expect_same(e)
  expect_same(e, backtick = TRUE)
  e = quote(`foo bar`+1)
  expect_same(e)
  expect_same(e, control = "all")

}
