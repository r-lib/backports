context("lengths()")

test_that("lengths()", {
  if (!exists("lengths", envir = baseenv()))
    skip("lengths() not found in base")
  f = get("lengths", envir = baseenv())
  expect_same = makeCompareFun(f, lengths)

  expect_same(1:3)
  expect_same(setNames(1:3, letters[1:3]))
  expect_same(setNames(1:3, letters[1:3]), use.names = FALSE)
  expect_same(iris)
})
