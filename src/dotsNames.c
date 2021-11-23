#include <R.h>
#include <Rinternals.h>

#define length_DOTS(_v_) (TYPEOF(_v_) == DOTSXP ? length(_v_) : 0)

SEXP dotsNames(SEXP env) {
    SEXP vl = findVar(R_DotsSymbol, env);
    PROTECT(vl);
    if (vl == R_UnboundValue) {
        error("incorrect context: the current call has no '...' to look in");
    }

    SEXP out = PROTECT(allocVector(STRSXP, length_DOTS(vl)));
    for(int i = 0; i < LENGTH(out); i++) {
        SEXP tag = TAG(vl);
        SET_STRING_ELT(out, i, tag == R_NilValue ? NA_STRING : PRINTNAME(tag));
        vl = CDR(vl);
    }

    UNPROTECT(2); /* ans, vl */
    return out;
}

#undef length_DOTS
