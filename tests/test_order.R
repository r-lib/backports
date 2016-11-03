source("helper/helper.R")

if (getRversion() > "3.2.0") {
  x = rand(1000)
  stopifnot(all.equal(backports::order(x), base::order(x)))
  stopifnot(all.equal(backports::order(x, method = "radix"), base::order(x, method = "radix")))
}

x = rand(1000)
i = backports:::order(x, method = "radix")
stopifnot(is.sorted(x[i]))
