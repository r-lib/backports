source("helper/helper.R")

f = get(".libPaths", envir = baseenv())
expect_same = makeCompareFun(f, backports:::.libPaths)

save <- .libPaths()

f <- tempfile()
expect_same(f)
dir.create(f)
expect_same(f)
if (getRversion() >= "4.1.0") {
  expect_same(f, include.site = FALSE)
} else {
  .libPaths(f, include.site = FALSE)
  expect_same()
}
.libPaths(save, include.site = length(.Library.site) && any(.Library.site %in% save))
