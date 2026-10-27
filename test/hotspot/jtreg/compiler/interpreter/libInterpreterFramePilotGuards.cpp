/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#include "jvmti.h"
#include <atomic>
#include <cstring>

static jvmtiEnv* jvmti = nullptr;
static jmethodID target = nullptr;
static std::atomic<int> events{0};

static void check(JNIEnv* env, jvmtiError error, const char* message) {
  if (error != JVMTI_ERROR_NONE) env->FatalError(message);
}

static void JNICALL breakpoint(jvmtiEnv*, JNIEnv* env, jthread thread,
                                jmethodID method, jlocation location) {
  if (method != target || location != 2) env->FatalError("Unexpected breakpoint method/location");
  jmethodID frame_method = nullptr;
  jlocation frame_location = -1;
  check(env, jvmti->GetFrameLocation(thread, 0, &frame_method, &frame_location), "GetFrameLocation");
  if (frame_method != target || frame_location != 2) env->FatalError("Wrong debugger frame/BCI");
  jint x = 0, y = 0;
  check(env, jvmti->GetLocalInt(thread, 0, 0, &x), "GetLocalInt x");
  check(env, jvmti->GetLocalInt(thread, 0, 1, &y), "GetLocalInt y");
  if (x != 17 || y != 20) env->FatalError("Wrong debugger locals");
  check(env, jvmti->SetLocalInt(thread, 0, 0, 100), "SetLocalInt x");
  check(env, jvmti->GetLocalInt(thread, 0, 0, &x), "GetLocalInt changed x");
  if (x != 100) env->FatalError("Debugger mutation lost");
  events.fetch_add(1);
}

JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
  if (vm->GetEnv(reinterpret_cast<void**>(&jvmti), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
  jvmtiCapabilities capabilities{};
  capabilities.can_generate_breakpoint_events = 1;
  capabilities.can_access_local_variables = 1;
  if (jvmti->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE) return JNI_ERR;
  jvmtiEventCallbacks callbacks{};
  callbacks.Breakpoint = breakpoint;
  if (jvmti->SetEventCallbacks(&callbacks, sizeof(callbacks)) != JVMTI_ERROR_NONE) return JNI_ERR;
  return JNI_OK;
}

extern "C" JNIEXPORT void JNICALL Java_InterpreterFramePilotGuardTest_installBreakpoint(JNIEnv* env, jclass klass) {
  target = env->GetStaticMethodID(klass, "lateTarget", "(II)I");
  if (target == nullptr) env->FatalError("Missing breakpoint target");
  check(env, jvmti->SetBreakpoint(target, 2), "SetBreakpoint after preparation");
  check(env, jvmti->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_BREAKPOINT, nullptr), "Enable breakpoint");
}

extern "C" JNIEXPORT void JNICALL Java_InterpreterFramePilotGuardTest_clearBreakpoint(JNIEnv* env, jclass) {
  check(env, jvmti->ClearBreakpoint(target, 2), "ClearBreakpoint");
  check(env, jvmti->SetEventNotificationMode(JVMTI_DISABLE, JVMTI_EVENT_BREAKPOINT, nullptr), "Disable breakpoint");
}

extern "C" JNIEXPORT jint JNICALL Java_InterpreterFramePilotGuardTest_breakpointEvents(JNIEnv*, jclass) {
  return events.load();
}
