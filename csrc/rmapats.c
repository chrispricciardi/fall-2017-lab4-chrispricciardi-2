#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0 (struct dummyq_struct * I1002, EBLK  * I1003, U  I709);
void  hsG_0 (struct dummyq_struct * I1002, EBLK  * I1003, U  I709)
{
    U  I1231;
    U  I1232;
    U  I1233;
    struct futq * I1234;
    I1231 = ((U )vcs_clocks) + I709;
    I1233 = I1231 & 0xfff;
    I1003->I642 = (EBLK  *)(-1);
    I1003->I646 = I1231;
    if (I1231 < (U )vcs_clocks) {
        I1232 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I1002, I1003, I1232 + 1, I1231);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I709 == 1)) {
        I1003->I647 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I642 = I1003;
        peblkFutQ1Tail = I1003;
    }
    else if ((I1234 = I1002->I968[I1233].I659)) {
        I1003->I647 = (struct eblk *)I1234->I658;
        I1234->I658->I642 = (RP )I1003;
        I1234->I658 = (RmaEblk  *)I1003;
    }
    else {
        sched_hsopt(I1002, I1003, I1231);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
