#include <R.h>
#include <Rinternals.h>

SEXP dotsElt(SEXP env_, SEXP i_) {
    SEXP ddd = findVar(R_DotsSymbol, env_);
    int i = INTEGER(i_)[0];
    R_len_t n = length(ddd);

    if (ddd == R_UnboundValue)
        error("incorrect context: the current call has no '...' to look in");
    if (i <= 0)
        error("indexing '...' with non-positive index %d", i);
    if (i > n)
        error("the ... list does not contain %d elements", i);

    ddd = nthcdr(ddd, i - 1);
    return eval(CAR(ddd), env_);
}
