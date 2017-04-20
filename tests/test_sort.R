source("helper/helper.R")

if (getRversion() >= "3.3.0") {
  f = get("sort", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::sort)
  x = rand(10000)
  expect_same(x, method = "shell")
  expect_same(x, method = "radix")
}

x = rand(10000)
x = backports:::sort(x, method = "radix")
stopifnot(is.sorted(x))
