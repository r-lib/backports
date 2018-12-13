source("helper/helper.R")

if (exists("warningCondition", envir = baseenv())) {
  f = get("warningCondition", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::warningCondition)

  expect_same("warning from backports test")
  expect_same("warning from backports test", class = "test_warning")
}

if (exists("errorCondition", envir = baseenv())) {
  f = get("errorCondition", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::errorCondition)

  expect_same("error from backports test")
  expect_same("error from backports test", class = "test_error")
}
