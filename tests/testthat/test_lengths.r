context("lengths()")

test_that("lengths()", {
  ee = as.environment("package:base")
  if (!exists("lengths", envir = ee))
    skip("lengths() not found in base")
  f = get("lengths", envir = ee)

  expect_same = makeCompareFun(f, lengths_backport)
  expect_same(1:3)
  expect_same(setNames(1:3, letters[1:3]))
  expect_same(setNames(1:3, letters[1:3]), use.names = FALSE)
  expect_same(iris)
})
