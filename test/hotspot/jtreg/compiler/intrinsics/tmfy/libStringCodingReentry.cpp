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

static std::atomic<jclass> fixture(nullptr);
static jmethodID reenter = nullptr;
static std::atomic<int> counts[5]; // registration bridge, three converters, failures
static thread_local bool inside_callback = false;

static void JNICALL on_bind(jvmtiEnv* jvmti, JNIEnv* env, jthread,
                            jmethodID method, void*, void**) {
    jclass target_fixture = fixture.load(std::memory_order_acquire);
    if (target_fixture == nullptr || inside_callback) return;
    char* name = nullptr;
    char* signature = nullptr;
    jclass owner = nullptr;
    if (jvmti->GetMethodName(method, &name, nullptr, nullptr) != JVMTI_ERROR_NONE) return;
    int slot = std::strcmp(name, "registerNatives") == 0 ? 0
             : std::strcmp(name, "encodeLatin1Utf80") == 0 ? 1
             : std::strcmp(name, "encodeUtf16Utf80") == 0 ? 2
             : std::strcmp(name, "decodeUtf8Utf160") == 0 ? 3 : -1;
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(name));
    if (slot < 0 || jvmti->GetMethodDeclaringClass(method, &owner) != JVMTI_ERROR_NONE) return;
    if (jvmti->GetClassSignature(owner, &signature, nullptr) != JVMTI_ERROR_NONE) {
        env->DeleteLocalRef(owner);
        return;
    }
    bool target = std::strcmp(signature, "Ljava/lang/StringCoding;") == 0;
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(signature));
    env->DeleteLocalRef(owner);
    if (!target) return;

    inside_callback = true;
    counts[slot].fetch_add(1);
    jbyteArray encoded = static_cast<jbyteArray>(env->CallStaticObjectMethod(target_fixture, reenter));
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
        env->ExceptionClear();
        counts[4].fetch_add(1);
    } else {
        const unsigned char unit[] = {0xc3, 0xa9, 0x41, 0xc3, 0xbf, 0};
        jbyte actual[sizeof(unit) * 8] = {};
        if (encoded == nullptr || env->GetArrayLength(encoded) != static_cast<jsize>(sizeof(actual))) {
            counts[4].fetch_add(1);
        } else {
            env->GetByteArrayRegion(encoded, 0, sizeof(actual), actual);
            if (env->ExceptionCheck()) {
                env->ExceptionDescribe();
                env->ExceptionClear();
                counts[4].fetch_add(1);
            } else {
                for (unsigned int i = 0; i < 8; i++) {
                    if (std::memcmp(actual + i * sizeof(unit), unit, sizeof(unit)) != 0) {
                        counts[4].fetch_add(1);
                        break;
                    }
                }
            }
        }
    }
    if (encoded != nullptr) env->DeleteLocalRef(encoded);
    inside_callback = false;
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
    jvmtiEnv* jvmti = nullptr;
    if (vm->GetEnv(reinterpret_cast<void**>(&jvmti), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
    jvmtiCapabilities capabilities = {};
    capabilities.can_generate_native_method_bind_events = 1;
    jvmtiEventCallbacks callbacks = {};
    callbacks.NativeMethodBind = on_bind;
    if (jvmti->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE ||
        jvmti->SetEventCallbacks(&callbacks, sizeof(callbacks)) != JVMTI_ERROR_NONE ||
        jvmti->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_NATIVE_METHOD_BIND, nullptr) != JVMTI_ERROR_NONE) return JNI_ERR;
    return JNI_OK;
}

extern "C" JNIEXPORT void JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingReentry_arm(JNIEnv* env, jclass, jclass clazz) {
    reenter = env->GetStaticMethodID(clazz, "reenter", "()[B");
    if (reenter == nullptr) return;
    fixture.store(static_cast<jclass>(env->NewGlobalRef(clazz)), std::memory_order_release);
}

extern "C" JNIEXPORT jintArray JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingReentry_result(JNIEnv* env, jclass) {
    jint values[] = {counts[0].load(), counts[1].load(), counts[2].load(), counts[3].load(), counts[4].load()};
    jintArray result = env->NewIntArray(5);
    if (result != nullptr) env->SetIntArrayRegion(result, 0, 5, values);
    return result;
}
