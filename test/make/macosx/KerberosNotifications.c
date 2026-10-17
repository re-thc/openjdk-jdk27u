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
 *
 */

// Interpose only the production observer's dynamic-store session. This avoids
// privileged writes/notifications to system Kerberos keys. Notification delivery
// still uses real dispatch queues or CFRunLoop sources and the image's callback.
#include <CoreFoundation/CoreFoundation.h>
#include <SystemConfiguration/SystemConfiguration.h>
#include <dispatch/dispatch.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdatomic.h>
#include <stdlib.h>
#include <jni.h>

static SCDynamicStoreRef observer;
static SCDynamicStoreCallBack observer_callback;
static void *observer_info;
static CFArrayRef observer_keys;
static dispatch_queue_t observer_queue;
static CFRunLoopSourceRef observer_source;
static pthread_mutex_t pending_lock = PTHREAD_MUTEX_INITIALIZER;

typedef struct {
    atomic_int references;
    CFArrayRef keys;
    dispatch_semaphore_t done;
    int on_main_thread;
} Event;
static Event *pending_event;

static void release_event(Event *event) {
    if (atomic_fetch_sub(&event->references, 1) == 1) {
        CFRelease(event->keys);
        dispatch_release(event->done);
        free(event);
    }
}

static void deliver(void *context) {
    Event *event = context;
    event->on_main_thread = pthread_main_np();
    observer_callback(observer, event->keys, observer_info);
    dispatch_semaphore_signal(event->done);
    release_event(event);
}

static void perform_source(void *unused) {
    (void)unused;
    pthread_mutex_lock(&pending_lock);
    Event *event = pending_event;
    pending_event = NULL;
    pthread_mutex_unlock(&pending_lock);
    if (event != NULL) deliver(event);
}

static SCDynamicStoreRef create_store(CFAllocatorRef allocator, CFStringRef name,
        SCDynamicStoreCallBack callback, SCDynamicStoreContext *context) {
    SCDynamicStoreRef store = SCDynamicStoreCreate(allocator, name, callback, context);
    if (store != NULL && callback != NULL && CFEqual(name, CFSTR("java"))) {
        observer = (SCDynamicStoreRef)CFRetain(store);
        observer_callback = callback;
        observer_info = context == NULL ? NULL : context->info;
    }
    return store;
}

static Boolean set_keys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns) {
    if (store != observer) return SCDynamicStoreSetNotificationKeys(store, keys, patterns);
    if (keys == NULL || observer_keys != NULL) return false;
    observer_keys = CFArrayCreateCopy(NULL, keys);
    return observer_keys != NULL;
}

static Boolean set_queue(SCDynamicStoreRef store, dispatch_queue_t queue) {
    if (store != observer) return SCDynamicStoreSetDispatchQueue(store, queue);
    if (observer_queue != NULL) dispatch_release(observer_queue);
    observer_queue = queue;
    if (queue != NULL) dispatch_retain(queue);
    return true;
}

static CFRunLoopSourceRef create_source(CFAllocatorRef allocator,
        SCDynamicStoreRef store, CFIndex order) {
    if (store != observer) return SCDynamicStoreCreateRunLoopSource(allocator, store, order);
    CFRunLoopSourceContext context = { 0 };
    context.perform = perform_source;
    observer_source = CFRunLoopSourceCreate(allocator, order, &context);
    return observer_source == NULL ? NULL : (CFRunLoopSourceRef)CFRetain(observer_source);
}

// The SDK does not ship dyld's interposing convenience header. Each entry in
// this Mach-O section is a replacement/original pointer pair. "used" retains
// the records and the replacement functions even with optimization/dead-strip.
static const struct {
    const void *replacement;
    const void *original;
} interpositions[] __attribute__((used, section("__DATA,__interpose,interposing"))) = {
    { (const void *)&create_store, (const void *)&SCDynamicStoreCreate },
    { (const void *)&set_keys, (const void *)&SCDynamicStoreSetNotificationKeys },
    { (const void *)&set_queue, (const void *)&SCDynamicStoreSetDispatchQueue },
    { (const void *)&create_source, (const void *)&SCDynamicStoreCreateRunLoopSource }
};

JNIEXPORT jint JNICALL Java_KerberosNotifications_notifyChange(JNIEnv *env,
        jclass type, jstring name) {
    (void)type;
    if (observer == NULL || observer_keys == NULL ||
        (observer_queue == NULL && observer_source == NULL)) return 0;
    CFRange range = CFRangeMake(0, CFArrayGetCount(observer_keys));
    if (!CFArrayContainsValue(observer_keys, range, CFSTR("Kerberos-Default-Realms")) ||
        !CFArrayContainsValue(observer_keys, range, CFSTR("Kerberos-Domain-Realm-Mappings"))) return 0;
    const char *text = (*env)->GetStringUTFChars(env, name, NULL);
    if (text == NULL) return 0;
    CFStringRef key = CFStringCreateWithCString(NULL, text, kCFStringEncodingUTF8);
    (*env)->ReleaseStringUTFChars(env, name, text);
    if (key == NULL) return 0;
    Event *event = calloc(1, sizeof(*event));
    if (event == NULL) { CFRelease(key); return 0; }
    atomic_init(&event->references, 2); // the caller and the delivery own a reference
    event->keys = CFArrayCreate(NULL, (const void **)&key, 1, &kCFTypeArrayCallBacks);
    CFRelease(key);
    event->done = dispatch_semaphore_create(0);
    if (event->keys == NULL || event->done == NULL) {
        if (event->keys != NULL) CFRelease(event->keys);
        if (event->done != NULL) dispatch_release(event->done);
        free(event);
        return 0;
    }
    if (observer_queue != NULL) {
        dispatch_async_f(observer_queue, event, deliver);
    } else {
        pthread_mutex_lock(&pending_lock);
        pending_event = event;
        pthread_mutex_unlock(&pending_lock);
        CFRunLoopSourceSignal(observer_source);
        CFRunLoopWakeUp(CFRunLoopGetMain());
    }
    long status = dispatch_semaphore_wait(event->done,
            dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC));
    int result = status != 0 ? 0 : (event->on_main_thread ? 1 : 2);
    // A timed-out delivery owns its reference until it can run or the child
    // exits. It must not dereference a freed event if the queue was delayed.
    release_event(event);
    return result;
}
