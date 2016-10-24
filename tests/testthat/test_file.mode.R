context("file.mode")

test_that("file.mode()", {
  if (!exists("file.mode", envir = baseenv()))
    skip("file.mode() not found in base")
  f = get("file.mode", envir = baseenv())
  expect_same = makeCompareFun(f, file.mode)

  expect_same(R.home())
  expect_same(file.path(R.home(), "COPYING"))
})
