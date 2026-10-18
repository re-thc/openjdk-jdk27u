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

#ifndef SHARE_OPTO_CONSTANTTHRESHOLD_HPP
#define SHARE_OPTO_CONSTANTTHRESHOLD_HPP

#include "utilities/globalDefinitions.hpp"

// x <= le_bound is x < lt_bound only if incrementing the bound does not
// wrap in the comparison's signed or unsigned domain. Keep this predicate
// independent of graph folding so the domain endpoints can be tested directly.
inline bool is_adjacent_constant_threshold(jint le_bound, jint lt_bound, bool is_unsigned) {
  return le_bound != (is_unsigned ? -1 : max_jint) && java_add(le_bound, 1) == lt_bound;
}

inline bool is_adjacent_constant_threshold(jlong le_bound, jlong lt_bound, bool is_unsigned) {
  return le_bound != (is_unsigned ? -1 : max_jlong) && java_add(le_bound, (jlong)1) == lt_bound;
}

#endif // SHARE_OPTO_CONSTANTTHRESHOLD_HPP
