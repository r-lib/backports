source("helper/helper.R")

f = get("paste", envir = baseenv())
expect_same = makeCompareFun(f, backports:::paste)

expect_same(letters[1:3])
expect_same(letters[1:3], recycle0 = TRUE)
expect_same(letters[1:3], sep = "_", recycle0 = TRUE)
expect_same(letters[1:3], sep = "_", collapse = "+", recycle0 = TRUE)
expect_same(letters[1:3], collapse = NULL, recycle0 = TRUE)
expect_same(letters[1:3], sep = NULL, recycle0 = TRUE)
expect_same(letters[1:3], sep = NULL, collapse = NULL, recycle0 = TRUE)
expect_same(letters[1:3], sep = character(), collapse = character(), recycle0 = TRUE)

expect_same(character())
expect_same(character(), recycle0 = TRUE)
expect_same(character(), sep = "_", recycle0 = TRUE)
expect_same(character(), sep = "_", collapse = "+", recycle0 = TRUE)
expect_same(character(), collapse = NULL, recycle0 = TRUE)
expect_same(character(), sep = NULL, recycle0 = TRUE)
expect_same(character(), sep = NULL, collapse = NULL, recycle0 = TRUE)
expect_same(character(), sep = character(), collapse = character(), recycle0 = TRUE)

