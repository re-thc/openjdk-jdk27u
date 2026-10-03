/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
#include <jni.h>
#include <jvmti.h>
#include <atomic>
#include <cstring>
#include <vector>

static jvmtiEnv* tooling = nullptr;
static std::atomic<jclass> fixture(nullptr);
static jmethodID reenter = nullptr;
static std::atomic<jmethodID> predicate(nullptr);
static std::atomic<int> counts[5]; // bridge bind, typed bind, failures, policy entry, policy exit
static std::atomic<jlong> replacement_calls(0);
static thread_local bool in_callback = false;

static void JNICALL on_bind(jvmtiEnv* jvmti, JNIEnv* env, jthread,
                            jmethodID method, void*, void**) {
    jclass target = fixture.load(std::memory_order_acquire);
    if (target == nullptr || in_callback) return;
    char* name = nullptr;
    char* descriptor = nullptr;
    if (jvmti->GetMethodName(method, &name, &descriptor, nullptr) != JVMTI_ERROR_NONE) return;
    int slot = std::strcmp(name, "registerNatives") == 0 && std::strcmp(descriptor, "()Z") == 0 ? 0 :
            std::strcmp(name, "encodeUtf16ArrayUtf80") == 0 &&
            std::strcmp(descriptor, "([CII[BII)I") == 0 ? 1 : -1;
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(name));
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(descriptor));
    if (slot < 0) return;
    jclass owner = nullptr;
    if (jvmti->GetMethodDeclaringClass(method, &owner) != JVMTI_ERROR_NONE) return;
    char* signature = nullptr;
    jvmtiError error = jvmti->GetClassSignature(owner, &signature, nullptr);
    env->DeleteLocalRef(owner);
    if (error != JVMTI_ERROR_NONE) return;
    bool match = std::strcmp(signature, "Lsun/nio/cs/UTF_8$Encoder;") == 0;
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(signature));
    if (!match) return;
    in_callback = true;
    counts[slot].fetch_add(1);
    env->CallStaticVoidMethod(target, reenter);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
        env->ExceptionClear();
        counts[2].fetch_add(1);
    }
    in_callback = false;
}

static void JNICALL on_entry(jvmtiEnv*, JNIEnv*, jthread, jmethodID method) {
    if (method == predicate.load()) counts[3].fetch_add(1);
}
static void JNICALL on_exit(jvmtiEnv*, JNIEnv*, jthread, jmethodID method, jboolean, jvalue) {
    if (method == predicate.load()) counts[4].fetch_add(1);
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char* options, void*) {
    if (vm->GetEnv(reinterpret_cast<void**>(&tooling), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
    jvmtiCapabilities caps = {};
    jvmtiEventCallbacks callbacks = {};
    if (options != nullptr && std::strcmp(options, "reentry") == 0) {
        caps.can_generate_native_method_bind_events = 1;
        callbacks.NativeMethodBind = on_bind;
    } else if (options != nullptr && std::strcmp(options, "events") == 0) {
        caps.can_generate_method_entry_events = 1;
        caps.can_generate_method_exit_events = 1;
        callbacks.MethodEntry = on_entry;
        callbacks.MethodExit = on_exit;
    }
    if (tooling->AddCapabilities(&caps) != JVMTI_ERROR_NONE ||
            tooling->SetEventCallbacks(&callbacks, sizeof(callbacks)) != JVMTI_ERROR_NONE) return JNI_ERR;
    if (caps.can_generate_native_method_bind_events &&
            tooling->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_NATIVE_METHOD_BIND, nullptr)
                    != JVMTI_ERROR_NONE) return JNI_ERR;
    return JNI_OK;
}

extern "C" JNIEXPORT void JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_arm(JNIEnv* env, jclass, jclass klass) {
    reenter = env->GetStaticMethodID(klass, "reenter", "()V");
    if (reenter != nullptr) {
        fixture.store(static_cast<jclass>(env->NewGlobalRef(klass)), std::memory_order_release);
    }
}
extern "C" JNIEXPORT jintArray JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_status(JNIEnv* env, jclass) {
    jint values[5];
    for (int i = 0; i < 5; i++) values[i] = counts[i].load();
    jintArray result = env->NewIntArray(5);
    if (result != nullptr) env->SetIntArrayRegion(result, 0, 5, values);
    return result;
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_acquire(JNIEnv*, jclass) {
    if (tooling == nullptr) return JVMTI_ERROR_INVALID_ENVIRONMENT;
    jvmtiCapabilities caps = {};
    caps.can_generate_native_method_bind_events = 1;
    return tooling->AddCapabilities(&caps);
}

static jint JNICALL replacement(JNIEnv* env, jclass, jcharArray input, jint offset, jint length,
                                jbyteArray output, jint position, jint capacity) {
    replacement_calls.fetch_add(1);
    if (input == nullptr || output == nullptr || offset < 0 || length < 0 || length > 2048 ||
            offset > env->GetArrayLength(input) - length || position < 0 || capacity < length ||
            position > env->GetArrayLength(output) - capacity) return -2;
    std::vector<jbyte> bytes(length, '#');
    env->SetByteArrayRegion(output, position, length, bytes.data());
    return (length << 13) | length;
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_rebind(JNIEnv* env, jclass, jclass holder) {
    JNINativeMethod method = {const_cast<char*>("encodeUtf16ArrayUtf80"),
            const_cast<char*>("([CII[BII)I"), reinterpret_cast<void*>(replacement)};
    return env->RegisterNatives(holder, &method, 1);
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_unregister(JNIEnv* env, jclass, jclass holder) {
    return env->UnregisterNatives(holder);
}
extern "C" JNIEXPORT jlong JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_replacementCalls(JNIEnv*, jclass) {
    return replacement_calls.load();
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestCharsetEncoderBindings_events(JNIEnv* env, jclass, jclass holder,
                                                               jboolean enable) {
    if (tooling == nullptr) return JVMTI_ERROR_INVALID_ENVIRONMENT;
    jmethodID target = env->GetStaticMethodID(holder, "useNativeEncoder", "()Z");
    if (target == nullptr) return JVMTI_ERROR_INVALID_METHODID;
    predicate.store(target);
    jvmtiEventMode mode = enable ? JVMTI_ENABLE : JVMTI_DISABLE;
    jvmtiError error = tooling->SetEventNotificationMode(mode, JVMTI_EVENT_METHOD_ENTRY, nullptr);
    if (error != JVMTI_ERROR_NONE) return error;
    return tooling->SetEventNotificationMode(mode, JVMTI_EVENT_METHOD_EXIT, nullptr);
}
