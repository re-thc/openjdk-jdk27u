/*
 * Copyright (c) 1997, 2026, Oracle and/or its affiliates. All rights reserved.
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

#include "utilities/numericFormatting.hpp"
#include "utilities/checkedCast.hpp"

#ifdef DRAGONBOX_ENABLED
#include <dragonbox/dragonbox_to_chars.h>
#endif

bool dragonbox_formatting_available() {
  // ARM64 is intended, but remains upstream until hardware qualification.
#if defined(DRAGONBOX_ENABLED) && defined(LINUX) && defined(AMD64)
  return true;
#else
  return false;
#endif
}

jint dragonbox_double_to_decimal(jbyte* destination, jdouble value) {
#ifdef DRAGONBOX_ENABLED
  static_assert(jkj::dragonbox::max_output_string_length<jkj::dragonbox::ieee754_binary64> == 24,
                "DoubleToDecimal destination contract");
  char* begin = reinterpret_cast<char*>(destination);
  return checked_cast<jint>(jkj::dragonbox::to_chars_n(value, begin) - begin);
#else
  ShouldNotReachHere();
  return 0;
#endif
}

jint dragonbox_float_to_decimal(jbyte* destination, jfloat value) {
#ifdef DRAGONBOX_ENABLED
  static_assert(jkj::dragonbox::max_output_string_length<jkj::dragonbox::ieee754_binary32> == 15,
                "FloatToDecimal destination contract");
  char* begin = reinterpret_cast<char*>(destination);
  return checked_cast<jint>(jkj::dragonbox::to_chars_n(value, begin) - begin);
#else
  ShouldNotReachHere();
  return 0;
#endif
}
