source("helper/helper.R")

if (exists("str2expression", envir = baseenv())) {
  f = get("str2expression", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::str2expression)

  expect_same("x[3] <- 1+4")
  expect_same("log(y)")
  expect_same("abc")
  expect_same("1.375")
}
