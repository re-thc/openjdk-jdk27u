
#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int current_equal(const char*, const char*, int);
int patched_equal(const char*, const char*, int);
typedef int (*equal_fn)(const char*, const char*, int);
static volatile unsigned int sink;

static uint64_t now_ns(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t) != 0) abort();
    return (uint64_t)t.tv_sec * 1000000000u + (uint64_t)t.tv_nsec;
}

static uint64_t elapsed(equal_fn fn, const char* a, const char* b, int n, unsigned int iterations) {
    unsigned int sum = 0;
    uint64_t start = now_ns();
    for (unsigned int i = 0; i < iterations; i++) sum += (unsigned int)fn(a, b, n);
    uint64_t duration = now_ns() - start;
    sink += sum;
    return duration;
}

static unsigned int calibrate(equal_fn fn, const char* a, const char* b, int n) {
    unsigned int iterations = 1024;
    while (elapsed(fn, a, b, n, iterations) < 3000000u && iterations < (1u << 24)) iterations *= 2;
    return iterations;
}

int main(int argc, char** argv) {
    const int lengths[] = {0, 1, 7, 8, 15, 16, 23, 24, 25, 31, 32, 33, 63, 64, 65,
                           127, 128, 129, 255, 256, 257, 1024, 4096};
    const int offsets[][2] = {{0, 0}, {1, 1}, {1, 3}, {7, 0}};
    const equal_fn functions[] = {current_equal, patched_equal};
    int check_only = argc == 2 && strcmp(argv[1], "--check") == 0;
    unsigned int case_id = 0;
    if (!check_only) puts("case,length,source_offset,target_offset,mismatch,round,order,variant,iterations,elapsed_ns,ns_per_op");
    for (unsigned int l = 0; l < sizeof(lengths) / sizeof(lengths[0]); l++) {
        int n = lengths[l];
        const int mismatches[] = {-1, 0, 7, 31, n / 2, n - 1};
        for (unsigned int o = 0; o < sizeof(offsets) / sizeof(offsets[0]); o++) {
            int a_offset = offsets[o][0], b_offset = offsets[o][1];
            size_t a_size = (size_t)(n + a_offset), b_size = (size_t)(n + b_offset);
            char* a_base = malloc(a_size != 0 ? a_size : 1);
            char* b_base = malloc(b_size != 0 ? b_size : 1);
            if (a_base == NULL || b_base == NULL) abort();
            char* a = a_base + a_offset;
            char* b = b_base + b_offset;
            for (unsigned int m = 0; m < sizeof(mismatches) / sizeof(mismatches[0]); m++) {
                int mismatch = mismatches[m], duplicate = 0;
                if (mismatch >= n || mismatch < -1) continue;
                for (unsigned int previous = 0; previous < m; previous++)
                    if (mismatches[previous] == mismatch) duplicate = 1;
                if (duplicate) continue;
                for (int i = 0; i < n; i++) a[i] = b[i] = (char)((i * 13 + 7) & 255);
                if (mismatch >= 0) b[mismatch] ^= 1;
                for (int variant = 0; variant < 2; variant++) {
                    int actual = functions[variant](a, b, n);
                    if (actual != (mismatch < 0)) {
                        fprintf(stderr, "Bad result case=%u variant=%d n=%d mismatch=%d actual=%d\n",
                                case_id, variant, n, mismatch, actual);
                        return 1;
                    }
                }
                if (!check_only) {
                    unsigned int counts[2];
                    for (int variant = 0; variant < 2; variant++)
                        counts[variant] = calibrate(functions[variant], a, b, n);
                    for (int round = 0; round < 10; round++) {
                        for (int order = 0; order < 2; order++) {
                            int variant = ((int)case_id + round + order) & 1;
                            uint64_t duration = elapsed(functions[variant], a, b, n, counts[variant]);
                            printf("%u,%d,%d,%d,%d,%d,%d,%s,%u,%llu,%.9f\n",
                                   case_id, n, a_offset, b_offset, mismatch, round, order,
                                   variant == 0 ? "current" : "patched", counts[variant],
                                   (unsigned long long)duration, (double)duration / counts[variant]);
                        }
                    }
                }
                case_id++;
            }
            free(a_base);
            free(b_base);
        }
    }
    if (check_only) printf("Native equality fixture checks passed: %u cases, exact-size allocations\n", case_id);
    return 0;
}
