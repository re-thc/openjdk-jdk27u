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
#include "runtime/vm_version.hpp"
#include "utilities/zmij.hpp"

// The SSE4.1 implementation is compiled in a separate translation unit.
#define ZMIJ_HOTSPOT_SHORTEST_ONLY
#define ZMIJ_MALLOC(size) os::malloc(size, mtInternal)
#define ZMIJ_FREE(ptr) os::free(ptr)
#include "utilities/zmij/zmij-impl.hpp"
#include "utilities/zmijMetadata.inline.hpp"

Zmij::Formatter Zmij::formatter() {
#if defined(AMD64) && !defined(ZERO)
  if (VM_Version::supports_sse4_1()) {
    return format_sse41;
  }
#endif
  return format;
}

int Zmij::format(void* output, uint64_t bits, int format) {
  return format_impl(output, bits, format, zmij::detail::write<double>, zmij::detail::write<float>);
}

uint64_t Zmij::decimal(uint64_t bits) {
  return hotspot_zmij_decimal_metadata(bits);
}
