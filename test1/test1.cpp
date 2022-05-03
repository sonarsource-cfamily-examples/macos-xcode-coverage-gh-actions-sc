#include "test1.h"
#include "lib.h"

int id(int) { return 0; }

int testMyfun1() {
    return myfun(true, &id);
}
