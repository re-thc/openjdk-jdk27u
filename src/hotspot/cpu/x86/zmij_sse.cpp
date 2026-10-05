/*
 * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2024, Alibaba Group Holding Limited. All Rights Reserved.
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 *
 */

#include "runtime/os.hpp"
#include "utilities/zmij.hpp"

#if defined(AMD64) && !defined(ZERO)
// The portable translation unit keeps SSE2. Compile this separate namespace
// for SSE4.1 and select it only after VM_Version has checked CPU capabilities.
#if defined(__clang__)
#pragma clang attribute push(__attribute__((target("sse4.1"))), apply_to = function)
#elif defined(__GNUC__)
#pragma GCC push_options
#pragma GCC target("sse4.1")
#endif
#define ZMIJ_USE_SSE4_1 1
#define zmij hotspot_zmij_sse41
#define ZMIJ_SHORTEST_ONLY 1
#define ZMIJ_MALLOC(size) os::malloc(size, mtInternal)
#define ZMIJ_FREE(ptr) os::free(ptr)
#include "utilities/zmij/zmij-impl.hpp"
#undef zmij

int Zmij::format_sse41(void* output, uint64_t bits, int format) {
  return format_impl(output, bits, format,
                     hotspot_zmij_sse41::detail::write<double>, hotspot_zmij_sse41::detail::write<float>);
}

#if defined(__clang__)
#pragma clang attribute pop
#elif defined(__GNUC__)
#pragma GCC pop_options
#endif
#endif // AMD64 && !ZERO
