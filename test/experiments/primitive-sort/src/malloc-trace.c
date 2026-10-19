/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#define _GNU_SOURCE
#include <dlfcn.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdatomic.h>
#include <jni.h>
extern void* __libc_malloc(size_t);
extern void __libc_free(void*);
static atomic_flag lock=ATOMIC_FLAG_INIT;
static void* pointers[256];static size_t sizes[256];
static size_t calls,total,live,peak;
static void acquire(void){while(atomic_flag_test_and_set(&lock)){};}
static void release(void){atomic_flag_clear(&lock);}
void* malloc(size_t size) {
    void* p=__libc_malloc(size);Dl_info info;
    if(p&&dladdr(__builtin_return_address(0),&info)&&info.dli_fname&&strstr(info.dli_fname,"libprimitivesort.so")) {
        acquire();calls++;total+=size;live+=size;if(live>peak)peak=live;
        for(int i=0;i<256;i++)if(!pointers[i]){pointers[i]=p;sizes[i]=size;break;}release();
    }
    return p;
}
void free(void* p) {
    acquire();for(int i=0;i<256;i++)if(pointers[i]==p&&p){live-=sizes[i];pointers[i]=NULL;break;}release();
    __libc_free(p);
}
__attribute__((destructor)) static void report(void){fprintf(stderr,"Product malloc calls=%zu requested_total=%zu peak_live=%zu live_at_exit=%zu\n",calls,total,peak,live);}
JNIEXPORT jlongArray JNICALL Java_NativeMemory_stats(JNIEnv* env,jclass ignored) {
    acquire();jlong values[4]={(jlong)calls,(jlong)total,(jlong)live,(jlong)peak};release();
    jlongArray result=(*env)->NewLongArray(env,4);(*env)->SetLongArrayRegion(env,result,0,4,values);return result;
}
