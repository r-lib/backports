source("helper/helper.R")

if (exists("grepv", envir = baseenv())) {
  f = get("grepv", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::grepv)

  expect_same("[a-m]", letters)
  expect_same("^\\w{2}", colnames(mtcars))
}

