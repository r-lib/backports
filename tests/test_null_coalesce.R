source("helper/helper.R")

expect_identical(NULL %||% TRUE, TRUE)
expect_identical(FALSE %||% NULL, FALSE)
expect_identical(FALSE %||% TRUE, FALSE)
