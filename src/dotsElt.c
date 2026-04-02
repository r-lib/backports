#include <R.h>
#include <Rinternals.h>
#include <Rversion.h>

static void run_checks(Rboolean exists, int i, int n) {
    if (!exists)
        error("incorrect context: the current call has no '...' to look in");
    if (i <= 0)
        error("indexing '...' with non-positive index %d", i);
    if (i > n)
        error("the ... list does not contain %d elements", i);
}

SEXP dotsElt(SEXP env_, SEXP i_) {
    int i = INTEGER(i_)[0];

    #if defined(R_VERSION) && R_VERSION >= R_Version(4, 6, 0)
        run_checks(R_DotsExist(env_), i, R_DotsLength(env_));
        return R_DotsElt(INTEGER(i_)[0], env_);
    #else
        SEXP ddd = findVar(R_DotsSymbol, env_);
        run_checks(ddd != R_UnboundValue, i, length(ddd));
        ddd = nthcdr(ddd, i - 1);
        return eval(CAR(ddd), env_);
    #endif
}
