source("helper/helper.R")

if (exists("nullfile", envir = baseenv())) {
  f = get("nullfile", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::nullfile)

  expect_same()
}
