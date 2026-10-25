// Test-only direct entry to the production qsort progress fallback.
// Compile twice with one of RANGE_SORT_FALLBACK_E or _U; never linked into JDK DSOs.
#include <cstdint>

#if !defined(__x86_64__) || !defined(__GNUC__)
#error "AVX-512 fallback test is Linux x86_64 GCC only"
#endif

#pragma GCC push_options
#pragma GCC target("avx512f,avx512dq,avx512vl,avx2,popcnt")

#if defined(RANGE_SORT_FALLBACK_E) && !defined(RANGE_SORT_FALLBACK_U)
#include "embedded/avx512-64bit-qsort.hpp"
#define FALLBACK_SYMBOL bounded_long_heap_fallback_E
#elif defined(RANGE_SORT_FALLBACK_U) && !defined(RANGE_SORT_FALLBACK_E)
#undef XSS_USE_OPENMP
#include "upstream/avx512-64bit-common.h"
#define FALLBACK_SYMBOL bounded_long_heap_fallback_U
#else
#error "Define exactly one fallback test variant"
#endif

extern "C" __attribute__((visibility("default"), noinline, noclone))
int FALLBACK_SYMBOL(int64_t* array, int32_t low, int32_t high) noexcept {
    if (array == nullptr || low < 0 || high < low || high - low < 2) return 0;
#if defined(RANGE_SORT_FALLBACK_E)
    qsort_<zmm_vector<int64_t>, int64_t>(array, static_cast<arrsize_t>(low),
                                         static_cast<arrsize_t>(high - 1), 0);
#else
    using V = zmm_vector<int64_t>;
    using C = Comparator<V, false>;
    qsort_<V, C, int64_t>(array, static_cast<arrsize_t>(low),
                          static_cast<arrsize_t>(high - 1), 0, 0);
#endif
    return 1;
}

#pragma GCC pop_options
