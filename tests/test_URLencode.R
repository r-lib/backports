source("helper/helper.R")

f = get("URLencode", envir = getNamespace("utils"))
z = "ab%20cd"
expect_identical(backports:::URLencode(z, repeated = TRUE), "ab%2520cd")
expect_same = makeCompareFun(f, backports:::URLencode)
expect_same(z)

if (getRversion() >= "3.2.0") {
  expect_same(z, repeated = TRUE)
}
