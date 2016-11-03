source("helper/helper.R")

if (getRversion() >= "3.3.0") {
  f = get("order", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::order)
  x = rand(1000)
  expect_same(x, method = "shell")
  expect_same(x, method = "radix")
}

x = rand(1000)
i = backports:::order(x, method = "radix")
stopifnot(is.sorted(x[i]))
