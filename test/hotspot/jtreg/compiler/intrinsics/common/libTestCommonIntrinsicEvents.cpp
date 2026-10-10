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

#include <cstring>
#include <jvmti.h>

namespace {
jvmtiEnv* jvmti = nullptr;
constexpr int target_count = 6;
jmethodID targets[target_count];
jlong counts[target_count];

void check(JNIEnv* jni, jvmtiError error) {
  if (error != JVMTI_ERROR_NONE) jni->FatalError("JVMTI operation failed");
}

void JNICALL method_entry(jvmtiEnv*, JNIEnv*, jthread, jmethodID method) {
  // Notifications are enabled only on the test's calling thread.
  for (int i = 0; i < target_count; i++) {
    if (method == targets[i]) counts[i]++;
  }
}
} // namespace

extern "C" {
JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
  if (vm->GetEnv(reinterpret_cast<void**>(&jvmti), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
  jvmtiCapabilities capabilities{};
  capabilities.can_generate_method_entry_events = 1;
  if (jvmti->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE) return JNI_ERR;
  jvmtiEventCallbacks callbacks{};
  callbacks.MethodEntry = method_entry;
  return jvmti->SetEventCallbacks(&callbacks, sizeof(callbacks)) == JVMTI_ERROR_NONE ? JNI_OK : JNI_ERR;
}

JNIEXPORT void JNICALL
Java_compiler_intrinsics_common_TestCommonIntrinsicEvents_setEnabled(JNIEnv* jni, jclass, jboolean enabled) {
  if (enabled) {
    const char* classes[] = {"java/lang/Math", "java/lang/Integer", "java/lang/Integer",
                             "java/lang/Long", "java/lang/Long", "jdk/internal/util/ArraysSupport"};
    const char* names[] = {"addExact", "numberOfLeadingZeros", "numberOfTrailingZeros",
                           "bitCount", "reverse", "vectorizedHashCode"};
    const char* signatures[] = {"(II)I", "(I)I", "(I)I", "(J)I", "(J)J", "(Ljava/lang/Object;IIII)I"};
    for (int i = 0; i < target_count; i++) {
      jclass holder = jni->FindClass(classes[i]);
      if (holder == nullptr) return;
      targets[i] = jni->GetStaticMethodID(holder, names[i], signatures[i]);
      jni->DeleteLocalRef(holder);
      if (targets[i] == nullptr) return;
    }
    std::memset(counts, 0, sizeof(counts));
  }
  jthread thread = nullptr;
  check(jni, jvmti->GetCurrentThread(&thread));
  check(jni, jvmti->SetEventNotificationMode(enabled ? JVMTI_ENABLE : JVMTI_DISABLE,
                                           JVMTI_EVENT_METHOD_ENTRY, thread));
  jni->DeleteLocalRef(thread);
}

JNIEXPORT jlongArray JNICALL
Java_compiler_intrinsics_common_TestCommonIntrinsicEvents_eventCounts(JNIEnv* jni, jclass) {
  jlongArray result = jni->NewLongArray(target_count);
  if (result != nullptr) jni->SetLongArrayRegion(result, 0, target_count, counts);
  return result;
}
} // extern "C"
