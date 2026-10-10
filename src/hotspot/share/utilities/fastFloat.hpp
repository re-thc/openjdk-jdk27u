/*
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

#ifndef SHARE_UTILITIES_FASTFLOAT_HPP
#define SHARE_UTILITIES_FASTFLOAT_HPP

#include "memory/allStatic.hpp"
#include "utilities/globalDefinitions.hpp"

class FastFloat : AllStatic {
 public:
  // Bound leaf-call latency, including fast_float's rare digit-comparison path.
  static const int max_input_length = 1024;

  // Read immutable String storage without allocating or reaching a safepoint.
  // Return NaN for unsupported syntax; Java supplies the specified exceptions.
  // ix == 1 rounds directly to float, then widens exactly to double.
  static double parse(const void* value, int byte_length, int coder, int ix);
  static double parse_digits(const void* digits, int length, int decimal_exponent);
};

#endif // SHARE_UTILITIES_FASTFLOAT_HPP
