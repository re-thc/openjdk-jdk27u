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

#include <cstdint>
#include "jni.h"

static jlong JNICALL instant_miss(JNIEnv*, jclass, jstring) {
  return INT64_MIN;
}

extern "C" JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void*) {
  JNIEnv* env = nullptr;
  if (vm->GetEnv(reinterpret_cast<void**>(&env), JNI_VERSION_1_8) != JNI_OK) {
    return JNI_ERR;
  }
  jclass parser = env->FindClass("java/time/InstantParser");
  if (parser == nullptr) {
    return JNI_ERR;
  }
  JNINativeMethod methods[] = {
    { const_cast<char*>("parse0"), const_cast<char*>("(Ljava/lang/String;)J"),
      reinterpret_cast<void*>(instant_miss) }
  };
  // The VM leaf keeps its independently registered Rust function pointer.
  // HotSpot may log the intentional cross-loader platform-native rebinding.
  jint result = env->RegisterNatives(parser, methods, 1);
  env->DeleteLocalRef(parser);
  if (result != JNI_OK || env->ExceptionCheck()) {
    return JNI_ERR;
  }
  return JNI_VERSION_1_8;
}
