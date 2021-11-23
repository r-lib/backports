source("helper/helper.R")

if (getRversion() >= "4.0.0") {

  f = get("paste", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::paste)

  expect_same(letters[1:3], character())
  expect_same(letters[1:3], character(), recycle0 = TRUE)
  expect_same(letters[1:3], character(), sep = "_", recycle0 = TRUE)
  expect_same(letters[1:3], character(), sep = "_", collapse = "+", recycle0 = TRUE)
  expect_same(letters[1:3], character(), collapse = NULL, recycle0 = TRUE)
  expect_same(letters[1:3], character(), sep = NULL, recycle0 = TRUE)
  expect_same(letters[1:3], character(), sep = NULL, collapse = NULL, recycle0 = TRUE)
  expect_same(letters[1:3], character(), sep = character(), collapse = character(), recycle0 = TRUE)

  expect_same(character())
  expect_same(character(), recycle0 = TRUE)
  expect_same(character(), sep = "_", recycle0 = TRUE)
  expect_same(character(), sep = "_", collapse = "+", recycle0 = TRUE)
  expect_same(character(), collapse = NULL, recycle0 = TRUE)
  expect_same(character(), sep = NULL, recycle0 = TRUE)
  expect_same(character(), sep = NULL, collapse = NULL, recycle0 = TRUE)
  expect_same(character(), sep = character(), collapse = character(), recycle0 = TRUE)



  f = get("paste0", envir = baseenv())
  expect_same = makeCompareFun(f, backports:::paste0)

  expect_same(letters[1:3], character())
  expect_same(letters[1:3], character(), recycle0 = TRUE)
  expect_same(letters[1:3], character(), recycle0 = TRUE)
  expect_same(letters[1:3], character(), collapse = "+", recycle0 = TRUE)
  expect_same(letters[1:3], character(), collapse = NULL, recycle0 = TRUE)
  expect_same(letters[1:3], character(), collapse = NULL, recycle0 = TRUE)
  expect_same(letters[1:3], character(), collapse = character(), recycle0 = TRUE)

  expect_same(character())
  expect_same(character(), recycle0 = TRUE)
  expect_same(character(), recycle0 = TRUE)
  expect_same(character(), collapse = "+", recycle0 = TRUE)
  expect_same(character(), collapse = NULL, recycle0 = TRUE)
  expect_same(character(), collapse = NULL, recycle0 = TRUE)
  expect_same(character(), collapse = character(), recycle0 = TRUE)
}

expect_identical(
  paste(letters[1:3], character(), collapse = NULL, recycle0 = TRUE),
  character()
)

expect_identical(
  paste(letters[1:3], character(), collapse = "_", recycle0 = TRUE),
  ""
)

expect_identical(
  paste0(letters[1:3], character(), collapse = NULL, recycle0 = TRUE),
  character()
)

expect_identical(
  paste0(letters[1:3], character(), collapse = "_", recycle0 = TRUE),
  ""
)
