context("hasName")

test_that("strrep", {
  if (!exists("strrep", envir = getNamespace("utils")))
    skip("hasName() not found in utils")
  f = get("hasName", envir = getNamespace("utils"))
  expect_same = makeCompareFun(f, hasName)

  x = list(1, a = 12, bbb = 99)
  expect_same(x, "a")
  expect_same(x, "c")
  expect_same(x, "bbb")
  expect_same(x, "b")
})
