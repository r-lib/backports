context("file.size")

test_that("file.size()", {
  if (!exists("file.size", envir = baseenv()))
    skip("file.size() not found in base")
  f = get("file.size", envir = baseenv())
  expect_same = makeCompareFun(f, file.size)

  expect_same(R.home())
  expect_same(file.path(R.home(), "COPYING"))
})
