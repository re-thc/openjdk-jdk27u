/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

#define _GNU_SOURCE
#include <dlfcn.h>
#include <stddef.h>
#include <stdlib.h>
#include <stdint.h>
#include <malloc.h>
#include <zlib.h>
#include <jni.h>

/* Diagnostic only: count allocations supplied through zlib's allocator API. */
typedef struct { size_t live, usable, count, calls; } Counter;
typedef union { struct { size_t requested, usable; } n; max_align_t align; } Header;
static voidpf counted_alloc(voidpf opaque, uInt count, uInt size) {
    Counter *c = opaque;
    c->calls++;
    size_t bytes = (size_t) count * size;
    Header *h = calloc(1, sizeof(Header) + bytes);
    if (!h) return NULL;
    h->n.requested = bytes;
    h->n.usable = malloc_usable_size(h);
    c->live += bytes;
    c->usable += h->n.usable;
    c->count++;
    return h + 1;
}
static void counted_free(voidpf opaque, voidpf p) {
    if (!p) return;
    Counter *c = opaque;
    Header *h = (Header *) p - 1;
    c->live -= h->n.requested;
    c->usable -= h->n.usable;
    c->count--;
    free(h);
}
int inflateInit2_(z_streamp strm, int bits, const char *version, int size) {
    int (*real_init)(z_streamp, int, const char *, int) = dlsym(RTLD_NEXT, "inflateInit2_");
    if (strm->zalloc || strm->zfree) return real_init(strm, bits, version, size);
    Counter *c = calloc(1, sizeof(Counter));
    if (!c) return Z_MEM_ERROR;
    strm->zalloc = counted_alloc;
    strm->zfree = counted_free;
    strm->opaque = c;
    int result = real_init(strm, bits, version, size);
    if (result != Z_OK) free(c);
    return result;
}
int inflateEnd(z_streamp strm) {
    int (*real_end)(z_streamp) = dlsym(RTLD_NEXT, "inflateEnd");
    Counter *c = strm->zalloc == counted_alloc ? strm->opaque : NULL;
    int result = real_end(strm);
    if (result == Z_OK && c) {
        if (c->live || c->count) abort();
        free(c);
    }
    return result;
}
JNIEXPORT jlongArray JNICALL Java_ZipInflaterProbe_measure(JNIEnv *env, jclass cls, jlong address) {
    z_streamp strm = (z_streamp)(intptr_t) address;
    if (!strm || strm->zalloc != counted_alloc) {
        jclass error = (*env)->FindClass(env, "java/lang/IllegalStateException");
        if (error != NULL) {
            (*env)->ThrowNew(env, error, "zlib allocator not interposed");
        }
        return NULL;
    }
    Counter *c = strm->opaque;
    /* Usable includes diagnostic headers/counter; requested excludes them. */
    jlong values[] = {sizeof(z_stream) + c->live, malloc_usable_size(strm) + c->usable + malloc_usable_size(c), c->count + 1, c->calls};
    jlongArray array = (*env)->NewLongArray(env, 4);
    if (array == NULL) return NULL;
    (*env)->SetLongArrayRegion(env, array, 0, 4, values);
    return array;
}
