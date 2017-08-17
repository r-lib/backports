#include <R.h>
#include <Rinternals.h>

SEXP dotsLength(SEXP env_) {
    SEXP ddd = findVar(R_DotsSymbol, env_);
    if (ddd == R_UnboundValue)
        error("incorrect context: the current call has no '...' to look in");
    return ScalarInteger(TYPEOF(ddd) == DOTSXP ? length(ddd) : 0);
}
