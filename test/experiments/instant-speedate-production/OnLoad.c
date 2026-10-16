/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
#include <jni.h>

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    JNIEnv *env;
    (void)reserved;
    if ((*vm)->GetEnv(vm, (void **)&env, JNI_VERSION_1_8) != JNI_OK) return JNI_ERR;
    jclass cls = (*env)->FindClass(env, "ProductionProbe");
    if (cls == NULL) return JNI_ERR;
    jmethodID callback = (*env)->GetStaticMethodID(env, cls, "onLoadCallback", "()V");
    if (callback == NULL) return JNI_ERR;
    (*env)->CallStaticVoidMethod(env, cls, callback);
    if ((*env)->ExceptionCheck(env)) return JNI_ERR;
    return JNI_VERSION_1_8;
}
