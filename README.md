# backports

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/backports)](http://cran.r-project.org/package=backports)
[![Travis-CI Build Status](https://travis-ci.org/mllg/backports.svg?branch=master)](https://travis-ci.org/mllg/backports)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/mllg/backports?branch=master&svg=true)](https://ci.appveyor.com/project/mllg/backports)

This package provides backports of functions which have been introduced in one of the base packages in R version 3.0.1 or later.
These backports are conditionally exported in order to let R resolve the function name to either the implemented backport, or the respective base version, if available.
This way, package developers can make use of the new, optimized functions without without worrying about the minimum R version required.
