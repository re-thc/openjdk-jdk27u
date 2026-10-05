/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#define _POSIX_C_SOURCE 200809L
#include <zlib.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static unsigned allocation_shift;
static voidpf aligned_calloc(voidpf unused, uInt items, uInt size) {
    size_t bytes = (size_t)items * size;
    if (size != 0 && bytes / size != items) return NULL;
    if (bytes > SIZE_MAX - 128) return NULL;
    unsigned char *base = calloc(1, bytes + 128);
    if (base == NULL) return NULL;
    uintptr_t aligned = ((uintptr_t)base + sizeof(void *) + 63) & ~(uintptr_t)63;
    unsigned char *result = (unsigned char *)aligned + allocation_shift;
    ((void **)result)[-1] = base;
    return result;
}
static void aligned_free(voidpf unused, voidpf ptr) {
    if (ptr != NULL) free(((void **)ptr)[-1]);
}
static double seconds(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
static z_stream *create(int mode) {
    z_stream *s;
    allocation_shift = mode < 0 ? 0 : (unsigned)mode;
    s = mode < 0 ? calloc(1, sizeof(*s)) : aligned_calloc(NULL, 1, sizeof(*s));
    if (s == NULL) abort();
    if (mode >= 0) { s->zalloc = aligned_calloc; s->zfree = aligned_free; }
    if (deflateInit(s, 6) != Z_OK) abort();
    return s;
}
static void destroy(z_stream *s, int mode) {
    deflateEnd(s);
    if (mode < 0) free(s); else aligned_free(NULL, s);
}
int main(void) {
    static const char text[] = "openjdk java.util.zip compression streaming checksum 0123456789\n";
    unsigned char input[65536], output[66560];
    for (size_t i = 0; i < sizeof(input); i++) input[i] = text[i % (sizeof(text) - 1)];
    int sizes[] = {64, 1024, 65536};
    int modes[] = {-1, 0, 16, 32, 48};
    printf("zlib=%s\n", zlibVersion());
    printf("kind,bytes,allocation_shift,pass,ns_per_op,compressed_bytes,stream_mod64,state_mod64\n");
    for (int fresh = 0; fresh <= 1; fresh++) {
        for (int si = 0; si < (fresh ? 2 : 3); si++) {
            for (int pass = 0; pass < 4; pass++) {
                for (int mi = 0; mi < 5; mi++) {
                    int mode = modes[pass & 1 ? 4 - mi : mi];
                    int size = sizes[si];
                    z_stream *s = create(mode);
                    unsigned stream_align = (uintptr_t)s & 63;
                    unsigned state_align = (uintptr_t)s->state & 63;
                    unsigned long count = 0;
                    unsigned compressed = 0;
                    double begin = seconds(), end;
                    do {
                        if (fresh) { destroy(s, mode); s = create(mode); }
                        else if (deflateReset(s) != Z_OK) abort();
                        s->next_in = input; s->avail_in = size;
                        s->next_out = output; s->avail_out = sizeof(output);
                        if (deflate(s, Z_FINISH) != Z_STREAM_END) abort();
                        compressed = sizeof(output) - s->avail_out;
                        ++count;
                        end = seconds();
                    } while (end - begin < 0.25);
                    printf("%s,%d,%d,%d,%.1f,%u,%u,%u\n", fresh ? "new-stream" : "reset",
                           size, mode, pass, (end - begin) * 1e9 / count,
                           compressed, stream_align, state_align);
                    fflush(stdout);
                    destroy(s, mode);
                }
            }
        }
    }
    return 0;
}
