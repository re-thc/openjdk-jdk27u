#define SZ_USE_WESTMERE 0
#define SZ_USE_HASWELL 0
#define SZ_USE_SKYLAKE 0
#define SZ_USE_ICELAKE 0
#define SZ_AVOID_LIBC 1
#include "stringzilla/types.h"
__declspec(noinline) int probe_32_clz(sz_u32_t x) { return sz_u32_clz(x); }
__declspec(noinline) int probe_32_ctz(sz_u32_t x) { return sz_u32_ctz(x); }
__declspec(noinline) int probe_32_popcount(sz_u32_t x) { return sz_u32_popcount(x); }
__declspec(noinline) int probe_64_clz(sz_u64_t x) { return sz_u64_clz(x); }
__declspec(noinline) int probe_64_ctz(sz_u64_t x) { return sz_u64_ctz(x); }
__declspec(noinline) int probe_64_popcount(sz_u64_t x) { return sz_u64_popcount(x); }
int main(void) {
    unsigned i;
    if (probe_32_clz(0) != 32 || probe_32_ctz(0) != 32 || probe_64_clz(0) != 64 || probe_64_ctz(0) != 64) return 1;
    if (probe_32_popcount(0x01234567U) != 12 || probe_64_popcount(0x0123456789ABCDEFULL) != 32) return 5;
    if (probe_32_popcount(0) || probe_64_popcount(0) || probe_32_popcount(~0U) != 32 || probe_64_popcount(~0ULL) != 64) return 2;
    for (i = 0; i < 32; ++i)
        if (probe_32_clz(1U << i) != 31 - i || probe_32_ctz(1U << i) != i || probe_32_popcount(1U << i) != 1) return 3;
    for (i = 0; i < 64; ++i)
        if (probe_64_clz(1ULL << i) != 63 - i || probe_64_ctz(1ULL << i) != i || probe_64_popcount(1ULL << i) != 1) return 4;
    return 0;
}
