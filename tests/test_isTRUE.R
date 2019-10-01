source("helper/helper.R")

f = backports:::isTRUE
expect_identical(f(TRUE), TRUE)
expect_identical(f(FALSE), FALSE)
expect_identical(f(1), FALSE)
expect_identical(f(iris), FALSE)
expect_identical(f(structure(TRUE, foo = "bar")), TRUE)
