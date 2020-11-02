source("helper/helper.R")

if (exists("removeSource", envir = getNamespace("utils"))) {
  f = get("removeSource", envir = getNamespace("utils"))
  expect_same = makeCompareFun(f, backports:::removeSource)

  expect_same(mean)
}
