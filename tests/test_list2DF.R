source("helper/helper.R")

if (exists("list2DF", envir = baseenv())) {
  f = get("list2DF", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::list2DF)

  x <- list(character(), "A", c("B", "C"))
  n <- lengths(x)
  expect_same(list(x = x, n = n))

  ## Create data frames with no variables and the desired number of rows:
  expect_same()
  expect_same(nrow = 3L)
}
