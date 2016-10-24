source("helper/helper.R")

x = tempdir()
res1 = backports:::file.info(x, extra_cols = TRUE)
res2 = backports:::file.info(x, extra_cols = FALSE)
assert_data_frame(res1, nrow = 1L, min.cols = 7L)
assert_data_frame(res2, nrow = 1L, ncol = 6L)

expect_identical(res1, base::file.info(x))
expect_identical(res1[, 1:6, drop = FALSE], res2)
