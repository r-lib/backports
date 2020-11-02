source("helper/helper.R")

if (exists("asplit", envir = baseenv())) {
  f = get("asplit", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::asplit)

  d <- 2 : 4
  x <- array(seq_len(prod(d)), d)
  expect_same(x, 2)
  expect_same(x, c(1, 2))
  x <- matrix(1 : 6, 2, 3)
  expect_same(x, 1)
}
