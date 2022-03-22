source("helper/helper.R")

wb = function(...) backports:::...names()

if (exists("...names", envir = baseenv()) && getRversion() > "4.1.2") {
  f = get("...names", envir = baseenv())
  wf = function(...) f()
  expect_same = makeCompareFun(wf, wb)

  expect_same(1, 2)
  expect_same(a = 1)
  expect_same(1, b = 2)
  expect_same()

  expect_identical(wb(a = 1, 2), c("a", ""))
}

expect_identical(wb(a = 1, b = 2), c("a", "b"))


# issue 64
if (getRversion() >= "4.1.0") {
  bp_...names = getFromNamespace("...names", "backports")

  test1 <- function(...) {
    base::...names()
  }

  test2 <- function(...) {
    bp_...names()
  }

  expect_identical(
    test1("ABC"),
    test2("ABC")
  )

  expect_identical(
    test1(a = "b", ),
    test2(a = "b", )
  )
}
