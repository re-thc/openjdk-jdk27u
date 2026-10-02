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

#include "jvm.h"
#include "classfile/javaClasses.hpp"
#include "logging/log.hpp"
#include "tmfy/kernels.h"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/tmfyStringCoding.hpp"
#include "runtime/tmfyStringCodingTooling.hpp"
#include "runtime/jniHandles.inline.hpp"

static bool jni_range(JNIEnv* env, jarray array, jint offset, jint length) {
  if (array == nullptr || offset < 0 || length < 0) return false;
  jsize size = env->GetArrayLength(array);
  return offset <= size && length <= size - offset;
}

static jint JNICALL tmfy_encode(JNIEnv* env, jclass, jbyteArray input, jint offset, jint length,
                                jbyteArray output, jint output_offset, jint capacity) {
  TmfyStringCoding::count(TmfyStringCoding::jni_calls);
  if (!jni_range(env, input, offset, length) || !jni_range(env, output, output_offset, capacity) ||
      env->IsSameObject(input, output) || length > capacity / 2) return TMFY_BAD_ARGUMENT;
  if ((uint32_t)length > TMFY_CONVERT_MAX_BYTES) return TMFY_NEEDS_GENERAL;
  if (length == 0) return 0;
  // Ordinary JNI transition, bounded copies, and no retained or pinned Java
  // pointer. Only the successful converter result is copied into the output.
  uint8_t source[TMFY_CONVERT_MAX_BYTES];
  uint8_t destination[TMFY_CONVERT_MAX_BYTES * 2];
  env->GetByteArrayRegion(input, offset, length, (jbyte*)source);
  if (env->ExceptionCheck()) return TMFY_BAD_ARGUMENT;
  jint result = tmfy_encode_latin1_utf8(source, length, destination, sizeof(destination));
  if (result >= 0) env->SetByteArrayRegion(output, output_offset, result, (const jbyte*)destination);
  return result;
}

static jlongArray JNICALL tmfy_counters(JNIEnv* env, jclass) {
  jlong values[TmfyStringCoding::counter_count];
  for (int i = 0; i < TmfyStringCoding::counter_count; ++i) values[i] = TmfyStringCoding::counter((TmfyStringCoding::Counter)i);
  jlongArray result = env->NewLongArray(TmfyStringCoding::counter_count);
  if (result != nullptr) env->SetLongArrayRegion(result, 0, TmfyStringCoding::counter_count, values);
  return result;
}

static JNINativeMethod tmfy_methods[] = {
  { (char*)"encodeLatin1Utf80", (char*)"([BII[BII)I", (void*)&tmfy_encode },
  { (char*)"counters0", (char*)"()[J", (void*)&tmfy_counters }
};

JVM_ENTRY(void, JVM_RegisterTmfyStringCodingMethods(JNIEnv* env, jclass cls))
  TmfyStringCodingTooling::prepare_registration(java_lang_Class::as_Klass(JNIHandles::resolve_non_null(cls)),
                                         tmfy_methods, ARRAY_SIZE(tmfy_methods));
  ThreadToNativeFromVM ttnfv(thread);
  if (tmfy_runtime_initialize() != 0) {
    jclass error = env->FindClass("java/lang/ExceptionInInitializerError");
    if (error != nullptr) env->ThrowNew(error, "Unable to select UTF-8 conversion implementation");
    return;
  }
  if (env->RegisterNatives(cls, tmfy_methods, ARRAY_SIZE(tmfy_methods)) != 0) return;
  log_info(tmfy)("UTF-8 conversion backend=%s intrinsic_requested=%s", tmfy_implementation_name(),
                 UseTmfyStringCoding ? "true" : "false");
JVM_END
