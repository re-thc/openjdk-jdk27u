/*
 * Copyright (c) 2026, Harry Chan <38070640+re-thc@users.noreply.github.com>
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

#include "jni.h"
#include "jvmti.h"

static jvmtiEnv* jvmti;
static jclass target_class;
static jbyteArray reconstituted;

static void fail(JNIEnv* env, const char* message) {
  env->ThrowNew(env->FindClass("java/lang/AssertionError"), message);
}

static void JNICALL class_file_hook(jvmtiEnv*, JNIEnv* env, jclass klass,
                                   jobject, const char*, jobject, jint size,
                                   const unsigned char* bytes, jint*, unsigned char**) {
  if (target_class != nullptr && env->IsSameObject(klass, target_class)) {
    jbyteArray result = env->NewByteArray(size);
    if (result != nullptr) {
      env->SetByteArrayRegion(result, 0, size, (const jbyte*)bytes);
      reconstituted = (jbyteArray)env->NewGlobalRef(result);
    }
  }
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
  if (vm->GetEnv((void**)&jvmti, JVMTI_VERSION_1_2) != JNI_OK) {
    return JNI_ERR;
  }
  jvmtiCapabilities capabilities = {};
  capabilities.can_get_constant_pool = 1;
  capabilities.can_retransform_classes = 1;
  if (jvmti->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE) {
    return JNI_ERR;
  }
  jvmtiEventCallbacks callbacks = {};
  callbacks.ClassFileLoadHook = class_file_hook;
  if (jvmti->SetEventCallbacks(&callbacks, sizeof(callbacks)) != JVMTI_ERROR_NONE ||
      jvmti->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_CLASS_FILE_LOAD_HOOK, nullptr) != JVMTI_ERROR_NONE) {
    return JNI_ERR;
  }
  return JNI_OK;
}

extern "C" JNIEXPORT jbyteArray JNICALL
Java_ConstantPoolIndexes_constantPool(JNIEnv* env, jclass, jclass target, jint expected_count) {
  jint count, size;
  unsigned char* bytes;
  if (jvmti->GetConstantPool(target, &count, &size, &bytes) != JVMTI_ERROR_NONE) {
    fail(env, "GetConstantPool failed");
    return nullptr;
  }
  if (count != expected_count) {
    jvmti->Deallocate(bytes);
    fail(env, "Constant-pool count changed");
    return nullptr;
  }
  jbyteArray result = env->NewByteArray(size);
  if (result != nullptr) {
    env->SetByteArrayRegion(result, 0, size, (const jbyte*)bytes);
  }
  jvmti->Deallocate(bytes);
  return result;
}

extern "C" JNIEXPORT jbyteArray JNICALL
Java_ConstantPoolIndexes_retransform(JNIEnv* env, jclass, jclass target) {
  target_class = (jclass)env->NewGlobalRef(target);
  if (target_class == nullptr) {
    return nullptr;
  }
  jvmtiError error = jvmti->RetransformClasses(1, &target);
  env->DeleteGlobalRef(target_class);
  target_class = nullptr;
  if (error != JVMTI_ERROR_NONE || reconstituted == nullptr) {
    fail(env, "RetransformClasses failed or did not call the hook");
    return nullptr;
  }
  jbyteArray result = (jbyteArray)env->NewLocalRef(reconstituted);
  env->DeleteGlobalRef(reconstituted);
  reconstituted = nullptr;
  return result;
}
