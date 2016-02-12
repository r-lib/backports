context("dir.exists()")

test_that("dir.exists()", {
  ee = as.environment("package:base")
  if (!exists("dir.exists", envir = ee))
    skip("dir.exists() not found in base")
  f = get("dir.exists", envir = ee)

  expect_same = makeCompareFun(f, dir.exists_backport)

  expect_same(tempdir())
  expect_same(tempfile())
  expect_same(rep.int(tempdir(), 2))
  expect_same(TRUE)
})
