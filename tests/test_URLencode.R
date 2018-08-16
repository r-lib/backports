source("helper/helper.R")

f = get("URLencode", envir = getNamespace("utils"))
z = "ab%20cd"
expect_identical(backports:::URLencode(z, repeated = TRUE), "ab%2520cd")

if (getRversion() >= "3.2.0") {
  expect_same = makeCompareFun(f, backports:::URLencode)
  expect_same(z)
  expect_same(z, repeated = FALSE)
  expect_same(z, repeated = TRUE)
} else {
  expect_identical(f(z), backports:::URLencode(z, repeated = TRUE))
}
