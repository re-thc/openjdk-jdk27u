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
 *
 */

#include "classfile/javaClasses.hpp"
#include "classfile/vmSymbols.hpp"
#include "gc/shared/collectedHeap.hpp"
#include "interpreter/abstractInterpreter.hpp"
#include "memory/universe.hpp"
#include "oops/arrayOop.hpp"
#include "oops/instanceKlass.inline.hpp"
#include "runtime/atomic.hpp"
#include "runtime/handles.inline.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/zipRuntime.hpp"
#include "utilities/zipLibrary.hpp"

// Resolve only when an Inflater completes. Do not preload its class at VM
// startup or select a same-named field declared by a user subclass.
static Atomic<int> inflater_checksum_offset{0};

static NOINLINE int resolve_inflater_checksum_offset(oop receiver) {
  Klass* klass = receiver->klass();
  while (klass != nullptr && klass->name() != vmSymbols::java_util_zip_Inflater()) {
    klass = klass->super();
  }
  guarantee(klass != nullptr && klass->class_loader() == nullptr, "expected bootstrap Inflater");
  int offset = 0;
  JavaClasses::compute_offset(offset, InstanceKlass::cast(klass),
      vmSymbols::zip_outputConsumed_name(), vmSymbols::int_signature());
  guarantee(offset > 0, "missing Inflater checksum output");
  inflater_checksum_offset.release_store(offset);
  return offset;
}

static void store_inflater_checksum(oop receiver, jint checksum) {
  int offset = inflater_checksum_offset.load_acquire();
  if (offset == 0) offset = resolve_inflater_checksum_offset(receiver);
  receiver->int_field_put(offset, checksum);
}

jlong ZipRuntime::process(jint inflate, oop receiver, jlong stream,
    oop input, jlong input_offset, jint input_len,
    oop output, jlong output_offset, jint output_len, jint flush, jint params,
    JavaThread* current) {
  Handle recv(current, receiver);
  // A zero-length range cannot be read or written. Keep a valid native
  // address for zlib's pointer checks without pinning an empty heap array.
  static jbyte empty;
  Handle in(current, input_len == 0 ? nullptr : input);
  Handle out(current, output_len == 0 ? nullptr : output);
  const bool pin_arrays = in.not_null() || out.not_null();
  if (pin_arrays) current->enter_jni_deferred_suspension();
  if (in.not_null()) Universe::heap()->pin_object(current, in());
  if (out.not_null()) Universe::heap()->pin_object(current, out());
  jlong in_addr = input_len == 0 ? reinterpret_cast<jlong>(&empty) : input_offset;
  jlong out_addr = output_len == 0 ? reinterpret_cast<jlong>(&empty) : output_offset;
  if (in.not_null()) in_addr += cast_from_oop<jlong>(in()) + arrayOopDesc::base_offset_in_bytes(T_BYTE);
  if (out.not_null()) out_addr += cast_from_oop<jlong>(out()) + arrayOopDesc::base_offset_in_bytes(T_BYTE);
  jlong result;
  jint checksum = 0;
  {
    ThreadToNativeFromVM transition(current);
    result = ZipLibrary::process(inflate, stream, in_addr, input_len,
                                out_addr, output_len, flush, params, &checksum);
  }
  if (out.not_null()) Universe::heap()->unpin_object(current, out());
  if (in.not_null()) Universe::heap()->unpin_object(current, in());
  if (pin_arrays) current->exit_jni_deferred_suspension();
  if (inflate && (static_cast<uint64_t>(result) >> 62) == 1) {
    // Both arrays are unpinned and recv is a GC-safe handle. No JNI call or
    // second native transition is needed for successful stream completion.
    store_inflater_checksum(recv(), checksum);
  }
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

// In each existing instance-native signature, the receiver is local 0 and
// stream is local 1/2. An array plus its int offset occupies the same two
// slots as a native long address, so both lengths have fixed positions.
template<bool inflate, bool input_array, bool output_array>
static jlong process_zip_interpreter(JavaThread* current, intptr_t* locals) {
  return ZipRuntime::process(inflate,
      *AbstractInterpreter::oop_addr_in_slot(locals),
      AbstractInterpreter::long_in_slot(locals - 2),
      input_array ? *AbstractInterpreter::oop_addr_in_slot(locals - 3) : nullptr,
      input_array ? *AbstractInterpreter::int_addr_in_slot(locals - 4)
                  : AbstractInterpreter::long_in_slot(locals - 4),
      *AbstractInterpreter::int_addr_in_slot(locals - 5),
      output_array ? *AbstractInterpreter::oop_addr_in_slot(locals - 6) : nullptr,
      output_array ? *AbstractInterpreter::int_addr_in_slot(locals - 7)
                   : AbstractInterpreter::long_in_slot(locals - 7),
      *AbstractInterpreter::int_addr_in_slot(locals - 8),
      inflate ? 0 : *AbstractInterpreter::int_addr_in_slot(locals - 9),
      inflate ? 0 : *AbstractInterpreter::int_addr_in_slot(locals - 10), current);
}

JRT_ENTRY(jlong, ZipRuntime::deflate_bytes_bytes_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<false, true, true>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::deflate_bytes_buffer_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<false, true, false>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::deflate_buffer_bytes_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<false, false, true>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::deflate_buffer_buffer_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<false, false, false>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::inflate_bytes_bytes_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<true, true, true>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::inflate_bytes_buffer_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<true, true, false>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::inflate_buffer_bytes_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<true, false, true>(current, locals);
JRT_END

JRT_ENTRY(jlong, ZipRuntime::inflate_buffer_buffer_interpreter(JavaThread* current, intptr_t* locals))
  return process_zip_interpreter<true, false, false>(current, locals);
JRT_END
