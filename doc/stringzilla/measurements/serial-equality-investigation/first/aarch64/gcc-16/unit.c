
#include "test/jdk/java/lang/String/libStringZillaKernelsTest.c"
#include <stdio.h>
int main(void) {
    int failure = check_kernels();
    if (failure != 0) {
        fprintf(stderr, "Native kernel check failed at line %d\n", failure);
        return 1;
    }
    puts("Production native kernel contract checks passed");
    return 0;
}
