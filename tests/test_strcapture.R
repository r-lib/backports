source("helper/helper.R")

if (exists("strcapture", envir = asNamespace("utils"))) {
  f = get("strcapture", envir = asNamespace("tools"))
  expect_same = makeCompareFun(f, backports:::strcapture)

  expect_same("backports")
  expect_same("backports", which = "pattern")
  expect_same("backports", which = "x")
  expect_same("backports", which = "proto")
  expect_same("backports", which = "perl")
  expect_same("backports", which = "useBytes")
}
