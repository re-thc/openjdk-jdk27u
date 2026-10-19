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

#include <new>
#include <atomic>
#include <cstdio>
#include "hwy/os_rng.h"
static std::atomic<unsigned long> failures{0};
namespace hwy {
bool Fill16BytesSecure(void*) { failures.fetch_add(1); throw std::bad_alloc(); }
}
__attribute__((destructor)) static void report() {
    std::fprintf(stderr,"Injected same-component C++ seed failures: %lu\n",failures.load());
}
