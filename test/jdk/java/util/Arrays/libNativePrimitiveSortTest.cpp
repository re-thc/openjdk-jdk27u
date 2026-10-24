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

// Test-only JVMTI/JNI and allocator interception. Nothing is linked into the JDK.
#include <jni.h>
#include <jvmti.h>
#if defined(__linux__) && defined(__x86_64__)
#include <features.h>
#endif
#if defined(__linux__) && defined(__x86_64__) && defined(__GLIBC__)
#include <atomic>
#include <cstdint>
#include <cstring>
#include <dlfcn.h>
#include <sched.h>

extern "C" void* __libc_malloc(size_t);
extern "C" void __libc_free(void*);
static std::atomic_flag allocation_lock = ATOMIC_FLAG_INIT;
static void* pointers[256];
static size_t sizes[256];
static size_t live_bytes, peak_bytes;
static std::atomic<int> fail_malloc{0};
static std::atomic<long> calls{0}, active{0}, peak_active{0}, failures{0}, copy_declines{0}, holding{0};
static std::atomic<bool> hold{false}, decline_copy{false};
static thread_local bool in_sort, first_region, fail_copy;
static const jniNativeInterface* original_jni;
using Sort = jboolean (JNICALL *)(JNIEnv*, jclass, jlongArray, jint, jint);
static std::atomic<Sort> original_sort{nullptr};

static void lock_allocations() { while (allocation_lock.test_and_set(std::memory_order_acquire)) sched_yield(); }
static void unlock_allocations() { allocation_lock.clear(std::memory_order_release); }
[[noreturn]] static void fail(JNIEnv* env, const char* message) {
    env->FatalError(message);
    __builtin_unreachable();
}

extern "C" JNIEXPORT void* malloc(size_t size) noexcept {
    Dl_info info;
    bool product = dladdr(__builtin_return_address(0), &info) && info.dli_fname
            && std::strstr(info.dli_fname, "libprimitivesort.so");
    if (product) {
        int remaining = fail_malloc.load();
        while (remaining > 0) {
            if (fail_malloc.compare_exchange_weak(remaining, remaining - 1)) {
                failures.fetch_add(1); return nullptr;
            }
        }
    }
    void* result = __libc_malloc(size);
    if (result != nullptr && product) {
        lock_allocations();
        bool recorded = false;
        for (int i = 0; i < 256; i++) if (pointers[i] == nullptr) {
            pointers[i] = result; sizes[i] = size; recorded = true; break;
        }
        if (!recorded) __builtin_trap();
        live_bytes += size;
        if (live_bytes > peak_bytes) peak_bytes = live_bytes;
        unlock_allocations();
    }
    return result;
}
extern "C" JNIEXPORT void free(void* pointer) noexcept {
    lock_allocations();
    for (int i = 0; i < 256; i++) if (pointer != nullptr && pointers[i] == pointer) {
        live_bytes -= sizes[i]; pointers[i] = nullptr; break;
    }
    unlock_allocations();
    __libc_free(pointer);
}

static void JNICALL get_longs(JNIEnv* env, jlongArray array, jsize low, jsize count, jlong* buffer) {
    original_jni->GetLongArrayRegion(env, array, low, count, buffer);
    if (in_sort && !first_region) {
        first_region = true;
        // Both original C++ calls own their real buffers here. They stay in
        // native thread state while the Java controller requests GC/deopt.
        if (hold.load()) {
            holding.fetch_add(1);
            while (hold.load(std::memory_order_acquire)) sched_yield();
            holding.fetch_sub(1);
        }
    }
}
static jboolean JNICALL exception_check(JNIEnv* env) {
    jboolean pending = original_jni->ExceptionCheck(env);
    if (!pending && in_sort && first_region && fail_copy) {
        // Fail the product's checked-copy path after malloc, without leaving
        // a Java exception pending. Its real RAII cleanup must run before
        // Java enters the original sorter with unchanged input and depth.
        fail_copy = false; copy_declines.fetch_add(1); return JNI_TRUE;
    }
    return pending;
}
static jboolean JNICALL sort_longs(JNIEnv* env, jclass type, jlongArray array, jint low, jint size) {
    calls.fetch_add(1);
    long now = active.fetch_add(1) + 1, peak = peak_active.load();
    while (now > peak && !peak_active.compare_exchange_weak(peak, now)) {}
    in_sort = true; first_region = false; fail_copy = decline_copy.load();
    jboolean result = original_sort.load(std::memory_order_acquire)(env, type, array, low, size);
    in_sort = false; active.fetch_sub(1);
    return result;
}
static void JNICALL bind(jvmtiEnv* jvmti, JNIEnv* env, jthread, jmethodID method, void* address, void** replacement) {
    char* name = nullptr;
    if (jvmti->GetMethodName(method, &name, nullptr, nullptr) != JVMTI_ERROR_NONE) return;
    bool match = std::strcmp(name, "sortLongs") == 0;
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(name));
    if (!match) return;
    jclass type; char* signature = nullptr;
    if (jvmti->GetMethodDeclaringClass(method, &type) != JVMTI_ERROR_NONE
            || jvmti->GetClassSignature(type, &signature, nullptr) != JVMTI_ERROR_NONE) fail(env, "Get declaring native sort class");
    match = std::strcmp(signature, "Ljava/util/PrimitiveSort;") == 0;
    jvmti->Deallocate(reinterpret_cast<unsigned char*>(signature));
    if (match) { original_sort.store(reinterpret_cast<Sort>(address), std::memory_order_release); *replacement = reinterpret_cast<void*>(&sort_longs); }
}
static void JNICALL vm_init(jvmtiEnv* jvmti, JNIEnv* env, jthread) {
    jniNativeInterface* table;
    if (jvmti->GetJNIFunctionTable(&table) != JVMTI_ERROR_NONE) fail(env, "Get JNI table");
    original_jni = table;
    jniNativeInterface copy = *table;
    copy.GetLongArrayRegion = &get_longs;
    copy.ExceptionCheck = &exception_check;
    if (jvmti->SetJNIFunctionTable(&copy) != JVMTI_ERROR_NONE) fail(env, "Set JNI table");
}
extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
    jvmtiEnv* jvmti;
    if (vm->GetEnv(reinterpret_cast<void**>(&jvmti), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
    jvmtiCapabilities caps{}; caps.can_generate_native_method_bind_events = 1;
    if (jvmti->AddCapabilities(&caps) != JVMTI_ERROR_NONE) return JNI_ERR;
    jvmtiEventCallbacks callbacks{}; callbacks.NativeMethodBind = &bind; callbacks.VMInit = &vm_init;
    if (jvmti->SetEventCallbacks(&callbacks, sizeof(callbacks)) != JVMTI_ERROR_NONE
            || jvmti->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_NATIVE_METHOD_BIND, nullptr) != JVMTI_ERROR_NONE
            || jvmti->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_VM_INIT, nullptr) != JVMTI_ERROR_NONE) return JNI_ERR;
    return JNI_OK;
}
extern "C" JNIEXPORT jboolean JNICALL Java_NativePrimitiveSortSupport_hasInstrumentation(
        JNIEnv* env, jclass, jstring library) {
    const char* path = env->GetStringUTFChars(library, nullptr);
    if (path == nullptr) return JNI_FALSE;
    void* handle = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    env->ReleaseStringUTFChars(library, path);
    void* symbol = handle == nullptr ? nullptr
            : dlsym(handle, "Java_java_util_PrimitiveSort_supported");
    if (symbol == nullptr) {
        const char* message = handle == nullptr ? "Cannot load supported-build native sort component"
                : "Missing native sort availability hook";
        if (handle != nullptr) dlclose(handle);
        jclass error = env->FindClass("java/lang/AssertionError");
        if (error != nullptr) env->ThrowNew(error, message);
        return JNI_FALSE;
    }
    // Reuse the production decision, including Highway's entire AVX2 feature
    // group and OS state requirements. Missing libraries/exports fail above;
    // missing public activation still fails the separate native-call witness.
    using Supported = jboolean (JNICALL *)(JNIEnv*, jclass);
    jboolean supported = reinterpret_cast<Supported>(symbol)(env, nullptr);
    dlclose(handle);
    return supported;
}
extern "C" JNIEXPORT void JNICALL Java_NativePrimitiveSortSupport_arm(JNIEnv* env, jclass, jint mode) {
    if (active.load() != 0) fail(env, "Arming while a sort is active");
    calls = 0; peak_active = 0; failures = 0; copy_declines = 0; holding = 0;
    lock_allocations(); peak_bytes = live_bytes; unlock_allocations();
    fail_malloc = mode == 1 ? 2 : 0;
    decline_copy = mode == 2;
    hold = mode != 1;
}
extern "C" JNIEXPORT void JNICALL Java_NativePrimitiveSortSupport_release(JNIEnv*, jclass) { hold.store(false, std::memory_order_release); }
extern "C" JNIEXPORT jlongArray JNICALL Java_NativePrimitiveSortSupport_stats(JNIEnv* env, jclass) {
    lock_allocations(); jlong live = live_bytes, peak = peak_bytes; unlock_allocations();
    jlong values[] = {calls.load(), active.load(), peak_active.load(), live, peak, failures.load(), copy_declines.load(), holding.load()};
    jlongArray result = env->NewLongArray(8);
    env->SetLongArrayRegion(result, 0, 8, values); return result;
}
#else
extern "C" JNIEXPORT jboolean JNICALL Java_NativePrimitiveSortSupport_hasInstrumentation(JNIEnv*, jclass, jstring) { return JNI_FALSE; }
#endif
