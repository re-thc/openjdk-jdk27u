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
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#include <stdint.h>
#include <string.h>
#include "export.h"

EXPORT int32_t scalar_int(int32_t value) { return value; }
EXPORT uint64_t scalar_long(uint64_t value) { return value; }
EXPORT int64_t scalar_long_signed(int64_t value) { return value; }
EXPORT uint64_t scalar_long_xor(uint64_t value) { return value ^ UINT64_C(0x55); }
EXPORT double scalar_double(double value) { return value; }
EXPORT double scalar_double_flip(double value) {
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    bits ^= UINT64_C(0x8000000000000000);
    memcpy(&value, &bits, sizeof(value));
    return value;
}
