#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP dotsElt(SEXP, SEXP);
extern SEXP dotsLength(SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"dotsElt",    (DL_FUNC) &dotsElt,    2},
    {"dotsLength", (DL_FUNC) &dotsLength, 1},
    {NULL, NULL, 0}
};

void R_init_backports(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
