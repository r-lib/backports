source("helper/helper.R")

if (exists("str2lang", envir = baseenv())) {
  f = get("str2lang", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::str2lang)

  expect_same("x[3] <- 1+4")
  expect_same("log(y)")
  expect_same("abc")
  expect_same("1.375")
}
