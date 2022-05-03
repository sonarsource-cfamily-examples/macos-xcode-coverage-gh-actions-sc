#include "test2.h"
#include "lib.h"

int ff(int x) {
    return 2 / x;
}

int testMyfun2() {
    return myfun(false, ff);
}
