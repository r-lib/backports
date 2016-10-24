library(backports)

expect_identical = function(x, y) {
  stopifnot(identical(x, y))
}

expect_true = function(x) {
  stopifnot(isTRUE(x))
}

makeCompareFun = function(f1, f2, ...) {
  f1 = match.fun(f1)
  f2 = match.fun(f2)

  function(...) {
    r1 = try(f1(...), silent = TRUE)
    r2 = try(f2(...), silent = TRUE)
    if (inherits(r1, "try-error")) {
      stopifnot(inherits(r2, "try-error"))
    } else {
      expect_identical(r1, r2)
    }
  }
}
