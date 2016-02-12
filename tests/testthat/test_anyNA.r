context("anyNA()")

test_that("anyNA()", {
  ee = as.environment("package:base")
  if (!exists("anyNA", envir = ee))
    skip("anyNA() not found in base")
  f = get("anyNA", envir = ee)

  expect_same = makeCompareFun(f, anyNA_backport)

  expect_same(1)
  expect_same(NA)
  expect_same(iris)
  expect_same(list(1, 2, list(3, 4, list(NA))), recursive = FALSE)
  expect_same(list(1, 2, list(3, 4, list(NA))), recursive = TRUE)
})
