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

/*
 * Verify cleanup after successful inflate initialization, including output
 * allocation failure and corrupt deflated manifests. See ManifestCleanup.java.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "jli_util.h"
#include <zlib.h>
static int real_init(z_streamp s, int w) { return inflateInit2(s, w); }
static int real_end(z_streamp s) { return inflateEnd(s); }
static int allocations, frees, live, inits, ends, end_errors;
static int malloc_calls, fail_malloc, fail_engine;

/* Test fixtures have ASCII names relative to jtreg's scratch directory. */
#ifdef _WIN32
#undef JLI_Open
#define JLI_Open _open
#endif

#define CHECK(condition) do { \
    if (!(condition)) { \
        fprintf(stderr, "Check failed: %s at line %d\n", #condition, __LINE__); \
        exit(2); \
    } \
} while (0)

static voidpf engine_alloc(voidpf opaque, uInt n, uInt size) {
    (void)opaque;
    if (fail_engine) return NULL;
    void *p = malloc((size_t)n * size);
    if (p) { allocations++; live++; }
    return p;
}
static void engine_free(voidpf opaque, voidpf p) {
    (void)opaque;
    if (p) { frees++; live--; free(p); }
}
static int tracked_init(z_streamp s, int w) {
    s->zalloc = engine_alloc; s->zfree = engine_free;
    int ret = real_init(s, w);
    if (ret == Z_OK) { inits++; }
    return ret;
}
static int tracked_end(z_streamp s) {
    ends++;
    int ret = real_end(s);
    end_errors += ret != Z_OK;
    return ret;
}
static void *manifest_malloc(size_t size) {
    malloc_calls++;
    return malloc_calls == fail_malloc ? NULL : malloc(size);
}
#undef inflateInit2
#undef inflateEnd
#define inflateInit2 tracked_init
#define inflateEnd tracked_end
#define malloc manifest_malloc
/* Include the exact production parser so static inflate_file is tested.
 * The real selected codec is linked separately; only this translation unit's
 * malloc and initialization/end call sites are instrumented.
 */
#ifndef MANIFEST_SOURCE
#define MANIFEST_SOURCE "parse_manifest.c"
#endif
#include MANIFEST_SOURCE
#undef malloc
#undef inflateInit2
#undef inflateEnd

static int one_case(const char *name, const char *path, size_t csize,
                    size_t isize, int how, int failure, int init_failure,
                    int expect_success, int expect_init) {
    int fd = JLI_Open(path, O_RDONLY
#ifdef O_BINARY
        | O_BINARY
#endif
    );
    CHECK(fd >= 0);
    allocations = frees = live = inits = ends = end_errors = malloc_calls = 0;
    fail_malloc = failure; fail_engine = init_failure;
    zentry entry; memset(&entry, 0, sizeof(entry));
    entry.csize = csize; entry.isize = isize; entry.how = how; entry.offset = 0;
    int size = -123;
    char *out = inflate_file(fd, &entry, &size);
    int success = out != NULL;
    int ok = success == expect_success && inits == expect_init && ends == expect_init &&
             live == 0 && allocations == frees && end_errors == 0;
    if (success) {
        static const char expected[] = "Manifest-Version: 1.0\r\n\r\n";
        ok &= size == (int)isize && memcmp(out, expected, isize) == 0 && out[isize] == 0;
        free(out);
    } else { ok &= size == -123; }
    printf("%s %s init=%d end=%d allocations=%d frees=%d live=%d size=%d\n",
           ok ? "PASS" : "FAIL", name, inits, ends, allocations, frees, live, size);
    /* Each negative-control case runs in its own process. */
    CHECK(close(fd) == 0);
    return ok;
}
int main(int argc, char **argv) {
    if (argc != 4 && argc != 5) {
        fprintf(stderr, "Usage: ManifestCleanup CASE VALID_RAW BAD_RAW STORED\n"
                        "   or: ManifestCleanup --jar JAR EXPECTED_RETURN\n");
        return 2;
    }
    if (argc == 4 && strcmp(argv[1], "--jar") == 0) {
        manifest_info info;
        int expected = atoi(argv[3]);
        int ret = JLI_ParseManifest(argv[2], &info);
        if (ret == 0) JLI_FreeManifest();
        int ok = ret == expected && inits == 1 && ends == 1 && live == 0 && allocations == frees && end_errors == 0;
        printf("%s full-JAR ret=%d expected=%d init=%d end=%d allocations=%d frees=%d live=%d\n",
               ok ? "PASS" : "FAIL", ret, expected, inits, ends, allocations, frees, live);
        return ok ? 0 : 1;
    }
    CHECK(argc == 5);
    int which = atoi(argv[1]);
    CHECK(which >= 0 && which <= 5);
    int ok = 1;
    if (which == 0) ok &= one_case("deflated-success",argv[2],30,25,DEFLATED,0,0,1,1);
    if (which == 1) ok &= one_case("output-malloc-failure",argv[2],30,25,DEFLATED,2,0,0,1);
    if (which == 2) ok &= one_case("corrupt-deflated-manifest",argv[3],1,25,DEFLATED,0,0,0,1);
    if (which == 3) ok &= one_case("input-malloc-failure",argv[2],30,25,DEFLATED,1,0,0,0);
    if (which == 4) ok &= one_case("init-allocation-failure",argv[2],30,25,DEFLATED,0,1,0,0);
    if (which == 5) ok &= one_case("stored-success",argv[4],25,25,STORED,0,0,1,0);
    return ok ? 0 : 1;
}
