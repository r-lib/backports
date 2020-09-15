source("helper/helper.R")

if (getRversion() >= "4.0.0") {
  f = get("suppressWarnings", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::suppressWarnings)

  expect_same(suppressWarnings(backports:::warningCondition("foo", "testWarning")), classes = "testWarning")
}
