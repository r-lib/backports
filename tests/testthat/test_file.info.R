context("file.info")

test_that("file.info()", {
  x = tempdir()
  res1 = file.info(x, extra_cols = TRUE)
  res2 = file.info(x, extra_cols = FALSE)
  expect_data_frame(res1, nrow = 1L, min.cols = 7L)
  expect_data_frame(res2, nrow = 1L, ncol = 6L)

  expect_identical(res1, base::file.info(x))
  expect_identical(res1[, 1:6, drop = FALSE], res2)
})
