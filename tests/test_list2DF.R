source("helper/helper.R")

if (exists("list2DF", envir = asNamespace("tools"))) {
  f = get("list2DF", envir = asNamespace("tools"))
  expect_same = makeCompareFun(f, backports:::list2DF)

  expect_same("backports")
  expect_same("backports", which = "x")
  expect_same("backports", which = "nrow")
}
