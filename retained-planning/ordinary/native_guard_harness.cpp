// Future source-only guard-page harness for E/U range-sort DSOs.
// Intended for one bounded ordinary process; this file was not compiled/run.
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include <limits>
#include <sys/mman.h>
#include <unistd.h>
#include <vector>

using SortFn = int (*)(int64_t*, int32_t, int32_t, const void*);
using HeapFallbackFn = int (*)(int64_t*, int32_t, int32_t);
extern "C" int bounded_long_heap_fallback_E(int64_t*, int32_t, int32_t);
extern "C" int bounded_long_heap_fallback_U(int64_t*, int32_t, int32_t);

static uintptr_t read_sp() {
    uintptr_t result;
    __asm__ volatile("mov %%rsp, %0" : "=r"(result));
    return result;
}

[[noreturn]] static void fail(const char* what) {
    std::fprintf(stderr, "native guard harness: %s\n", what);
    std::exit(1);
}

static void require(bool ok, const char* what) {
    if (!ok) fail(what);
}

static void fill_pattern(int64_t* data, size_t count, unsigned pattern) {
    for (size_t i = 0; i < count; ++i) {
        switch (pattern) {
            case 0: data[i] = 19; break; // equal
            case 1: data[i] = (i & 1) ? 1 : 0; break; // two values
            case 2:
                data[i] = static_cast<int64_t>((i * 7919u + count * 17u) % 104729u) - 52364;
                if (i == 0) data[i] = INT64_MIN;
                if (i + 1 == count) data[i] = INT64_MAX;
                break;
            case 3: data[i] = static_cast<int64_t>(count - i); break; // reverse
            case 4: data[i] = static_cast<int64_t>(std::min(i, count - i - 1)); break;
            default:
                data[i] = static_cast<int64_t>((i * 7919u + count * 17u) % 104729u) - 52364;
                break;
        }
    }
}

static void test_declines(SortFn sort, const char* variant) {
    alignas(64) int64_t values[520];
    for (int i = 0; i < 520; ++i) values[i] = 519 - i;
    int64_t before[520];
    std::memcpy(before, values, sizeof(values));
    const void* ample = reinterpret_cast<void*>(read_sp() - 65536);
    auto check_valid_ints = [&](int32_t low, int32_t high, const void* limit,
                                const char* label) {
        if (sort(values, low, high, limit) != 0) fail(label);
        if (std::memcmp(values, before, sizeof(values)) != 0)
            fail("invalid-bound decline mutated array");
    };
    check_valid_ints(0, 511, ample, "511-element call must decline");
    check_valid_ints(1, 1, ample, "empty call must decline");
    check_valid_ints(-1, 511, ample, "negative low must decline");
    check_valid_ints(7, 6, ample, "reversed range must decline");
    check_valid_ints(0, 8193, ample, "oversize call must decline");
    check_valid_ints(INT32_MIN, 0, ample, "INT32_MIN low must decline");
    check_valid_ints(0, INT32_MAX, ample, "INT32_MAX high must decline");
    check_valid_ints(INT32_MAX, INT32_MAX, ample, "INT32_MAX empty bounds must decline");
    check_valid_ints(0, 512, nullptr, "null stack limit must decline");
    require(sort(nullptr, 0, 512, ample) == 0, "null array must decline");
    check_valid_ints(0, 512, reinterpret_cast<void*>(read_sp() - 1024),
                     "low-stack call must decline");
    (void)variant;
}

static void test_guarded_case(SortFn sort, size_t count, unsigned pattern,
                              bool abut_lower_guard, const char* variant) {
    const size_t page = static_cast<size_t>(sysconf(_SC_PAGESIZE));
    const size_t bytes = count * sizeof(int64_t);
    const size_t writable = ((bytes + page - 1) / page) * page;
    const size_t total = writable + 2 * page;
    auto* mapping = static_cast<unsigned char*>(mmap(nullptr, total, PROT_READ | PROT_WRITE,
                                                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0));
    require(mapping != MAP_FAILED, "mmap failed");
    require(mprotect(mapping, page, PROT_NONE) == 0, "lower guard mprotect failed");
    require(mprotect(mapping + page + writable, page, PROT_NONE) == 0,
            "upper guard mprotect failed");

    constexpr int64_t prefix_sentinel = INT64_C(0x123456789ABCDEF);
    constexpr int64_t suffix_sentinel = -INT64_C(0x123456789ABCDE);
    const size_t offset = abut_lower_guard ? 0 : writable - bytes;
    auto* values = reinterpret_cast<int64_t*>(mapping + page + offset);
    const size_t prefix_count = offset / sizeof(int64_t);
    const size_t suffix_count = (writable - offset - bytes) / sizeof(int64_t);
    for (size_t i = 0; i < prefix_count; ++i) {
        reinterpret_cast<int64_t*>(mapping + page)[i] = prefix_sentinel;
    }
    fill_pattern(values, count, pattern);
    auto* suffix = values + count;
    for (size_t i = 0; i < suffix_count; ++i) suffix[i] = suffix_sentinel;

    std::vector<int64_t> expected(values, values + count);
    std::sort(expected.begin(), expected.end());
    void* ample = reinterpret_cast<void*>(read_sp() - 65536);
    if (sort(values, 0, static_cast<int32_t>(count), ample) != 1) {
        fail("eligible guarded range declined");
    }
    if (!std::equal(expected.begin(), expected.end(), values)) fail("oracle mismatch");
    for (size_t i = 0; i < prefix_count; ++i) {
        if (reinterpret_cast<int64_t*>(mapping + page)[i] != prefix_sentinel)
            fail("prefix padding overwritten");
    }
    for (size_t i = 0; i < suffix_count; ++i) {
        if (suffix[i] != suffix_sentinel) fail("suffix padding overwritten");
    }
    if (munmap(mapping, total) != 0) fail("munmap failed");
    (void)variant;
}

static void test_nonzero_low_guard(SortFn sort, size_t count, unsigned pattern,
                                  bool abut_upper_guard, const char* variant) {
    const size_t page = static_cast<size_t>(sysconf(_SC_PAGESIZE));
    constexpr int32_t low = 7;
    const size_t total_words = static_cast<size_t>(low) + count;
    const size_t bytes = total_words * sizeof(int64_t);
    const size_t writable = ((bytes + page - 1) / page) * page;
    const size_t total = writable + 2 * page;
    auto* mapping = static_cast<unsigned char*>(mmap(nullptr, total, PROT_READ | PROT_WRITE,
                                                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0));
    require(mapping != MAP_FAILED, "mmap failed");
    require(mprotect(mapping, page, PROT_NONE) == 0, "lower guard mprotect failed");
    require(mprotect(mapping + page + writable, page, PROT_NONE) == 0,
            "upper guard mprotect failed");
    constexpr int64_t sentinel = INT64_C(0x13579BDF2468ACE);
    auto* base = reinterpret_cast<int64_t*>(mapping + page);
    const size_t offset_words = abut_upper_guard ? writable / sizeof(int64_t) - total_words : 0;
    auto* array = base + offset_words;
    for (int32_t i = 0; i < low; ++i) array[i] = sentinel;
    auto* range = array + low;
    fill_pattern(range, count, pattern);
    const size_t suffix_words = (writable / sizeof(int64_t)) - offset_words - total_words;
    for (size_t i = 0; i < suffix_words; ++i) array[total_words + i] = sentinel;
    std::vector<int64_t> expected(range, range + count);
    std::sort(expected.begin(), expected.end());
    const void* ample = reinterpret_cast<void*>(read_sp() - 65536);
    if (sort(array, low, low + static_cast<int32_t>(count), ample) != 1)
        fail("eligible nonzero-low guarded range declined");
    if (!std::equal(expected.begin(), expected.end(), range)) fail("nonzero-low oracle mismatch");
    for (int32_t i = 0; i < low; ++i) {
        if (array[i] != sentinel) fail("nonzero-low prefix overwritten");
    }
    for (size_t i = 0; i < suffix_words; ++i) {
        if (array[total_words + i] != sentinel) fail("nonzero-low suffix overwritten");
    }
    require(munmap(mapping, total) == 0, "munmap failed");
    (void)variant;
}

static void test_heap_fallback(HeapFallbackFn fallback, const char* variant) {
    constexpr int32_t low = 9;
    constexpr int32_t count = 73;
    int64_t values[low + count + 11];
    for (size_t i = 0; i < sizeof(values) / sizeof(values[0]); ++i)
        values[i] = INT64_C(0x11223344556677) + static_cast<int64_t>(i);
    fill_pattern(values + low, count, 5);
    const int64_t prefix[low] = {0,1,2,3,4,5,6,7,8};
    std::copy(prefix, prefix + low, values);
    int64_t* suffix = values + low + count;
    for (int i = 0; i < 11; ++i) suffix[i] = -INT64_C(0x11223344556677) - i;
    std::vector<int64_t> expected(values + low, values + low + count);
    std::sort(expected.begin(), expected.end());
    require(fallback(values, low, low + count) == 1, "direct heapsort fallback did not run");
    if (!std::equal(expected.begin(), expected.end(), values + low))
        fail("direct heapsort fallback oracle mismatch");
    if (!std::equal(prefix, prefix + low, values)) fail("heap fallback changed prefix");
    for (int i = 0; i < 11; ++i) {
        if (suffix[i] != -INT64_C(0x11223344556677) - i)
            fail("heap fallback changed suffix");
    }
    std::printf("PASS direct zero-depth heapsort fallback for %s\n", variant);
}

static void test_variant(const char* path, const char* variant) {
    void* library = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (library == nullptr) {
        const char* error = dlerror();
        fail(error != nullptr ? error : "dlopen failed");
    }
    auto sort = reinterpret_cast<SortFn>(dlsym(library, "bounded_long_xss_sort"));
    require(sort != nullptr, "bounded_long_xss_sort symbol missing");
    test_declines(sort, variant);

    const size_t counts[] = {
        512, 513, 514, 515, 516, 517, 518, 519,
        1023, 1024, 1025, 4095, 4096, 4097, 8191, 8192
    };
    const char* pattern_names[] = {"equal", "two-values", "extremes", "reverse", "organ-pipe", "random"};
    for (size_t count : counts) {
        for (unsigned pattern = 0; pattern < 6; ++pattern) {
            (void)pattern_names[pattern];
            test_guarded_case(sort, count, pattern, true, variant);
            test_guarded_case(sort, count, pattern, false, variant);
            if (pattern == 2 || pattern == 4)
                test_nonzero_low_guard(sort, count, pattern, false, variant);
            if (pattern == 5)
                test_nonzero_low_guard(sort, count, pattern, true, variant);
        }
    }
    require(dlclose(library) == 0, "dlclose failed");
    std::printf("PASS guard pages and oracle for %s\n", variant);
}

int main(int argc, char** argv) {
    if (argc != 3) fail("usage: native_guard_harness <E-so> <U-so>");
#if defined(__GNUC__) && defined(__x86_64__)
    __builtin_cpu_init();
    if (!__builtin_cpu_supports("avx512f") || !__builtin_cpu_supports("avx512dq") ||
        !__builtin_cpu_supports("avx512vl") || !__builtin_cpu_supports("avx2") ||
        !__builtin_cpu_supports("popcnt")) {
        std::fprintf(stderr, "SKIP: required AVX-512/AVX2/POPCNT features unavailable\n");
        return 77;
    }
#endif
    test_heap_fallback(bounded_long_heap_fallback_E, "E");
    test_heap_fallback(bounded_long_heap_fallback_U, "U");
    test_variant(argv[1], "E");
    test_variant(argv[2], "U");
    return 0;
}
