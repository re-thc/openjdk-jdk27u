/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

#include "gc/shared/collectedHeap.hpp"
#include "memory/universe.hpp"
#include "oops/arrayOop.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/handles.inline.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/zipRuntime.hpp"
#include "utilities/zipLibrary.hpp"

jlong ZipRuntime::process(jint inflate, oop receiver, jlong stream,
    oop input, jlong input_offset, jint input_len,
    oop output, jlong output_offset, jint output_len, jint flush, jint params,
    JavaThread* current) {
  Handle recv(current, receiver);
  Handle in(current, input);
  Handle out(current, output);
  current->enter_jni_deferred_suspension();
  if (in.not_null()) Universe::heap()->pin_object(current, in());
  if (out.not_null()) Universe::heap()->pin_object(current, out());
  jlong in_addr = input_offset;
  jlong out_addr = output_offset;
  if (in.not_null()) in_addr += cast_from_oop<jlong>(in()) + arrayOopDesc::base_offset_in_bytes(T_BYTE);
  if (out.not_null()) out_addr += cast_from_oop<jlong>(out()) + arrayOopDesc::base_offset_in_bytes(T_BYTE);
  jlong result;
  {
    ThreadToNativeFromVM transition(current);
    result = ZipLibrary::process(current->jni_environment(), inflate, nullptr,
        stream, in_addr, input_len, out_addr, output_len, flush, params);
  }
  if (out.not_null()) Universe::heap()->unpin_object(current, out());
  if (in.not_null()) Universe::heap()->unpin_object(current, in());
  current->exit_jni_deferred_suspension();
  if ((static_cast<uint64_t>(result) >> 62) == 3) {
    jobject recv_handle = JNIHandles::make_local(current, recv());
    {
      ThreadToNativeFromVM transition(current);
      result = ZipLibrary::complete(current->jni_environment(), inflate, recv_handle,
        stream, input_len, output_len, params, static_cast<jint>(result));
    }
    JNIHandles::destroy_local(recv_handle);
  }
  return result;
}

// The outgoing argument block belongs to the compiled caller. Copy the oops
// into handles in process() before any transition can reach a safepoint.
JRT_ENTRY(jlong, ZipRuntime::process_c1(JavaThread* current, const jlong* args))
  return process(static_cast<jint>(args[0]), cast_to_oop(args[1]), args[2],
      cast_to_oop(args[3]), args[4], static_cast<jint>(args[5]),
      cast_to_oop(args[6]), args[7], static_cast<jint>(args[8]),
      static_cast<jint>(args[9]), static_cast<jint>(args[10]), current);
JRT_END
