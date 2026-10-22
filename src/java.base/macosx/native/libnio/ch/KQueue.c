/*
 * Copyright (c) 2012, 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

#include <strings.h>
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

#include "jni.h"
#include "jni_util.h"
#include "jlong.h"
#include "nio.h"
#include "nio_util.h"

#include "sun_nio_ch_KQueue.h"

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_keventSize(JNIEnv* env, jclass clazz)
{
    return sizeof(struct kevent);
}

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_identOffset(JNIEnv* env, jclass clazz)
{
    return offsetof(struct kevent, ident);
}

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_filterOffset(JNIEnv* env, jclass clazz)
{
    return offsetof(struct kevent, filter);
}

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_flagsOffset(JNIEnv* env, jclass clazz)
{
    return offsetof(struct kevent, flags);
}

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_create(JNIEnv *env, jclass clazz) {
    int kqfd = kqueue();
    if (kqfd < 0) {
        JNU_ThrowIOExceptionWithLastError(env, "kqueue failed");
        return IOS_THROWN;
    }
    return kqfd;
}

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_register(JNIEnv *env, jclass clazz, jint kqfd,
                                jint fd, jint filter, jint flags)

{
    struct kevent changes[1];
    int res;

    EV_SET(&changes[0], fd, filter, flags, 0, 0, 0);
    RESTARTABLE(kevent(kqfd, &changes[0], 1, NULL, 0, NULL), res);
    return (res == -1) ? errno : 0;
}

JNIEXPORT void JNICALL
Java_sun_nio_ch_KQueue_registerChanges(JNIEnv *env, jclass clazz, jint kqfd,
                                     jintArray changeArray, jint count,
                                     jintArray errorArray)
{
    jint values[sun_nio_ch_KQueue_MAX_CHANGES * 3];
    jint errors[sun_nio_ch_KQueue_MAX_CHANGES];
    struct kevent changes[sun_nio_ch_KQueue_MAX_CHANGES];
    struct kevent receipts[sun_nio_ch_KQueue_MAX_CHANGES];
    struct timespec timeout = { 0, 0 };
    int completed = 0;

    if (changeArray == NULL || errorArray == NULL || count <= 0 ||
        count > sun_nio_ch_KQueue_MAX_CHANGES ||
        (*env)->GetArrayLength(env, changeArray) < count * 3 ||
        (*env)->GetArrayLength(env, errorArray) < count) {
        JNU_ThrowIllegalArgumentException(env, "Invalid registration batch");
        return;
    }
    (*env)->GetIntArrayRegion(env, changeArray, 0, count * 3, values);
    if ((*env)->ExceptionCheck(env)) {
        return;
    }
    for (int i = 0; i < count; i++) {
        int fd = values[i * 3];
        int filter = values[i * 3 + 1];
        int flags = values[i * 3 + 2];
        if ((filter != EVFILT_READ && filter != EVFILT_WRITE) ||
            (flags != EV_ADD && flags != EV_DELETE)) {
            JNU_ThrowIllegalArgumentException(env, "Invalid registration change");
            return;
        }
        for (int j = 0; j < i; j++) {
            if (values[j * 3] == fd && values[j * 3 + 1] == filter) {
                JNU_ThrowIllegalArgumentException(env, "Repeated registration filter");
                return;
            }
        }
        EV_SET(&changes[i], fd, filter, flags | EV_RECEIPT, 0, 0,
               (void *)(uintptr_t)(i + 1));
    }

    while (completed < count) {
        int remaining = count - completed;
        int n = kevent(kqfd, changes + completed, remaining,
                       receipts, remaining, &timeout);
        if (n < 0) {
            // No one-shot or ordered same-filter sequences are accepted here.
            // Retrying distinct level-triggered changes is idempotent, even
            // when an interrupted call has already applied some of them.
            if (errno == EINTR) {
                continue;
            }
            JNU_ThrowIOExceptionWithLastError(env, "kevent registration failed");
            return;
        }
        if (n == 0 || n > remaining) {
            JNU_ThrowIOException(env, "Missing kevent registration receipts");
            return;
        }
        for (int i = 0; i < n; i++) {
            int index = completed + i;
            if ((receipts[i].flags & EV_ERROR) == 0 ||
                receipts[i].ident != changes[index].ident ||
                receipts[i].filter != changes[index].filter ||
                receipts[i].udata != changes[index].udata) {
                JNU_ThrowIOException(env, "Invalid kevent registration receipt");
                return;
            }
            errors[index] = (jint)receipts[i].data;
        }
        completed += n;
    }
    for (int i = 0; i < count; i++) {
        // Match the single-change registration's handling of an interrupted
        // filter operation. Other filters have already received their outcomes.
        if (errors[i] == EINTR) {
            int res;
            changes[i].flags &= ~EV_RECEIPT;
            RESTARTABLE(kevent(kqfd, &changes[i], 1, NULL, 0, &timeout), res);
            errors[i] = (res == -1) ? errno : 0;
        }
    }
    (*env)->SetIntArrayRegion(env, errorArray, 0, count, errors);
}

JNIEXPORT jint JNICALL
Java_sun_nio_ch_KQueue_poll(JNIEnv *env, jclass clazz, jint kqfd, jlong address,
                            jint nevents, jlong timeout)
{
    struct kevent *events = jlong_to_ptr(address);
    int res;
    struct timespec ts;
    struct timespec *tsp;

    if (timeout >= 0) {
        ts.tv_sec = timeout / 1000;
        ts.tv_nsec = (timeout % 1000) * 1000000;
        tsp = &ts;
    } else {
        tsp = NULL;
    }

    res = kevent(kqfd, NULL, 0, events, nevents, tsp);
    if (res < 0) {
        if (errno == EINTR) {
            return IOS_INTERRUPTED;
        } else {
            JNU_ThrowIOExceptionWithLastError(env, "kqueue failed");
            return IOS_THROWN;
        }
    }
    return res;
}
