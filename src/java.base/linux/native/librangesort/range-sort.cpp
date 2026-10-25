/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#include <cstdint>
#include <cstddef>

#if !defined(__x86_64__) || !defined(__GNUC__)
#error "The experimental range sort is Linux x86_64 GCC only"
#endif

// Keep ISA-targeted templates and the kernel separate from the guarded entry.
#pragma GCC push_options
#pragma GCC target("avx512f,avx512dq,avx512vl,avx2,popcnt")

#undef XSS_USE_OPENMP
#if defined(RANGE_SORT_BACKEND_EMBEDDED)
#include "embedded/avx512-64bit-qsort.hpp"
#elif defined(RANGE_SORT_BACKEND_UPSTREAM)
#include "upstream/avx512-64bit-common.h"
#else
#error "Select exactly one experimental backend at build time"
#endif

#include <algorithm>

namespace {

constexpr uintptr_t kStackReserve = 32 * 1024;
constexpr int32_t kMinElements = 512;
constexpr int32_t kMaxElements = 8192;

// This frame is entered only after the outer function validates the stack
// reserve, so the compiler cannot allocate this SIMD frame before the guard.
static __attribute__((noinline, noclone)) void
bounded_long_xss_kernel(int64_t* range, size_t count) {
#if defined(RANGE_SORT_BACKEND_EMBEDDED)
    avx512_fast_sort(range, 0, static_cast<arrsize_t>(count), 20);
#else
    xss_qsort<zmm_vector<int64_t>, int64_t, false>(range, count, false);
#endif
}

} // namespace

#pragma GCC pop_options

extern "C" __attribute__((visibility("default"), noinline, noclone))
int bounded_long_xss_sort(int64_t* array, int32_t low, int32_t high,
                          const void* carrier_stack_limit) noexcept {
    // All declines precede the first array access or mutation.
    if (array == nullptr || carrier_stack_limit == nullptr || low < 0 || high < low) {
        return 0;
    }
    const int64_t count64 = static_cast<int64_t>(high) - static_cast<int64_t>(low);
    if (count64 < kMinElements || count64 > kMaxElements) return 0;

    uintptr_t current_sp;
    __asm__ volatile("mov %%rsp, %0" : "=r"(current_sp));
    const uintptr_t stack_limit = reinterpret_cast<uintptr_t>(carrier_stack_limit);
    if (current_sp <= stack_limit || current_sp - stack_limit < kStackReserve) {
        return 0;
    }

    int64_t* range = array + low; // Caller proves [low, high) is a Java array range.
    const size_t count = static_cast<size_t>(count64);
    bounded_long_xss_kernel(range, count);
    return 1;
}
