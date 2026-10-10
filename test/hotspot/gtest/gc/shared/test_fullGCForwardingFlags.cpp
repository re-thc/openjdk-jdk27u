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

#include "gc/shared/fullGCForwarding.hpp"
#include "runtime/flags/flagSetting.hpp"
#include "runtime/flags/jvmFlag.hpp"
#include "runtime/globals.hpp"
#include "unittest.hpp"

TEST_VM(FullGCForwarding, oversized_eight_byte_heap_disables_compact_headers) {
#ifdef _LP64
  FlagSetting four_byte(UseFourByteObjectHeaders, false);
  FlagSetting compact(UseCompactObjectHeaders, true);
  JVMFlag* compact_flag = JVMFlag::find_flag("UseCompactObjectHeaders");
  JVMFlagOrigin saved_origin = compact_flag->get_origin();
  FullGCForwarding::initialize_flags(SIZE_MAX);
  compact_flag->set_origin(saved_origin);
  ASSERT_FALSE(UseCompactObjectHeaders);
#endif
}
