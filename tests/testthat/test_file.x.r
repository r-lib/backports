context("file.x")

test_that("file.size()", {
  if (!exists("file.size", envir = baseenv()))
    skip("file.size() not found in base")
  f = get("file.size", envir = baseenv())
  expect_same = makeCompareFun(f, file.size)

  expect_same(R.home())
  expect_same(file.path(R.home(), "COPYING"))
})

test_that("file.mode()", {
  if (!exists("file.mode", envir = baseenv()))
    skip("file.mode() not found in base")
  f = get("file.mode", envir = baseenv())
  expect_same = makeCompareFun(f, file.mode)

  expect_same(R.home())
  expect_same(file.path(R.home(), "COPYING"))
})

test_that("file.mtime()", {
  if (!exists("file.mtime", envir = baseenv()))
    skip("file.mtime() not found in base")
  f = get("file.mtime", envir = baseenv())
  expect_same = makeCompareFun(f, file.mtime)

  expect_same(R.home())
  expect_same(file.path(R.home(), "COPYING"))
})
