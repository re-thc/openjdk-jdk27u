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

#include <jni.h>
#include <jvmti.h>
#include <atomic>
#include <cstring>

static jvmtiEnv* tooling = nullptr;
static jmethodID watched_origin = nullptr;
static jfieldID watched_field = nullptr;
static std::atomic<jlong> field_reads(0);
static std::atomic<jlong> class_events[3] = {0, 0, 0};
static std::atomic<jint> callback_error(0);
static const char* marker_name =
    "compiler/intrinsics/tmfy/TestStringCodingInterpreterAdmissionTooling$Marker";
static const char* marker_signature =
    "Lcompiler/intrinsics/tmfy/TestStringCodingInterpreterAdmissionTooling$Marker;";

static void JNICALL on_field_access(jvmtiEnv*, JNIEnv*, jthread, jmethodID method,
                                    jlocation location, jclass, jobject, jfieldID field) {
    if (method == watched_origin && field == watched_field && location == 64) {
        field_reads.fetch_add(1);
    }
}

static void JNICALL on_class_file_load(jvmtiEnv*, JNIEnv*, jclass, jobject,
                                       const char* name, jobject, jint, const unsigned char*,
                                       jint*, unsigned char**) {
    if (name != nullptr && std::strcmp(name, marker_name) == 0) class_events[0].fetch_add(1);
}

static void class_event(jvmtiEnv* env, jclass klass, int kind) {
    char* signature = nullptr;
    jvmtiError error = env->GetClassSignature(klass, &signature, nullptr);
    if (error != JVMTI_ERROR_NONE) {
        callback_error.store(error);
        return;
    }
    if (std::strcmp(signature, marker_signature) == 0) class_events[kind].fetch_add(1);
    error = env->Deallocate(reinterpret_cast<unsigned char*>(signature));
    if (error != JVMTI_ERROR_NONE) callback_error.store(error);
}

static void JNICALL on_class_load(jvmtiEnv* env, JNIEnv*, jthread, jclass klass) {
    class_event(env, klass, 1);
}

static void JNICALL on_class_prepare(jvmtiEnv* env, JNIEnv*, jthread, jclass klass) {
    class_event(env, klass, 2);
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char* options, void*) {
    if (options == nullptr || vm->GetEnv(reinterpret_cast<void**>(&tooling), JVMTI_VERSION_1_2) != JNI_OK) {
        return JNI_ERR;
    }
    if (std::strcmp(options, "watch") == 0) {
        // Field-access capability is acquired during OnLoad. The late event
        // modes must not acquire even an empty capability set before first use.
        jvmtiCapabilities capabilities = {};
        capabilities.can_generate_field_access_events = 1;
        if (tooling->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE) return JNI_ERR;
    } else if (std::strcmp(options, "late") != 0) {
        return JNI_ERR;
    }
    jvmtiEventCallbacks callbacks = {};
    callbacks.FieldAccess = on_field_access;
    callbacks.ClassFileLoadHook = on_class_file_load;
    callbacks.ClassLoad = on_class_load;
    callbacks.ClassPrepare = on_class_prepare;
    return tooling->SetEventCallbacks(&callbacks, sizeof(callbacks)) == JVMTI_ERROR_NONE ? JNI_OK : JNI_ERR;
}

extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingInterpreterAdmissionTooling_watch(
        JNIEnv* env, jclass, jclass holder, jobject origin) {
    watched_origin = env->FromReflectedMethod(origin);
    watched_field = env->GetStaticFieldID(holder, "utf8Ready", "Z");
    if (env->ExceptionCheck() || watched_origin == nullptr || watched_field == nullptr) return JNI_ERR;
    jvmtiError error = tooling->SetFieldAccessWatch(holder, watched_field);
    if (error != JVMTI_ERROR_NONE) return error;
    return tooling->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_FIELD_ACCESS, nullptr);
}

extern "C" JNIEXPORT jlong JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingInterpreterAdmissionTooling_reads(JNIEnv*, jclass) {
    return field_reads.load();
}

extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingInterpreterAdmissionTooling_events(
        JNIEnv*, jclass, jint kind, jboolean enabled) {
    const jvmtiEvent events[] = {JVMTI_EVENT_CLASS_FILE_LOAD_HOOK, JVMTI_EVENT_CLASS_LOAD, JVMTI_EVENT_CLASS_PREPARE};
    if (kind < 0 || kind >= 3) return JVMTI_ERROR_ILLEGAL_ARGUMENT;
    return tooling->SetEventNotificationMode(enabled ? JVMTI_ENABLE : JVMTI_DISABLE, events[kind], nullptr);
}

extern "C" JNIEXPORT jlong JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingInterpreterAdmissionTooling_deliveries(JNIEnv*, jclass, jint kind) {
    return kind < 0 || kind >= 3 ? -1 : class_events[kind].load();
}

extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingInterpreterAdmissionTooling_callbackError(JNIEnv*, jclass) {
    return callback_error.load();
}
