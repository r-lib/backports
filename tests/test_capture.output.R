source("helper/helper.R")

f = get("capture.output", envir = getNamespace("utils"))
expect_same = makeCompareFun(f, backports:::capture.output)

output = function() {
  print("stdout")
  message("stderr")
}
suppressMessages({
  expect_same(output())
})

if (getRversion() >= "3.3.0") {
  suppressMessages({
    expect_same(output(), type = "message")
    expect_same(output(), type = "output")
  })
  expect_same(output(), type = c("message", "output"))
}
