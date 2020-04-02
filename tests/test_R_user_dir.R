source("helper/helper.R")

if (exists("R_user_dir", envir = asNamespace("tools"))) {
  f = get("R_user_dir", envir = asNamespace("tools"))
  expect_same = makeCompareFun(f, backports:::R_user_dir)

  expect_same("backports")
  expect_same("backports", which = "data")
  expect_same("backports", which = "config")
  expect_same("backports", which = "cache")
}
