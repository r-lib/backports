# These functions are taken from the R sources.

# The original copyright notice was as follows:

## Copyright (C) 1995-2016 The R Core Team
## Copyright (C) 2022 Duncan Murdoch
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; either version 2 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  A copy of the GNU General Public License is available at
##  https://www.R-project.org/Licenses/

#' @title Backport of print.Rconcordance for R < 4.3.0
#'
#' @description
#' See the original description in \code{tools::print.Rconcordance}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.3.0") S3method("print", "Rconcordance")
print.Rconcordance <- function(x, ...) {
    df <- data.frame(srcFile = x$srcFile, srcLine = x$srcLine)
    rownames(df) <- seq_len(nrow(df)) + x$offset
    print(df)
    invisible(x)
}

# This function converts concordance objects to string representations
# of them.  

## The string has three or four parts, separated by colons:
## 1.  The output .tex filename
## 2.  The input .Rnw filename
## 3.  Optionally, the starting line number of the output coded as "ofs nn",
##     where nn is the offset to the first output line.  This is omitted if nn is 0.
## 4.  The input line numbers corresponding to each output line.
##     This are compressed using the following simple scheme:
##     The first line number, followed by
##     a run-length encoded diff of the rest of the line numbers.


#' @title Backport of as.character.Rconcordance for R < 4.3.0
#'
#' @description
#' See the original description in \code{tools::as.character.Rconcordance}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.3.0") S3method("as.character", "Rconcordance")

as.character.Rconcordance <- function(x,
			      targetfile = "",
			      ...) {
    concordance <- x
    offset <- concordance$offset
    src <- concordance$srcLine
    
    result <- character()
    
    srcfile <- rep_len(concordance$srcFile, length(src))
    
    while (length(src)) {
        first <- src[1]
        if (length(unique(srcfile)) > 1)
            n <- which(srcfile != srcfile[1])[1] - 1
        else
            n <- length(srcfile)
        
        vals <- with(rle(diff(src[seq_len(n)])), as.numeric(rbind(lengths, values)))
        result <- c(result, paste0("concordance:", 
               targetfile, ":",
               srcfile[1], ":",
               if (offset) paste0("ofs ", offset, ":"),
               concordance$srcLine[1], " ",
               paste(vals, collapse = " ")
               ))
        offset <- offset + n
        drop <- seq_len(n)
        src <- src[-drop]
        srcfile <- srcfile[-drop]
    }
    result    
}

#' @title Backport of as.Rconcordance for R < 4.3.0
#'
#' @description
#' See the original description in \code{tools::as.Rconcordance}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.3.0") export(as.Rconcordance)

as.Rconcordance <- function(x, ...) {
    UseMethod("as.Rconcordance")  
}

#' @title Backport of as.Rconcordance.default for R < 4.3.0
#'
#' @description
#' See the original description in \code{tools::as.Rconcordance}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.3.0") S3method("as.Rconcordance", "default")

as.Rconcordance.default <- function(x, ...) {
    # clean comments etc.
    s <- sub("^.*(concordance){1}?", "concordance", sub("[^[:digit:]]*$", "", x))
    s <- grep("^concordance:", s, value = TRUE)
    if (!length(s))
    	return(NULL)
    result <- stringToConcordance(s[1])
    for (line in s[-1])
    	result <- addConcordance(result, line)
    result
}

# This takes one concordance string and produces a single concordance
# object

stringToConcordance <- function(s) {
    split <- strsplit(s, ":")[[1]]
    targetfile <- split[2]
    srcFile <- split[3]
    if (length(split) == 4) {
    	ofs <- 0
    	vi <- 4
    } else {
    	ofs <- as.integer(sub("^ofs ([0-9]+)", "\\1", split[4]))
    	vi <- 5
    }
    values <- as.integer(strsplit(split[vi], " ")[[1]])
    firstline <- values[1]
    rledata <- matrix(values[-1], nrow = 2)
    rle <- structure(list(lengths=rledata[1,], values=rledata[2,]), class="rle")
    diffs <- inverse.rle(rle)
    srcLines <- c(firstline, firstline + cumsum(diffs))
    structure(list(offset = ofs, srcFile = srcFile, srcLine = srcLines),
    	      class = "Rconcordance")
}

# This modifies an existing concordance object to incorporate
# one new concordance string

addConcordance <- function(conc, s) {
    prev <- stringToConcordance(s)
    if (!is.null(prev)) {
    	conc$srcFile <- rep_len(conc$srcFile, length(conc$srcLine))
        i <- seq_along(prev$srcLine)
        conc$srcFile[prev$offset + i] <- prev$srcFile
        conc$srcLine[prev$offset + i] <- prev$srcLine
    }
    conc
}

# This modifies an existing concordance by following links specified
# in a previous one.

followConcordance <- function(conc, prevConcordance) {
    if (!is.null(prevConcordance)) {
    	curLines <- conc$srcLine
    	curFile <- rep_len(conc$srcFile, length(curLines))
    	curOfs <- conc$offset
    	
    	prevLines <- prevConcordance$srcLine
    	prevFile <- rep_len(prevConcordance$srcFile, length(prevLines))
    	prevOfs <- prevConcordance$offset
    	
    	if (prevOfs) {
    	  prevLines <- c(rep(NA_integer_, prevOfs), prevLines)
    	  prevFile <- c(rep(NA_character_, prevOfs), prevFile)
    	  prevOfs <- 0
    	}
	n0 <- max(curLines)
	n1 <- length(prevLines)
	if (n1 < n0) {
	    prevLines <- c(prevLines, rep(NA_integer_, n0 - n1))
	    prevFile <- c(prevFile, rep(NA_character_, n0 - n1))
	}
	new <- is.na(prevLines[curLines])
		
	conc$srcFile <- ifelse(new, curFile,
			       prevFile[curLines])
	conc$srcLine <- ifelse(new, curLines,
				prevLines[curLines])
    }
    conc
}

#' @title Backport of matchConcordance for R < 4.3.0
#'
#' @description
#' See the original description in \code{tools::matchConcordance}.
#'
#' @keywords internal
#' @rawNamespace if (getRversion() < "4.3.0") export(matchConcordance)

matchConcordance <- function(linenum, concordance) {
  if (!all(c("offset", "srcLine", "srcFile") %in% names(concordance)))
    stop("concordance is not valid")
  linenum <- as.numeric(linenum)
  srcLines <- concordance$srcLine
  srcFile <- rep_len(concordance$srcFile, length(srcLines))
  offset <- concordance$offset
  
  result <- matrix(character(), length(linenum), 2,
                   dimnames = list(NULL,
                                   c("srcFile", "srcLine")))
  for (i in seq_along(linenum)) {
    if (linenum[i] <= concordance$offset)
      result[i,] <- c("", "")
    else
      result[i,] <- c(srcFile[linenum[i] - offset],
                      with(concordance, srcLine[linenum[i] - offset]))
  }
  result
}
