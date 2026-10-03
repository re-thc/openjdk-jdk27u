/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#include "ci/ciEnv.hpp"
#include "ci/ciField.hpp"
#include "ci/ciMethod.hpp"
#include "ci/ciStreams.hpp"
#include "ci/ciStringUtf8.hpp"
#include "ci/ciUtilities.inline.hpp"
#include "classfile/moduleEntry.hpp"
#include "code/dependencies.hpp"
#include "oops/method.inline.hpp"
#include "oops/oop.inline.hpp"
#include "prims/jvmtiExport.hpp"
#include "runtime/globals.hpp"
#include "runtime/tmfyStringCoding.hpp"
#include "runtime/tmfyStringCodingTooling.hpp"

// The native regions in the two String origins are optional admission hints.
// Validate their entire bytecode shape and symbolic references before a
// compiler omits setup or narrows their size range. Transformed origins and
// changed javac layouts retain ordinary parsing. Both C1 and C2 record the same
// evolution and native-bind dependencies, even when optional calls disappear.
ciStringUtf8::Admission ciStringUtf8::admission(ciMethod* method, int bci, ciEnv* env) {
  bool encode_guard = bci == 41 || bci == 49 || bci == 53 || bci == 61 || bci == 67 || bci == 73;
  bool decode_guard = bci == 10 || bci == 18 || bci == 26 || bci == 32 || bci == 38;
  if ((!encode_guard && !decode_guard) || method->holder() != env->String_klass()) return Ordinary;
  bool encode = encode_guard && strcmp(method->name()->as_utf8(), "encodeUTF8_UTF16") == 0 &&
                strcmp(method->signature()->as_symbol()->as_utf8(), "([BLjava/lang/Class;)[B") == 0;
  bool decode = decode_guard && strcmp(method->name()->as_utf8(), "decodeUTF8_UTF16Stable") == 0 &&
                strcmp(method->signature()->as_symbol()->as_utf8(), "([BII[BI)I") == 0;
  if ((!encode && !decode) ||
      method->code_size() != (encode ? 514 : 122) ||
      method->max_locals() != (encode ? 10 : 7) || method->has_exception_handlers()) return Ordinary;

  vmIntrinsics::ID intrinsic = encode ? vmIntrinsics::_tmfy_encodeUtf16Utf8 : vmIntrinsics::_tmfy_decodeUtf8Utf16;
  bool leaf_supported;
  {
    VM_ENTRY_MARK;
    Method* origin = method->get_Method();
    InstanceKlass* holder = origin->method_holder();
    if (origin->is_old() || origin->number_of_breakpoints() != 0 ||
        holder->class_loader() != nullptr || holder->has_been_transformed() ||
        holder->has_been_redefined() || holder->module()->is_patched() ||
        DTraceMethodProbes || TmfyStringCodingTooling::revoked() ||
        JvmtiExport::can_post_interpreter_events() ||
        JvmtiExport::should_post_native_method_bind()) return Ordinary;
    // Tooling requires the original calls to remain observable. Unsupported
    // collectors/platforms or a disabled feature instead retain Java at a
    // proven pristine origin; they must not pay an unqualified JNI round trip.
    // Direct native callers and explicit DisableIntrinsic controls are separate.
    leaf_supported = TmfyStringCoding::is_supported(intrinsic);
  }

  static const u1 encode_shape[] = {
    Bytecodes::_iconst_0, // 0
    Bytecodes::_istore_2, // 1
    Bytecodes::_iconst_0, // 2
    Bytecodes::_istore_3, // 3
    Bytecodes::_aload_0, // 4
    Bytecodes::_arraylength, // 5
    Bytecodes::_iconst_1, // 6
    Bytecodes::_ishr, // 7
    Bytecodes::_istore, 4, // 8
    Bytecodes::_iload, 4, // 10
    Bytecodes::_iconst_3, // 12
    Bytecodes::_imul, // 13
    Bytecodes::_ifge, 0, 11, // 14
    Bytecodes::_aload_0, // 17
    Bytecodes::_aload_1, // 18
    Bytecodes::_invokestatic, 0, 0, // 19
    Bytecodes::_goto, 0, 7, // 22
    Bytecodes::_iload, 4, // 25
    Bytecodes::_iconst_3, // 27
    Bytecodes::_imul, // 28
    Bytecodes::_istore, 5, // 29
    Bytecodes::_iload, 5, // 31
    Bytecodes::_newarray, 8, // 33
    Bytecodes::_astore, 6, // 35
    Bytecodes::_iload, 4, // 37
    Bytecodes::_bipush, 16, // 39
    Bytecodes::_if_icmplt, 0, 121, // 41
    Bytecodes::_aload_0, // 44
    Bytecodes::_arraylength, // 45
    Bytecodes::_sipush, 16, 0, // 46
    Bytecodes::_if_icmpgt, 0, 113, // 49
    Bytecodes::_aload_1, // 52
    Bytecodes::_ifnonnull, 0, 109, // 53
    Bytecodes::_aload_0, // 56
    Bytecodes::_arraylength, // 57
    Bytecodes::_sipush, 4, 0, // 58
    Bytecodes::_if_icmpge, 0, 9, // 61
    Bytecodes::_getstatic, 0, 0, // 64
    Bytecodes::_ifeq, 0, 95, // 67
    Bytecodes::_invokestatic, 0, 0, // 70
    Bytecodes::_ifeq, 0, 89, // 73
    Bytecodes::_aload_0, // 76
    Bytecodes::_iconst_0, // 77
    Bytecodes::_aload_0, // 78
    Bytecodes::_arraylength, // 79
    Bytecodes::_aload, 6, // 80
    Bytecodes::_iconst_0, // 82
    Bytecodes::_aload, 6, // 83
    Bytecodes::_arraylength, // 85
    Bytecodes::_invokestatic, 0, 0, // 86
    Bytecodes::_istore, 7, // 89
    Bytecodes::_iload, 7, // 91
    Bytecodes::_iload, 4, // 93
    Bytecodes::_if_icmplt, 0, 32, // 95
    Bytecodes::_iload, 7, // 98
    Bytecodes::_aload, 6, // 100
    Bytecodes::_arraylength, // 102
    Bytecodes::_if_icmpgt, 0, 24, // 103
    Bytecodes::_iload, 7, // 106
    Bytecodes::_aload, 6, // 108
    Bytecodes::_arraylength, // 110
    Bytecodes::_if_icmpne, 0, 8, // 111
    Bytecodes::_aload, 6, // 114
    Bytecodes::_goto, 0, 10, // 116
    Bytecodes::_aload, 6, // 119
    Bytecodes::_iload, 7, // 121
    Bytecodes::_invokestatic, 0, 0, // 123
    Bytecodes::_areturn, // 126
    Bytecodes::_iload, 7, // 127
    Bytecodes::_iconst_m1, // 129
    Bytecodes::_if_icmpeq, 0, 32, // 130
    Bytecodes::_new, 0, 0, // 133
    Bytecodes::_dup, // 136
    Bytecodes::_new, 0, 0, // 137
    Bytecodes::_dup, // 140
    Bytecodes::_invokespecial, 0, 0, // 141
    Bytecodes::_ldc_w, 0, 0, // 144
    Bytecodes::_invokevirtual, 0, 0, // 147
    Bytecodes::_iload, 7, // 150
    Bytecodes::_invokevirtual, 0, 0, // 152
    Bytecodes::_invokevirtual, 0, 0, // 155
    Bytecodes::_invokespecial, 0, 0, // 158
    Bytecodes::_athrow, // 161
  };
  static const u1 decode_shape[] = {
    Bytecodes::_iload_2, // 0
    Bytecodes::_iload_1, // 1
    Bytecodes::_isub, // 2
    Bytecodes::_istore, 5, // 3
    Bytecodes::_iload, 5, // 5
    Bytecodes::_sipush, 1, 0, // 7
    Bytecodes::_if_icmplt, 0, 102, // 10
    Bytecodes::_iload, 5, // 13
    Bytecodes::_sipush, 16, 0, // 15
    Bytecodes::_if_icmpgt, 0, 94, // 18
    Bytecodes::_iload, 5, // 21
    Bytecodes::_sipush, 4, 0, // 23
    Bytecodes::_if_icmpge, 0, 9, // 26
    Bytecodes::_getstatic, 0, 0, // 29
    Bytecodes::_ifeq, 0, 80, // 32
    Bytecodes::_invokestatic, 0, 0, // 35
    Bytecodes::_ifeq, 0, 74, // 38
    Bytecodes::_aload_0, // 41
    Bytecodes::_iload_1, // 42
    Bytecodes::_iload, 5, // 43
    Bytecodes::_aload_3, // 45
    Bytecodes::_iload, 4, // 46
    Bytecodes::_iconst_1, // 48
    Bytecodes::_ishl, // 49
    Bytecodes::_iload, 5, // 50
    Bytecodes::_iconst_1, // 52
    Bytecodes::_ishl, // 53
    Bytecodes::_invokestatic, 0, 0, // 54
    Bytecodes::_istore, 6, // 57
    Bytecodes::_iload, 6, // 59
    Bytecodes::_ifle, 0, 16, // 61
    Bytecodes::_iload, 6, // 64
    Bytecodes::_iload, 5, // 66
    Bytecodes::_if_icmpgt, 0, 9, // 68
    Bytecodes::_iload, 4, // 71
    Bytecodes::_iload, 6, // 73
    Bytecodes::_iadd, // 75
    Bytecodes::_ireturn, // 76
    Bytecodes::_iload, 6, // 77
    Bytecodes::_iconst_m1, // 79
    Bytecodes::_if_icmpeq, 0, 32, // 80
    Bytecodes::_new, 0, 0, // 83
    Bytecodes::_dup, // 86
    Bytecodes::_new, 0, 0, // 87
    Bytecodes::_dup, // 90
    Bytecodes::_invokespecial, 0, 0, // 91
    Bytecodes::_ldc_w, 0, 0, // 94
    Bytecodes::_invokevirtual, 0, 0, // 97
    Bytecodes::_iload, 6, // 100
    Bytecodes::_invokevirtual, 0, 0, // 102
    Bytecodes::_invokevirtual, 0, 0, // 105
    Bytecodes::_invokespecial, 0, 0, // 108
    Bytecodes::_athrow, // 111
    Bytecodes::_aload_0, // 112
    Bytecodes::_iload_1, // 113
    Bytecodes::_iload_2, // 114
    Bytecodes::_aload_3, // 115
    Bytecodes::_iload, 4, // 116
    Bytecodes::_invokestatic, 0, 0, // 118
    Bytecodes::_ireturn, // 121
  };
  static_assert(sizeof(encode_shape) == 162, "String encode admission shape");
  static_assert(sizeof(decode_shape) == 122, "String decode admission shape");
  const u1* expected = encode ? encode_shape : decode_shape;
  int limit = encode ? sizeof(encode_shape) : sizeof(decode_shape);
  ciField* readiness = nullptr;
  ciMethod* ready_method = nullptr;
  ciMethod* native_method = nullptr;
  ciBytecodeStream stream(method);
  for (Bytecodes::Code code; (code = stream.next()) != ciBytecodeStream::EOBC();) {
    int pos = stream.cur_bci();
    if (pos >= limit) break;
    if (code != expected[pos]) return Ordinary;
    if (Bytecodes::is_invoke(code)) {
      const char* holder;
      const char* name;
      const char* signature;
      // Encoder/decoder sites share only the error-construction references.
      int site = encode ? pos : pos + 1000;
      switch (site) {
        case 19: holder = "java/lang/String"; name = "encodedLengthUTF8_UTF16"; signature = "([BLjava/lang/Class;)I"; break;
        case 70: case 1035: holder = "java/lang/StringCoding"; name = "utf8Ready"; signature = "()Z"; break;
        case 86: holder = "java/lang/StringCoding"; name = "encodeUtf16Utf80"; signature = "([BII[BII)I"; break;
        case 1054: holder = "java/lang/StringCoding"; name = "decodeUtf8Utf160"; signature = "([BII[BII)I"; break;
        case 123: holder = "java/util/Arrays"; name = "copyOf"; signature = "([BI)[B"; break;
        case 141: case 1091: holder = "java/lang/StringBuilder"; name = "<init>"; signature = "()V"; break;
        case 147: case 1097: holder = "java/lang/StringBuilder"; name = "append"; signature = "(Ljava/lang/String;)Ljava/lang/StringBuilder;"; break;
        case 152: case 1102: holder = "java/lang/StringBuilder"; name = "append"; signature = "(I)Ljava/lang/StringBuilder;"; break;
        case 155: case 1105: holder = "java/lang/StringBuilder"; name = "toString"; signature = "()Ljava/lang/String;"; break;
        case 158: case 1108: holder = "java/lang/InternalError"; name = "<init>"; signature = "(Ljava/lang/String;)V"; break;
        case 1118: holder = "java/lang/String"; name = "decodeUTF8_UTF16"; signature = "([BII[BI)I"; break;
        default: return Ordinary;
      }
      bool will_link;
      ciSignature* declared_signature;
      ciMethod* target = stream.get_method(will_link, &declared_signature);
      if (strcmp(target->holder()->name()->as_utf8(), holder) != 0 ||
          strcmp(target->name()->as_utf8(), name) != 0 ||
          strcmp(target->signature()->as_symbol()->as_utf8(), signature) != 0) return Ordinary;
      if (site == 70 || site == 1035) ready_method = target;
      if (site == 86 || site == 1054) native_method = target;
    } else if (code == Bytecodes::_getstatic) {
      bool will_link;
      readiness = stream.get_field(will_link);
      if (!will_link || !readiness->is_static() || !readiness->is_volatile() ||
          !readiness->is_stable() || readiness->type()->basic_type() != T_BOOLEAN ||
          strcmp(readiness->holder()->name()->as_utf8(), "java/lang/StringCoding") != 0 ||
          strcmp(readiness->name()->as_utf8(), "utf8Ready") != 0) return Ordinary;
    } else if (code == Bytecodes::_new) {
      const char* name = pos == (encode ? 133 : 83) ? "java/lang/InternalError" : "java/lang/StringBuilder";
      if (strcmp(stream.get_klass()->name()->as_utf8(), name) != 0) return Ordinary;
    } else if (code == Bytecodes::_ldc_w) {
      if (!stream.is_string_constant()) return Ordinary;
      int index = stream.get_constant_pool_index();
      VM_ENTRY_MARK;
      const char* message = encode ? "UTF-16 UTF-8 conversion failed: " : "UTF-8 UTF-16 conversion failed: ";
      if (strcmp(method->get_Method()->constants()->string_at_noresolve(index), message) != 0) return Ordinary;
    } else {
      // CI normalizes interpreter-rewritten opcodes. Only pool-index bytes
      // differ; local indexes, constants and branch destinations must match.
      for (int i = 1; i < Bytecodes::length_for(code); ++i) {
        if (stream.cur_bcp()[i] != expected[pos + i]) return Ordinary;
      }
    }
  }
  if (readiness == nullptr || ready_method == nullptr || native_method == nullptr ||
      !ready_method->is_loaded() || !native_method->is_loaded()) return Ordinary;

  bool ready;
  ciMethod* initializer = readiness->holder()->find_method(ciSymbol::make("initializeUtf8"), ciSymbol::make("()Z"));
  if (initializer == nullptr || readiness->holder() != ready_method->holder()) return Ordinary;
  {
    VM_ENTRY_MARK;
    InstanceKlass* holder = ready_method->get_Method()->method_holder();
    if (holder->class_loader() != nullptr || holder->has_been_transformed() ||
        holder->has_been_redefined() ||
        !holder->is_initialized() || holder->java_mirror() == nullptr ||
        native_method->get_Method()->method_holder() != holder ||
        !native_method->is_native() || native_method->intrinsic_id() != intrinsic) return Ordinary;
    // Read the live volatile field without initializing the holder or asking CI
    // to fold @Stable false. A later false-to-true publication does not revoke
    // this optional admission decision and does not change the Java result.
    ready = holder->java_mirror()->bool_field_acquire(readiness->offset_in_bytes());
    // Current StringCoding is not eligible for initialized-mirror archiving;
    // CDS/AOT restores its mutable fields as zero. A live true field alone
    // would not prove native readiness if that archiving policy changes.
    if (method->get_Method()->is_old() ||
        ready_method->get_Method()->is_old() || initializer->get_Method()->is_old() ||
        native_method->get_Method()->is_old() ||
        ready_method->get_Method()->number_of_breakpoints() != 0 ||
        initializer->get_Method()->number_of_breakpoints() != 0) return Ordinary;
  }
  // Preserve late instrumentation even though the optional calls disappear.
  // Native bind revocation and its install-time race check cover this nmethod
  // through the same exact native target used by leaf callers.
  env->dependencies()->assert_evol_method(method);
  env->dependencies()->assert_evol_method(ready_method);
  env->dependencies()->assert_evol_method(initializer);
  env->record_tmfy_dependency(native_method);
  return leaf_supported && ready ? Ready : Java;
}
