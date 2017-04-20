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

rand = function(n) {
  pool = c(letters[1:5], LETTERS[1:5], 0:5, "ä", "ß", "!", "'", "?", ".", "€")
  sapply(replicate(n, sample(pool, sample(3:10))), paste, collapse = "")
}

is.sorted = function(x) {
  old = Sys.getlocale("LC_COLLATE")
  on.exit(Sys.setlocale("LC_COLLATE", old))
  Sys.setlocale("LC_COLLATE", "C")
  !is.unsorted(x)
}
