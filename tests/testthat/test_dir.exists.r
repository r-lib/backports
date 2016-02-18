context("dir.exists()")

test_that("dir.exists()", {
  if (!exists("dir.exists", envir = baseenv()))
    skip("dir.exists() not found in base")
  f = get("dir.exists", envir = baseenv())
  expect_same = makeCompareFun(f, dir.exists)

  expect_same(tempdir())
  expect_same(tempfile())
  expect_same(rep.int(tempdir(), 2))
  expect_same(TRUE)
})
