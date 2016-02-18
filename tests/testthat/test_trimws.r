context("trimws()")

test_that("trimws()", {
  if (!exists("trimws", envir = baseenv()))
    skip("trimws() not found in base")
  f = get("trimws", envir = baseenv())
  expect_same = makeCompareFun(f, trimws)

  expect_same("")
  expect_same(NA)
  expect_same(NA_character_)
  expect_same(sprintf(" %s ", letters))
  expect_same(" x ")
  expect_same(" x ", which = "both")
  expect_same(" x ", which = "left")
  expect_same(" x ", which = "right")
  expect_same(1)
})
