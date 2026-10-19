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
#include <link.h>
#include <cstdint>
#include <jni.h>
#include "hwy/targets.h"
static uintptr_t base(JNIEnv* e,jstring path) {
    const char* name=e->GetStringUTFChars(path,nullptr);void* handle=dlopen(name,RTLD_NOW|RTLD_LOCAL);e->ReleaseStringUTFChars(path,name);
    if(!handle)return 0;struct link_map* map=nullptr;if(dlinfo(handle,RTLD_DI_LINKMAP,&map))return 0;return map->l_addr;
}
extern "C" JNIEXPORT jlongArray JNICALL Java_NativeISA_probe(JNIEnv* e,jclass,jstring path,jlong getter,jlong table32,jlong table64) {
    uintptr_t load=base(e,path);if(!load)return nullptr;
    using Get=hwy::ChosenTarget&(*)();auto& chosen=((Get)(load+getter))();
    size_t index=chosen.GetIndex(HWY_CHOSEN_TARGET_MASK_TARGETS);
    jlong result[3]={(jlong)index,(jlong)(table32?((uintptr_t*)(load+table32))[index]-load:0),(jlong)(((uintptr_t*)(load+table64))[index]-load)};
    jlongArray a=e->NewLongArray(3);e->SetLongArrayRegion(a,0,3,result);return a;
}
extern "C" JNIEXPORT void JNICALL Java_NativeISA_force(JNIEnv* e,jclass,jstring path,jlong setter) {
    uintptr_t load=base(e,path);if(load){using Set=void(*)(int64_t);((Set)(load+setter))(HWY_AVX2);}
}
