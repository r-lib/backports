source("helper/helper.R")

if (getRversion() > "3.2.0") {
  x = rand(1000)
  stopifnot(all.equal(backports:::sort(x), base::sort(x)))
  stopifnot(all.equal(backports:::sort(x, method = "radix"), base::sort(x, method = "radix")))
}

x = rand(1000)
x = backports:::sort(x, method = "radix")
stopifnot(is.sorted(x))
