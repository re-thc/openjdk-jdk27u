/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#define _GNU_SOURCE
#include <dlfcn.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdatomic.h>
extern void* __libc_malloc(size_t);
static _Atomic unsigned long failures;
void* malloc(size_t size) {
    Dl_info info;
    if(dladdr(__builtin_return_address(0),&info) && info.dli_fname && strstr(info.dli_fname,"libprimitivesort.so")) {
        atomic_fetch_add(&failures,1);return NULL;
    }
    return __libc_malloc(size);
}
__attribute__((destructor)) static void report(void) {fprintf(stderr,"Injected native allocation failures: %lu\n",atomic_load(&failures));}
