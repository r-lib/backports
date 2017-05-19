# backports

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/backports)](http://cran.r-project.org/package=backports)
[![Travis-CI Build Status](https://travis-ci.org/mllg/backports.svg?branch=master)](https://travis-ci.org/mllg/backports)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/mllg/backports?branch=master&svg=true)](https://ci.appveyor.com/project/mllg/backports)

This package provides backports of functions which have been introduced in one of the base packages in R version 3.0.1 or later.
These backports are conditionally exported in order to let R resolve the function name to either the implemented backport, or the respective base version, if available.
This way, package developers can make use of new functions or arguments without without worrying about the minimum R version required.

## Usage

1. Add backports to your DESCRIPTION under `Imports`.
2. Add or modify the function `.onLoad()` (see [here](https://stat.ethz.ch/R-manual/R-devel/library/base/html/ns-hooks.html)) to call the `import()` function of backports:
   ```r
   .onLoad <- function(libname, pkgname) {
     backports::import(pkgname)
   }
   ```
   You can also selectively import functions:
   ```r
   .onLoad <- function(libname, c("get0", "dir.exists")) {
     backports::import(pkgname)
   }
   ```

## Backports for R versions prior to 3.2.0

* `anyNA()`
* `dir.exists()`
* `file.size()`, `file.mode()` and `file.mtime()`
* `lengths()`
* Argument `extra_cols` for `file.info()`.

## Backports for R versions prior to 3.3.0

* `startsWith()` and `endsWith()`
* `strrep()`
* `trimws()`

## Backports for R versions prior to 3.4.0

* `hasName()`
