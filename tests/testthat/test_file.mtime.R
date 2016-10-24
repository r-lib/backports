context("file.mtime")

test_that("file.mtime()", {
  if (!exists("file.mtime", envir = baseenv()))
    skip("file.mtime() not found in base")
  f = get("file.mtime", envir = baseenv())
  expect_same = makeCompareFun(f, file.mtime)

  expect_same(R.home())
  expect_same(file.path(R.home(), "COPYING"))
})
