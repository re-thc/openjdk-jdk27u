/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#include <errno.h>
#include <string.h>
#include <sys/event.h>
#include <mach-o/dyld-interposing.h>
#include "KeventReach.h"

/* Main-thread, selector-fd scoped. Counting is disabled before returning data. */
static _Thread_local int enabled, target;
static _Thread_local jlong counts[16];
enum { CREATES, REG_CALLS, ENTRIES, RECEIPT_CALLS, SCALAR_CALLS, POLLS,
       READ_ADD, READ_DELETE, WRITE_ADD, WRITE_DELETE, RECEIPTS, ERRORS,
       SYS_EINTR, RECEIPT_EINTR, MAX_CHANGES, OTHER_ERRORS };

static int observed_kqueue(void) {
    int result = kqueue(), saved_errno = errno;
    if (enabled && target == -1) {
        counts[CREATES]++;
        if (result < 0) counts[OTHER_ERRORS]++;
    }
    errno = saved_errno;
    return result;
}
DYLD_INTERPOSE(observed_kqueue, kqueue);

static int observed_kevent(int fd, const struct kevent *changes, int nchanges,
                           struct kevent *events, int capacity, const struct timespec *timeout) {
    int tracked = enabled && (target == -1 || target == fd), receipt = 0;
    if (tracked) {
        if (nchanges == 0) counts[POLLS]++;
        else {
            counts[REG_CALLS]++;
            counts[ENTRIES] += nchanges;
            if (nchanges > counts[MAX_CHANGES]) counts[MAX_CHANGES] = nchanges;
            for (int i = 0; i < nchanges; i++) {
                if (changes[i].flags & EV_RECEIPT) receipt = 1;
                int offset = changes[i].filter == EVFILT_READ ? READ_ADD :
                             changes[i].filter == EVFILT_WRITE ? WRITE_ADD : -1;
                if (offset >= 0) {
                    if (changes[i].flags & EV_ADD) counts[offset]++;
                    if (changes[i].flags & EV_DELETE) counts[offset + 1]++;
                }
            }
            counts[receipt ? RECEIPT_CALLS : SCALAR_CALLS]++;
        }
    }
    int result = kevent(fd, changes, nchanges, events, capacity, timeout);
    int saved_errno = errno;
    if (tracked) {
        if (result < 0) counts[saved_errno == EINTR ? SYS_EINTR : OTHER_ERRORS]++;
        if (receipt && result > 0) for (int i = 0; i < result; i++) {
            if (events[i].flags & EV_ERROR) {
                counts[RECEIPTS]++;
                if (events[i].data != 0) counts[events[i].data == EINTR ? RECEIPT_EINTR : ERRORS]++;
            }
        }
    }
    errno = saved_errno;
    return result;
}
DYLD_INTERPOSE(observed_kevent, kevent);

JNIEXPORT jint JNICALL Java_KeventReach_abi(JNIEnv *env, jclass cls) {
    (void)env; (void)cls; return 1;
}
JNIEXPORT void JNICALL Java_KeventReach_start0(JNIEnv *env, jclass cls, jint fd) {
    (void)env; (void)cls;
    enabled = 0; memset(counts, 0, sizeof(counts)); target = fd; enabled = 1;
}
JNIEXPORT jlongArray JNICALL Java_KeventReach_snapshot0(JNIEnv *env, jclass cls) {
    (void)cls; enabled = 0;
    jlongArray result = (*env)->NewLongArray(env, 16);
    if (result != NULL) (*env)->SetLongArrayRegion(env, result, 0, 16, counts);
    return result;
}
