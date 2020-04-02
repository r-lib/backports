source("helper/helper.R")

f = get("dQuote", envir = baseenv())
expect_same = makeCompareFun(f, backports:::dQuote)

expect_same("foo")
expect_same("foo", q = TRUE)
expect_same("foo", q = FALSE)


f = get("sQuote", envir = baseenv())
expect_same = makeCompareFun(f, backports:::sQuote)

expect_same("foo")
expect_same("foo", q = TRUE)
expect_same("foo", q = FALSE)
