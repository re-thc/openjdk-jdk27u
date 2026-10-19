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

#include <algorithm>
#include <cstdint>
#include <memory>
#include <new>
#include <cstdlib>
#include <jni.h>
#include "hwy/contrib/sort/vqsort.h"
#include "hwy/targets.h"
#include "ips2ra.hpp"
#include "pdqsort.h"
extern "C" void rust_i32(int32_t*,size_t);
extern "C" void rust_i64(int64_t*,size_t);
extern "C" void rust_host_i32(int32_t*,size_t);
extern "C" void rust_host_i64(int64_t*,size_t);
extern "C" void xss2_i32(int32_t*,size_t);
extern "C" void xss2_i64(int64_t*,size_t);
extern "C" void xss5_i32(int32_t*,size_t);
extern "C" void xss5_i64(int64_t*,size_t);
template<class T> struct SignedKey {
    auto operator()(T x) const { using U=std::make_unsigned_t<T>; return U(x) ^ (U(1)<<(sizeof(T)*8-1)); }
};
template<class T> void perform(T* p,size_t n,int algo) {
    switch(algo) {
    case 1: hwy::VQSort(p,n,hwy::SortAscending()); break;
    case 2: ips2ra::sort(p,p+n,SignedKey<T>{}); break;
    case 3: { thread_local auto context=ips2ra::make_sorter<T*>(SignedKey<T>{}); context(p,p+n); break; }
    case 4: if constexpr(sizeof(T)==4) rust_i32(p,n); else rust_i64(p,n); break;
    case 9: if constexpr(sizeof(T)==4) rust_host_i32(p,n); else rust_host_i64(p,n); break;
    case 5: if constexpr(sizeof(T)==4) xss2_i32(p,n); else xss2_i64(p,n); break;
    case 6: if constexpr(sizeof(T)==4) xss5_i32(p,n); else xss5_i64(p,n); break;
    case 7: std::sort(p,p+n); break;
    case 8: pdqsort(p,p+n); break;
    default: std::abort();
    }
}
// FFM critical boundary: benchmark only, restricted by Java caller to <= 64K.
extern "C" int primitive_sort(void* p,size_t n,int width,int algo) noexcept {
    try { if(width==4) perform(static_cast<int32_t*>(p),n,algo); else perform(static_cast<int64_t*>(p),n,algo); return 1; }
    catch(...) { return 0; }
}
extern "C" JNIEXPORT jboolean JNICALL Java_BackendBench_sortCopy(JNIEnv* e,jclass,jobject a,jint lo,jint n,jint width,jint algo) {
    // Ordinary JNI transition, no pinning. GC can run during the native sort.
    std::unique_ptr<void,decltype(&std::free)> buf(std::malloc(size_t(n)*width+8), &std::free);
    if(!buf) return false;
    for(int offset=0;offset<n;offset+=16384) {
        int count=std::min(16384,n-offset);
        if(width==4) e->GetIntArrayRegion(static_cast<jintArray>(a),lo+offset,count,static_cast<jint*>(buf.get())+offset);
        else e->GetLongArrayRegion(static_cast<jlongArray>(a),lo+offset,count,static_cast<jlong*>(buf.get())+offset);
        if(e->ExceptionCheck()) return false;
    }
    if(e->ExceptionCheck()) return false;
    if(!primitive_sort(buf.get(),n,width,algo)) return false;
    for(int offset=0;offset<n;offset+=16384) {
        int count=std::min(16384,n-offset);
        if(width==4) e->SetIntArrayRegion(static_cast<jintArray>(a),lo+offset,count,static_cast<jint*>(buf.get())+offset);
        else e->SetLongArrayRegion(static_cast<jlongArray>(a),lo+offset,count,static_cast<jlong*>(buf.get())+offset);
        if(e->ExceptionCheck()) return false;
    }
    return !e->ExceptionCheck();
}
extern "C" const char* primitive_target() { return hwy::TargetName(hwy::SupportedTargets() & -hwy::SupportedTargets()); }
extern "C" JNIEXPORT jboolean JNICALL Java_java_util_DualPivotQuicksort_sortCopy(JNIEnv* e,jclass c,jobject a,jint lo,jint n,jint w,jint algo) {
    return Java_BackendBench_sortCopy(e,c,a,lo,n,w,algo);
}
