#include "/workspace/sz-candidate/test/jdk/java/lang/String/libStringZillaKernelsTest.c"
#include <stdio.h>
int main(void) {
    int line = check_kernels();
    printf("kernel failure line: %d\n", line);
    return line != 0;
}
