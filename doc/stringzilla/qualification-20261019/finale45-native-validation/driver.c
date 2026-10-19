/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only */
#include "test/jdk/java/lang/String/libStringZillaKernelsTest.c"
#include <stdio.h>
int main(void) {
    for (jint mask = 0; mask < 8; mask++) {
        requested_capabilities = mask;
        test_initialize();
        printf("requested=%d selected=%d executable=%d\n",
               mask, published->capabilities, can_execute(published->capabilities));
    }
    int failure = check_kernels();
    if (failure != 0) {
        fprintf(stderr, "Native kernel check failed at line %d\n", failure);
        return 1;
    }
    puts("StringZilla production native kernel checks passed");
    return 0;
}
