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
constexpr int target_count = 5;
jmethodID targets[target_count];
const jlocation locations[target_count] = {0, 0, 1, 0, 0};
bool installed[target_count];
jlong hit_counts[target_count];

void check(JNIEnv* jni, jvmtiError error) {
  if (error != JVMTI_ERROR_NONE) {
    jni->FatalError("JVMTI breakpoint operation failed");
  }
}

void JNICALL breakpoint(jvmtiEnv*, JNIEnv*, jthread, jmethodID method, jlocation location) {
  for (int i = 0; i < target_count; i++) {
    if (method == targets[i] && location == locations[i]) {
      hit_counts[i]++;
    }
  }
}

void set_notification(JNIEnv* jni, jvmtiEventMode mode) {
  jthread thread = nullptr;
  check(jni, jvmti->GetCurrentThread(&thread));
  check(jni, jvmti->SetEventNotificationMode(mode, JVMTI_EVENT_BREAKPOINT, thread));
  jni->DeleteLocalRef(thread);
}
} // namespace

extern "C" {
JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
  if (vm->GetEnv(reinterpret_cast<void**>(&jvmti), JVMTI_VERSION_1_2) != JNI_OK) {
    return JNI_ERR;
  }
  // Do not request or enable MethodEntry: it would mask the fast-entry bug.
  jvmtiCapabilities capabilities{};
  capabilities.can_generate_breakpoint_events = 1;
  if (jvmti->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE) {
    return JNI_ERR;
  }
  jvmtiEventCallbacks callbacks{};
  callbacks.Breakpoint = breakpoint;
  return jvmti->SetEventCallbacks(&callbacks, sizeof(callbacks)) == JVMTI_ERROR_NONE ? JNI_OK : JNI_ERR;
}

JNIEXPORT void JNICALL
Java_compiler_intrinsics_common_TestCommonIntrinsicBreakpoints_install(JNIEnv* jni, jclass) {
  const char* classes[] = {"java/lang/Integer", "java/lang/Math", "java/lang/Math",
                          "java/lang/Long", "jdk/internal/util/ArraysSupport"};
  const char* names[] = {"reverse", "addExact", "addExact", "reverse", "vectorizedHashCode"};
  const char* signatures[] = {"(I)I", "(II)I", "(II)I", "(J)J", "(Ljava/lang/Object;IIII)I"};
  for (int i = 0; i < target_count; i++) {
    jclass holder = jni->FindClass(classes[i]);
    if (holder == nullptr) {
      return;
    }
    targets[i] = jni->GetStaticMethodID(holder, names[i], signatures[i]);
    jni->DeleteLocalRef(holder);
    if (targets[i] == nullptr) {
      return;
    }
    check(jni, jvmti->SetBreakpoint(targets[i], locations[i]));
    installed[i] = true;
  }
  std::memset(hit_counts, 0, sizeof(hit_counts));
  set_notification(jni, JVMTI_ENABLE);
}

JNIEXPORT void JNICALL
Java_compiler_intrinsics_common_TestCommonIntrinsicBreakpoints_clearFirstAddBreakpoint(JNIEnv* jni, jclass) {
  check(jni, jvmti->ClearBreakpoint(targets[1], locations[1]));
  installed[1] = false;
  std::memset(hit_counts, 0, sizeof(hit_counts));
}

JNIEXPORT void JNICALL
Java_compiler_intrinsics_common_TestCommonIntrinsicBreakpoints_remove(JNIEnv* jni, jclass) {
  set_notification(jni, JVMTI_DISABLE);
  for (int i = 0; i < target_count; i++) {
    if (installed[i]) {
      check(jni, jvmti->ClearBreakpoint(targets[i], locations[i]));
      installed[i] = false;
    }
  }
}

JNIEXPORT jlongArray JNICALL
Java_compiler_intrinsics_common_TestCommonIntrinsicBreakpoints_counts(JNIEnv* jni, jclass) {
  jlongArray result = jni->NewLongArray(target_count);
  if (result != nullptr) {
    jni->SetLongArrayRegion(result, 0, target_count, hit_counts);
  }
  return result;
}
} // extern "C"
