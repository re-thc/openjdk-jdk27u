/*
 * Copyright (c) 2026, re-thc. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 *
 * Auxiliary component experiment. This does not replace a production backend.
 */
#define _GNU_SOURCE
#define SZ_USE_SVE 1
#include "src/java.base/share/native/libjava/StringZillaKernels.c"
#include <asm/hwcap.h>
#include <inttypes.h>
#include <linux/prctl.h>
#include <math.h>
#include <sched.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/auxv.h>
#include <sys/prctl.h>
#include <time.h>

JNIEXPORT jint JNICALL JVM_StringZillaCapabilities(void) { return JVM_STRINGZILLA_NEON; }
JNIEXPORT void JNICALL JVM_RegisterStringZillaKernels(const void* kernels) { (void)kernels; }

#define SVE_ENTRY __attribute__((target("+sve"), noinline))
#define SVE_CALLBACKS(tag, forward, equality) \
SVE_ENTRY static sz_cptr_t tag##_utf16(sz_cptr_t s, sz_size_t n, sz_cptr_t t, sz_size_t m) { \
    if (m > 256 && ((n | m) & 1) == 0) { \
        sz_cptr_t rightmost = s + n - m; \
        if (matches_bounded_candidate(rightmost, t, m, equality)) return rightmost; \
        return rfind_after_mismatch(s, n, t, m, JNI_TRUE, sz_rfind_byte_sve, equality, sz_rfind_sve); \
    } \
    return sz_rfind_sve(s, n, t, m); \
} \
SVE_ENTRY static jint tag##_reverse_latin(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 0, JNI_TRUE, sz_rfind_sve, search_utf16_default, equality); \
} \
SVE_ENTRY static jint tag##_reverse_utf16(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 1, JNI_TRUE, tag##_utf16, search_utf16_default, equality); \
} \
SVE_ENTRY static jint tag##_char_latin(const char* s, jint n, jint ch) { \
    return search_char_impl(s, n, ch, JNI_FALSE, JNI_TRUE, sz_rfind_sve, search_utf16_default); \
} \
SVE_ENTRY static jint tag##_char_utf16(const char* s, jint n, jint ch) { \
    return search_char_impl(s, n, ch, JNI_TRUE, JNI_TRUE, sz_rfind_sve, search_utf16_default); \
} \
SVE_ENTRY static jint tag##_forward_latin(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 0, JNI_FALSE, forward, search_utf16_default, equality); \
} \
SVE_ENTRY static jint tag##_forward_utf16(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 1, JNI_FALSE, forward, search_utf16_default, equality); \
} \
SVE_ENTRY static jint tag##_equal(const char* s, const char* t, jint n) { \
    return (unsigned int)n > JVM_STRINGZILLA_MAX_BYTES ? JVM_STRINGZILLA_FALLBACK : equality(s, t, n); \
}
SVE_CALLBACKS(sve128, sz_find_neon, sz_equal_neon)
SVE_CALLBACKS(svewide, sz_find_sve, sz_equal_sve)
#undef SVE_CALLBACKS

SVE_ENTRY static unsigned int actual_sve_bytes(void) { return (unsigned int)svcntb(); }

enum { REVERSE, CHARACTER, FORWARD, EQUALITY };
enum { MISS, END, NEAR_END, OVERLAP, PERIOD2, PERIOD3, PREFIX, UNIFORM, ODD_UTF16, SUPPLEMENTARY, LOCATION_MINUS1, LOCATION_MINUS8 };
typedef struct {
    const char* id;
    int op, utf16, length, count, shape;
} Case;
typedef struct {
    const Case* spec;
    char* source;
    char* target;
    void* source_allocation;
    void* target_allocation;
    int source_bytes, target_bytes, character, expected;
} Fixture;

#define R(id, u, h, n, shape) { id, REVERSE, u, h, n, shape }
#define C(id, u, h, shape) { id, CHARACTER, u, h, shape == SUPPLEMENTARY ? 2 : 1, shape }
static const Case cases[] = {
    R("latin-short-31-miss", 0, 31, 4, MISS), R("latin-short-32-miss", 0, 32, 4, MISS),
    R("latin-threshold-255-miss", 0, 255, 4, MISS), R("latin-threshold-256-miss", 0, 256, 4, MISS),
    R("latin-threshold-257-miss", 0, 257, 4, MISS), R("latin-bulk-miss", 0, 4096, 4, MISS),
    R("latin-immediate", 0, 4096, 4, END), R("latin-64-immediate", 0, 4096, 64, END),
    R("latin-64-near-end-miss", 0, 4096, 64, NEAR_END),
    R("latin-single-end-257", 0, 257, 257, END), R("latin-single-miss-257", 0, 257, 257, MISS),
    R("latin-overlap-258", 0, 258, 257, OVERLAP), R("latin-overlap-288", 0, 288, 257, OVERLAP),
    R("latin-overlap-289", 0, 289, 257, OVERLAP), R("latin-overlap-290", 0, 290, 257, OVERLAP),
    R("latin-overlap-bulk", 0, 4096, 257, OVERLAP), R("latin-period2", 0, 4096, 512, PERIOD2),
    R("latin-period3", 0, 4095, 513, PERIOD3), R("latin-prefix-miss", 0, 575, 511, PREFIX),
    R("utf16-short-15-miss", 1, 15, 4, MISS), R("utf16-short-16-miss", 1, 16, 4, MISS),
    R("utf16-threshold-127-miss", 1, 127, 4, MISS), R("utf16-threshold-128-miss", 1, 128, 4, MISS),
    R("utf16-threshold-129-miss", 1, 129, 4, MISS), R("utf16-bulk-miss", 1, 4096, 4, MISS),
    R("utf16-512-9-miss", 1, 512, 9, MISS), R("utf16-513-9-miss", 1, 513, 9, MISS),
    R("utf16-512-9-end", 1, 512, 9, END), R("utf16-512-9-near-end", 1, 512, 9, NEAR_END),
    R("utf16-immediate", 1, 128, 4, END), R("utf16-64-immediate", 1, 4096, 64, END),
    R("utf16-64-near-end-miss", 1, 512, 64, NEAR_END),
    R("utf16-overlap-130", 1, 130, 129, OVERLAP), R("utf16-overlap-144", 1, 144, 129, OVERLAP),
    R("utf16-overlap-145", 1, 145, 129, OVERLAP), R("utf16-overlap-146", 1, 146, 129, OVERLAP),
    R("utf16-overlap-bulk", 1, 2048, 257, OVERLAP), R("utf16-period2", 1, 2048, 256, PERIOD2),
    R("utf16-period3", 1, 2047, 257, PERIOD3), R("utf16-prefix-miss", 1, 303, 256, PREFIX),
    R("utf16-uniform-129", 1, 129, 129, UNIFORM), R("utf16-uniform-130", 1, 130, 129, UNIFORM),
    R("utf16-crossed-64", 1, 512, 64, ODD_UTF16), R("utf16-crossed-129", 1, 512, 129, ODD_UTF16),
    C("char-latin-short", 0, 31, MISS), C("char-latin-255", 0, 255, MISS),
    C("char-latin-256", 0, 256, MISS), C("char-latin-bulk", 0, 4096, MISS),
    C("char-latin-immediate", 0, 4096, END),
    C("char-utf16-127", 1, 127, MISS), C("char-utf16-128", 1, 128, MISS),
    C("char-utf16-129", 1, 129, MISS), C("char-utf16-255", 1, 255, MISS),
    C("char-utf16-256", 1, 256, MISS), C("char-utf16-257", 1, 257, MISS),
    C("char-utf16-bulk", 1, 4096, MISS), C("char-utf16-immediate", 1, 4096, END),
    C("char-utf16-supplementary", 1, 4096, SUPPLEMENTARY),
    R("latin-4-last-minus1-match", 0, 4096, 4, LOCATION_MINUS1),
    R("latin-4-last-minus8-match", 0, 4096, 4, LOCATION_MINUS8),
    R("utf16-9-last-minus1-match", 1, 512, 9, LOCATION_MINUS1),
    R("utf16-9-last-minus8-match", 1, 512, 9, LOCATION_MINUS8),
    R("latin-257-last-minus1-match", 0, 4096, 257, LOCATION_MINUS1),
    R("latin-257-last-minus8-match", 0, 4096, 257, LOCATION_MINUS8),
    R("utf16-129-last-minus1-match", 1, 2048, 129, LOCATION_MINUS1),
    R("utf16-129-last-minus8-match", 1, 2048, 129, LOCATION_MINUS8),
    C("char-latin-last-minus1-match", 0, 4096, LOCATION_MINUS1),
    C("char-latin-last-minus8-match", 0, 4096, LOCATION_MINUS8),
    C("char-utf16-last-minus1-match", 1, 4096, LOCATION_MINUS1),
    C("char-utf16-last-minus8-match", 1, 4096, LOCATION_MINUS8),
    { "forward-latin-control", FORWARD, 0, 4096, 4, MISS },
    { "forward-utf16-control", FORWARD, 1, 4096, 4, MISS },
    { "equality-latin-control", EQUALITY, 0, 4096, 4096, UNIFORM },
    { "equality-utf16-control", EQUALITY, 1, 4096, 4096, UNIFORM },
    R("bytes-bound-fallback", 0, 65537, 4, MISS),
    R("work-bound-fallback", 1, 4096, 257, NEAR_END)
};
#undef R
#undef C

static volatile uint64_t checksum_sink;

static void require(int predicate, const char* message) {
    if (!predicate) { fprintf(stderr, "%s\n", message); exit(1); }
}
static uint64_t now_ns(void) {
    struct timespec time;
    require(clock_gettime(CLOCK_MONOTONIC_RAW, &time) == 0, "clock_gettime");
    return (uint64_t)time.tv_sec * 1000000000u + time.tv_nsec;
}
static unsigned int unit(const char* bytes, int index, int utf16) {
    if (!utf16) return (unsigned char)bytes[index];
    uint16_t result;
    memcpy(&result, bytes + index * 2, sizeof(result));
    return result;
}
static void set_unit(char* bytes, int index, int utf16, unsigned int value) {
    if (utf16) {
        uint16_t encoded = (uint16_t)value;
        memcpy(bytes + index * 2, &encoded, sizeof(encoded));
    } else {
        bytes[index] = (char)value;
    }
}
static int scalar(const Fixture* fixture) {
    const Case* c = fixture->spec;
    if (c->op == EQUALITY) {
        for (int i = 0; i < fixture->source_bytes; i++) {
            if (fixture->source[i] != fixture->target[i]) return 0;
        }
        return 1;
    }
    int limit = c->length - c->count;
    int reverse = c->op != FORWARD;
    for (int i = reverse ? limit : 0; i >= 0 && i <= limit; i += reverse ? -1 : 1) {
        int j = 0;
        while (j < c->count && unit(fixture->source, i + j, c->utf16) == unit(fixture->target, j, c->utf16)) j++;
        if (j == c->count) return i * (c->utf16 ? 2 : 1);
    }
    return -1;
}
static void save_input(const char* id, const char* part, const char* bytes, int length) {
    char path[256];
    require(snprintf(path, sizeof(path), "component-output/inputs/%s-%s.bin", id, part) > 0, "input path");
    FILE* file = fopen(path, "wb");
    require(file != NULL, "input fopen");
    require(fwrite(bytes, 1, length, file) == (size_t)length, "input fwrite");
    require(fclose(file) == 0, "input fclose");
}
static Fixture fixture(const Case* c) {
    Fixture f = { .spec = c, .source_bytes = c->length * (c->utf16 ? 2 : 1),
                  .target_bytes = c->count * (c->utf16 ? 2 : 1) };
    require(posix_memalign(&f.source_allocation, 64, f.source_bytes + 128) == 0, "source allocation");
    require(posix_memalign(&f.target_allocation, 64, f.target_bytes + 128) == 0, "target allocation");
    f.source = (char*)f.source_allocation + (c->utf16 ? 2 : 1);
    f.target = (char*)f.target_allocation;
    unsigned int a = c->utf16 ? 0x0401 : 'a', b = a + 1;
    for (int i = 0; i < c->length; i++) set_unit(f.source, i, c->utf16, a);
    for (int i = 0; i < c->count; i++) set_unit(f.target, i, c->utf16, a);
    if (c->shape == PERIOD2 || c->shape == PERIOD3) {
        int period = c->shape == PERIOD2 ? 2 : 3;
        for (int i = 0; i < c->length; i++) set_unit(f.source, i, c->utf16, a + i % period);
        for (int i = 0; i < c->count; i++) set_unit(f.target, i, c->utf16, a + i % period);
        set_unit(f.target, c->count - 3, c->utf16, a + period);
    } else if (c->shape == ODD_UTF16) {
        require(c->utf16, "UTF16 crossed fixture");
        for (int i = 0; i < c->count; i++) set_unit(f.target, i, 1, 0x0104);
        int odd = (c->length - c->count - 1) * 2 + 1;
        memcpy(f.source + odd, f.target, f.target_bytes);
    } else if (c->shape == SUPPLEMENTARY) {
        require(c->utf16 && c->count == 2, "supplementary fixture");
        set_unit(f.target, 0, 1, 0xd83d);
        set_unit(f.target, 1, 1, 0xde00);
        memcpy(f.source + f.source_bytes - f.target_bytes, f.target, f.target_bytes);
    } else if (c->shape != UNIFORM) {
        int position = c->shape == NEAR_END ? c->count - 2 : c->shape == OVERLAP ? 0
                : c->shape == PREFIX ? c->count - (c->utf16 ? 129 : 257) : c->count - 1;
        require(position >= 0 && position < c->count, "needle anomaly");
        set_unit(f.target, position, c->utf16, b);
        if (c->shape == END) memcpy(f.source + f.source_bytes - f.target_bytes, f.target, f.target_bytes);
        if (c->shape == OVERLAP) memcpy(f.source, f.target, f.target_bytes);
        if (c->shape == LOCATION_MINUS1 || c->shape == LOCATION_MINUS8) {
            int offset = (c->length - c->count - (c->shape == LOCATION_MINUS1 ? 1 : 8)) * (c->utf16 ? 2 : 1);
            require(offset >= 0, "positive near-end offset");
            memcpy(f.source + offset, f.target, f.target_bytes);
        }
    }
    f.character = c->shape == SUPPLEMENTARY ? 0x1f600 : unit(f.target, 0, c->utf16);
    f.expected = scalar(&f);
    int expected = c->op == EQUALITY ? 1 : c->shape == END || c->shape == SUPPLEMENTARY || c->shape == UNIFORM
            ? f.source_bytes - f.target_bytes
            : c->shape == LOCATION_MINUS1 ? f.source_bytes - f.target_bytes - (c->utf16 ? 2 : 1)
            : c->shape == LOCATION_MINUS8 ? f.source_bytes - f.target_bytes - (c->utf16 ? 16 : 8)
            : c->shape == OVERLAP ? 0 : -1;
    require(f.expected == expected, c->id);
    save_input(c->id, "source", f.source, f.source_bytes);
    save_input(c->id, "target", f.target, f.target_bytes);
    return f;
}

__attribute__((noipa))
static uint64_t execute(const StringZillaKernels* kernels, const Fixture* f, uint64_t iterations) {
    const Case* c = f->spec;
    uint64_t checksum = 0;
    atomic_signal_fence(memory_order_seq_cst);
    if (c->op == CHARACTER) {
        StringZillaCharFn volatile fn = c->utf16 ? kernels->rfindCharUTF16 : kernels->rfindCharLatin1;
        for (uint64_t i = 0; i < iterations; i++) checksum += (uint32_t)fn(f->source, f->source_bytes, f->character);
    } else if (c->op == EQUALITY) {
        StringZillaEqualFn volatile fn = kernels->equal;
        for (uint64_t i = 0; i < iterations; i++) checksum += (uint32_t)fn(f->source, f->target, f->source_bytes);
    } else {
        StringZillaSearchFn volatile fn = c->op == FORWARD ? (c->utf16 ? kernels->findUTF16 : kernels->findLatin1)
                : (c->utf16 ? kernels->rfindUTF16 : kernels->rfindLatin1);
        for (uint64_t i = 0; i < iterations; i++) checksum += (uint32_t)fn(f->source, f->source_bytes, f->target, f->target_bytes);
    }
    checksum_sink ^= checksum;
    atomic_signal_fence(memory_order_seq_cst);
    return checksum;
}
static uint64_t sample(const StringZillaKernels* table, const Fixture* f, uint64_t iterations) {
    uint64_t start = now_ns();
    uint64_t result = execute(table, f, iterations);
    uint64_t elapsed = now_ns() - start;
    require(result == (uint64_t)(uint32_t)f->expected * iterations, f->spec->id);
    return elapsed;
}
static void measure(const Fixture* f, const StringZillaKernels* experimental, int check_only) {
    int fallback = f->source_bytes > JVM_STRINGZILLA_MAX_BYTES ||
            (f->spec->op != EQUALITY && (int64_t)f->source_bytes * f->target_bytes > JVM_STRINGZILLA_MAX_WORK);
    int expected = fallback ? JVM_STRINGZILLA_FALLBACK : f->expected;
    require(execute(&neon_kernels, f, 1) == (uint32_t)expected, "NEON scalar verification");
    require(execute(experimental, f, 1) == (uint32_t)expected, "SVE scalar verification");
    printf("STRINGZILLA_SVE_CHECK {\"case\":\"%s\",\"expected_byte_offset_or_equal\":%d,\"classification\":\"%s\"}\n",
           f->spec->id, expected, fallback ? "outside-production-bound" : "eligible");
    if (check_only || fallback) return;
    uint64_t iterations = 64, slow = 0;
    do {
        uint64_t n = sample(&neon_kernels, f, iterations), s = sample(experimental, f, iterations);
        slow = n > s ? n : s;
        if (slow >= 2000000 || iterations >= 1048576) break;
        iterations *= 2;
    } while (1);
    iterations = (uint64_t)((double)iterations * 20000000.0 / (double)(slow ? slow : 1));
    if (iterations < 128) iterations = 128;
    if (iterations > 4194304) iterations = 4194304;
    for (int i = 0; i < 3; i++) {
        sample(i & 1 ? experimental : &neon_kernels, f, iterations);
        sample(i & 1 ? &neon_kernels : experimental, f, iterations);
    }
    uint64_t raw[2][15];
    for (int i = 0; i < 15; i++) {
        int first = i & 1;
        raw[first][i] = sample(first ? experimental : &neon_kernels, f, iterations);
        raw[1 - first][i] = sample(first ? &neon_kernels : experimental, f, iterations);
    }
    printf("STRINGZILLA_SVE_COMPONENT {\"case\":\"%s\",\"operation\":%d,\"coder\":\"%s\","
           "\"haystack_units\":%d,\"needle_units\":%d,\"haystack_bytes\":%d,\"needle_bytes\":%d,"
           "\"source_mod64\":%zu,\"target_mod64\":%zu,\"iterations_per_sample\":%" PRIu64 ","
           "\"samples_per_backend\":15,\"warmups_per_backend\":3,\"timing_evidence\":\"component-only\","
           "\"raw_batch_ns\":{\"neon\":[",
           f->spec->id, f->spec->op, f->spec->utf16 ? "UTF16-native-endian" : "LATIN1",
           f->spec->length, f->spec->count, f->source_bytes, f->target_bytes,
           (size_t)((uintptr_t)f->source & 63), (size_t)((uintptr_t)f->target & 63), iterations);
    for (int j = 0; j < 15; j++) printf("%s%" PRIu64, j ? "," : "", raw[0][j]);
    printf("],\"sve\":[");
    for (int j = 0; j < 15; j++) printf("%s%" PRIu64, j ? "," : "", raw[1][j]);
    printf("]}}\n");
    fflush(stdout);
}

int main(int argc, char** argv) {
    int check_only = argc == 2 && strcmp(argv[1], "--check-only") == 0;
    require(argc == 1 || check_only, "usage: component [--check-only]");
    cpu_set_t allowed;
    require(sched_getaffinity(0, sizeof(allowed), &allowed) == 0, "sched_getaffinity");
    int cpu = 0;
    while (cpu < CPU_SETSIZE && !CPU_ISSET(cpu, &allowed)) cpu++;
    require(cpu < CPU_SETSIZE, "CPU affinity");
    CPU_ZERO(&allowed);
    CPU_SET(cpu, &allowed);
    require(sched_setaffinity(0, sizeof(allowed), &allowed) == 0, "sched_setaffinity");
    unsigned long hwcap = getauxval(AT_HWCAP);
    if (!(hwcap & HWCAP_SVE)) {
        printf("STRINGZILLA_SVE_HOST {\"available\":false,\"cpu\":%d,\"timed_records\":0,\"reason\":\"HWCAP_SVE absent\"}\n", cpu);
        return 0;
    }
    int control = prctl(PR_SVE_GET_VL, 0L, 0L, 0L, 0L);
    require(control >= 0, "PR_SVE_GET_VL");
    unsigned int vector_bytes = (unsigned int)control & PR_SVE_VL_LEN_MASK;
    require(vector_bytes >= 16 && vector_bytes == actual_sve_bytes(), "runtime SVE vector length");
    union { uint16_t word; unsigned char bytes[2]; } endian = { .word = 1 };
    printf("STRINGZILLA_SVE_HOST {\"available\":true,\"cpu\":%d,\"vector_bytes\":%u,"
           "\"endianness\":\"%s\",\"compiler\":\"%s\",\"check_only\":%s,"
           "\"policy\":\"%s\",\"timing_evidence\":\"component-only\"}\n",
           cpu, vector_bytes, endian.bytes[0] ? "little" : "big", __VERSION__, check_only ? "true" : "false",
           vector_bytes == 16 ? "SVE reverse and byte; NEON forward and equality" : "SVE reverse, byte, forward and equality");
    StringZillaKernels experimental = neon_kernels;
    if (vector_bytes == 16) {
        experimental.rfindLatin1 = sve128_reverse_latin;
        experimental.rfindUTF16 = sve128_reverse_utf16;
        experimental.rfindCharLatin1 = sve128_char_latin;
        experimental.rfindCharUTF16 = sve128_char_utf16;
    } else {
        experimental.rfindLatin1 = svewide_reverse_latin;
        experimental.rfindUTF16 = svewide_reverse_utf16;
        experimental.rfindCharLatin1 = svewide_char_latin;
        experimental.rfindCharUTF16 = svewide_char_utf16;
        experimental.findLatin1 = svewide_forward_latin;
        experimental.findUTF16 = svewide_forward_utf16;
        experimental.equal = svewide_equal;
    }
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
        Fixture f = fixture(&cases[i]);
        measure(&f, &experimental, check_only);
        free(f.source_allocation);
        free(f.target_allocation);
    }
    printf("STRINGZILLA_SVE_COMPLETE {\"cases\":%zu,\"checksum\":%" PRIu64 ",\"check_only\":%s}\n",
           sizeof(cases) / sizeof(cases[0]), checksum_sink, check_only ? "true" : "false");
    return 0;
}
