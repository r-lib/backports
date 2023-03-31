source("helper/helper.R")

f_non_s3 <- function(x) x
f_s3 <- function(x) UseMethod("f_s3")

if (getRversion() >= "4.1.0") {
	f = get("isS3stdGeneric", envir = getNamespace("utils"))
	expect_same = makeCompareFun(f, backports:::isS3stdGeneric)
	
	expect_same(mean)
	expect_same(grep)
	expect_same(f_non_s3)
	expect_same(f_s3)
}

expect_identical(isS3stdGeneric(mean), c(mean = TRUE))
expect_identical(isS3stdGeneric(grep), FALSE)
expect_identical(isS3stdGeneric(f_non_s3), FALSE)
expect_identical(isS3stdGeneric(f_s3), c(f_s3 = TRUE))
