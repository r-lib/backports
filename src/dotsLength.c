#include <R.h>
#include <Rinternals.h>
#include <Rversion.h>

SEXP dotsLength(SEXP env_) {
    #if defined(R_VERSION) && R_VERSION >= R_Version(4, 6, 0)
        if (!R_DotsExist(env_)) {
            error("incorrect context: the current call has no '...' to look in");
        }
        return ScalarInteger(R_DotsLength(env_));
    #else
        SEXP ddd = findVar(R_DotsSymbol, env_);
        if (ddd == R_UnboundValue)
            error("incorrect context: the current call has no '...' to look in");
        return ScalarInteger(TYPEOF(ddd) == DOTSXP ? length(ddd) : 0);
    #endif
}
