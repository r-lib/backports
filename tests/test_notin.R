source("helper/helper.R")

expect_identical(1 %notin% 2:4, TRUE)
expect_identical(1 %notin% 1:4, FALSE)
expect_identical(c(1, 5) %notin% 2:4, c(TRUE, TRUE))
expect_identical(c(1, 3) %notin% 2:4, c(TRUE, FALSE))
expect_identical(NA %notin% 2:4, TRUE)
expect_identical(NA %notin% c(2:4, NA), FALSE)
