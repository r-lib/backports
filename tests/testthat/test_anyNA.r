context("anyNA()")

test_that("anyNA()", {
  if (!exists("anyNA", envir = baseenv()))
    skip("anyNA() not found in base")
  f = get("anyNA", envir = baseenv())
  expect_same = makeCompareFun(f, anyNA)

  expect_same(1)
  expect_same(NA)
  expect_same(iris)
  expect_same(list(1, 2, list(3, 4, list(NA))), recursive = FALSE)
  expect_same(list(1, 2, list(3, 4, list(NA))), recursive = TRUE)
})
