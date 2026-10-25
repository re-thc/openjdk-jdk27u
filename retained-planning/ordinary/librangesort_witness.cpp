/* Task-local dispatch witness only; do not use in timing images. */
#include <jni.h>
#include <atomic>
#include <cstdint>
#include <cstdlib>
#include <cstdio>
#include <dlfcn.h>

#ifndef RANGE_SORT_REAL_PATH
#error "Define RANGE_SORT_REAL_PATH to the immutable real rangesort DSO path"
#endif

using SortFn = int (*)(int64_t*, int32_t, int32_t, const void*);

namespace {
std::atomic<uint64_t> g_entries{0};
std::atomic<uint64_t> g_successes{0};
std::atomic<uint64_t> g_declines{0};
static_assert(std::atomic<uint64_t>::is_always_lock_free,
              "witness counters must not call an out-of-line lock helper");
void* g_real_handle = nullptr;
SortFn g_real_sort = nullptr;

[[noreturn]] void resolver_failure(const char* what) {
    std::fprintf(stderr, "rangesort witness initialization failed: %s\n", what);
    std::abort();
}

__attribute__((constructor)) void resolve_real_rangesort() {
    g_real_handle = dlopen(RANGE_SORT_REAL_PATH, RTLD_NOW | RTLD_LOCAL);
    if (g_real_handle == nullptr) {
        const char* error = dlerror();
        resolver_failure(error != nullptr ? error : "dlopen returned null");
    }
    dlerror();
    g_real_sort = reinterpret_cast<SortFn>(dlsym(g_real_handle, "bounded_long_xss_sort"));
    const char* error = dlerror();
    if (error != nullptr || g_real_sort == nullptr) {
        resolver_failure(error != nullptr ? error : "real entry symbol missing");
    }
}
} // namespace

extern "C" __attribute__((visibility("default"), noinline, noclone))
int bounded_long_xss_sort(int64_t* array, int32_t low, int32_t high,
                          const void* carrier_stack_limit) noexcept {
    // Resolution is constructor-only; this entry performs no loader work.
    g_entries.fetch_add(1, std::memory_order_relaxed);
    const int result = g_real_sort(array, low, high, carrier_stack_limit);
    if (result == 1) g_successes.fetch_add(1, std::memory_order_relaxed);
    else g_declines.fetch_add(1, std::memory_order_relaxed);
    return result;
}

// Java declarations expected in default-package XssActivation:
//   private static native long[] nativeSortCounters();
//   private static native void resetNativeSortCounters();
extern "C" JNIEXPORT jlongArray JNICALL
Java_XssActivation_nativeSortCounters(JNIEnv* env, jclass) {
    const jlong values[3] = {
        static_cast<jlong>(g_entries.load(std::memory_order_relaxed)),
        static_cast<jlong>(g_successes.load(std::memory_order_relaxed)),
        static_cast<jlong>(g_declines.load(std::memory_order_relaxed))
    };
    jlongArray result = env->NewLongArray(3);
    if (result == nullptr) return nullptr;
    env->SetLongArrayRegion(result, 0, 3, values);
    return result;
}

extern "C" JNIEXPORT void JNICALL
Java_XssActivation_resetNativeSortCounters(JNIEnv*, jclass) {
    g_entries.store(0, std::memory_order_relaxed);
    g_successes.store(0, std::memory_order_relaxed);
    g_declines.store(0, std::memory_order_relaxed);
}
