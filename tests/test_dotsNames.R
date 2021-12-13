source("helper/helper.R")

wb = function(...) backports:::...names()

if (exists("...names", envir = baseenv()) && getRversion() > "4.1.2") {
  f = get("...names", envir = baseenv())
  wf = function(...) f()
  expect_same = makeCompareFun(wf, wb)

  expect_same(1, 2)
  expect_same(a = 1)
  expect_same(1, b = 2)
  expect_same()

  expect_identical(wb(a = 1, 2), c("a", ""))
}

expect_identical(wb(a = 1, b = 2), c("a", "b"))
