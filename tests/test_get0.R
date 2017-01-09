source("helper/helper.R")

if (exists("get0", envir = baseenv())) {
  f = get("get0", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::get0)

  foo = 1
  ee = new.env()
  ee$bar = 1
  ee$foobar = function(x) x^2

  expect_same("bar")
  expect_same("bar", ifnotfound = 42)
  expect_same("foo")
  expect_same("foo", ifnotfound = 42)
  expect_same("bar", envir = ee)
  expect_same("bar", envir = ee, mode = "function")
  expect_same("foobar", envir = ee, mode = "function")
}
