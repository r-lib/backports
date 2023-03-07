# backports

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/backports)](https://cran.r-project.org/package=backports)
[![R-CMD-check](https://github.com/r-lib/backports/workflows/R-CMD-check/badge.svg)](https://github.com/r-lib/backports/actions)
[![Download Stats](http://cranlogs.r-pkg.org/badges/backports)](https://cran.r-project.org/package=backports)

This package provides backports of functions which have been introduced in one of the base packages in R version 3.0.1 or later.
The backports are conditionally exported in order to let R resolve the function name to either the implemented backport, or the respective base version, if available.
Package developers can make use of new functions or arguments by selectively importing specific backports to support older installations.

## Usage

### Interactively

Attach the namespace via `library(backports)`.

Note that it is crucial that `backports` is build against the currently running R version.
Do not ignore these kind of warnings for this package.

### In packages
1. Add backports to your DESCRIPTION under `Imports`.
2. Add or modify the function `.onLoad()` (see [here](https://stat.ethz.ch/R-manual/R-devel/library/base/html/ns-hooks.html)) to call the `import()` function of backports:
   ```r
   .onLoad <- function(libname, pkgname) {
     backports::import(pkgname)
   }
   ```
   You can also selectively import functions:
   ```r
   .onLoad <- function(libname, pkgname) {
     backports::import(pkgname, c("get0", "dir.exists"))
   }
   ```
   If you set `force = TRUE`, the provided functions will get imported, regardless of the R version:
   ```r
   .onLoad <- function(libname, pkgname) {
     backports::import(pkgname, "hasName", force = TRUE)
   }
   ```
3. [Optional] Set `Depends` in your DESCRIPTION to require `R (>= 3.0.0)`.

### Importing backports from `utils` or `tools`

Backports for functions which are not in the `base` require additional steps.
Usually, you need to to import those functions in the package NAMESPACE.
However, this is only possible if such a function really exists, and yields a warning during `R CMD check` for older versions.
There are three possibilities to deal with this:

1. Completely import the namespaces instead of selectively importing them, e.g. use `import(utils)` instead of `importFrom(utils, hasName)` in your `NAMESPACE` file.
2. Force-import the function (see above) so that you always use the backport instead of the implementation shipped with R, even for the most recent version of R.
3. Use a conditional import in your `NAMESPACE` file, e.g.
   ```
   if (getRversion() >= "3.4.0") {
     importFrom(utils, hasName)
   } else {
     importFrom(backports, hasName)
   }
   ```
Note that the braces `{}` are necessary in the
`NAMESPACE` file, even though they wouldn't be for regular R code, and that you might get a warning
for including `backports` in the `Imports:` section of your `DESCRIPTION` file if you never end up using it.


## Backports for R versions prior to 3.2.0

* `base::anyNA()`
* `base::dir.exists()`
* `base::file.size()`, `base::file.mode()` and `base::file.mtime()`
* `base::lengths()`
* Argument `extra_cols` for `base::file.info()`
* Argument `repeated` for `utils::URLencode`
* `base::isNamespaceLoaded()`

## Backports for R versions prior to 3.3.0

* `base::startsWith()` and `base::endsWith()`
* `base::strrep()`
* `base::trimws()`
* Argument `type` for `utils::capture.output()`

## Backports for R versions prior to 3.4.0

* `base::.valid.factor()`
* `utils::hasName()`

## Backports for R versions prior to 3.5.0

* `base::...length()`
* `base::...elt()`
* `base::isFALSE()`

## Backports for R versions prior to 3.6.0

* `base::warningCondition()`
* `base::errorCondition()`
* Argument `q` for `base::dQuote()` and `base::sQuote()`
* `tools::vignetteInfo()`
* `base::str2lang()`
* `base::str2expression()`
* `base::asplit()`
* `utils::removeSource()` with the capability to strip source from language objects.

## Backports for R versions prior to 4.0.0

* `base::deparse1()`
* `base::list2DF()`
* `tools::R_user_dir()`
* Argument `classes` for `base::suppressWarnings()` and `base::suppressMessages()`

## Backports for R versions prior to 4.0.1
* Argument `recycle0` for `base::paste()`.
* Argument `recycle0` for `base::paste0()`.

## Backports for R versions prior to 4.1.0
* `base::...names()`
