/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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

#ifndef SHARE_RUNTIME_STRINGZILLA_HPP
#define SHARE_RUNTIME_STRINGZILLA_HPP

#include "classfile/vmIntrinsics.hpp"
#include "utilities/globalDefinitions.hpp"

class StringZilla : AllStatic {
 public:
  static void register_kernels(const void* table);
  static int capabilities();
  static address entry(vmIntrinsics::ID id);
  static int search_char(const char* src, int length, int ch, bool utf16, bool reverse);
  static int search(const char* src, int length, const char* tgt, int tgt_length,
                    int encoding, bool reverse);
};

#endif // SHARE_RUNTIME_STRINGZILLA_HPP
