source("helper/helper.R")

if (exists("suppressWarnings", envir = baseenv())) {
  f = get("suppressWarnings", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::suppressWarnings)

  expect_same(suppressWarnings(warningCondition("foo", "testWarning")), classes = "testWarning")
}
