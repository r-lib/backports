#include <R.h>
#include <Rinternals.h>
#include <Rversion.h>

#define length_DOTS(_v_) (TYPEOF(_v_) == DOTSXP ? length(_v_) : 0)

SEXP dotsNames(SEXP env) {
    #if defined(R_VERSION) && R_VERSION >= R_Version(4, 6, 0)
        if (!R_DotsExist(env))
            error("incorrect context: the current call has no '...' to look in");
        return R_DotsNames(env);
    #else
        SEXP vl = findVar(R_DotsSymbol, env);
        PROTECT(vl);
        if (vl == R_UnboundValue)
            error("incorrect context: the current call has no '...' to look in");
        SEXP out;
        int n = length_DOTS(vl);
        Rboolean named = FALSE;
        for(int i = 0; i < n; i++) {
            if(TAG(vl) != R_NilValue) {
                if(!named) { named = TRUE;
                    PROTECT(out = allocVector(STRSXP, n)); // and is filled with "" already
                }
                SET_STRING_ELT(out, i, PRINTNAME(TAG(vl)));
            }
            vl = CDR(vl);
        }
        if(named) {
            UNPROTECT(1);
        } else {
            out = R_NilValue;
        }
        UNPROTECT(1);
        return out;
    #endif
}

#undef length_DOTS
