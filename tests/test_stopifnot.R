source("helper/helper.R")

f = backports:::stopifnot
expect_error(f("Test" = 1 == 2), "Test")
expect_silent(f("Test" = 1 == 1))
expect_error(f("Test 1" = 1 == 2, "Test 2" = 2 == 2), "Test 1")
expect_error(f("Test 1" = 1 == 2, "Test 2" = 2 == 3), "Test 1")
expect_error(f("Test 1" = 1 == 1, "Test 2" = 2 == 3), "Test 2")
expect_silent(f("Test 1" = 1 == 1, "Test 2" = 2 == 2))
