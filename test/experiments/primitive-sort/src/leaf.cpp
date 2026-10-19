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

#include <cstdint>
#include <cstdlib>
#include <dlfcn.h>
#include <cstdio>
#include <atomic>
using Sort=void(*)(void*,int,int32_t,int32_t);
using Part=void(*)(void*,int,int32_t,int32_t,int32_t*,int32_t,int32_t);
static Sort original2,original5;
static Part partition2,partition5;
static int backend;
static bool count_calls;
static std::atomic<uint64_t> large_calls{0};
static std::atomic<uint64_t> calls_4k{0},calls_64k{0};
extern "C" int primitive_sort(void*,size_t,int,int) noexcept;
__attribute__((constructor)) static void init() {
    const char* path=std::getenv("BASE_SIMDSORT");if(!path) return;
    void* lib=dlopen(path,RTLD_NOW|RTLD_LOCAL);if(!lib) std::abort();
    original2=(Sort)dlsym(lib,"avx2_sort");original5=(Sort)dlsym(lib,"avx512_sort");
    partition2=(Part)dlsym(lib,"avx2_partition");partition5=(Part)dlsym(lib,"avx512_partition");
    backend=std::atoi(std::getenv("PRIMITIVE_BACKEND")?std::getenv("PRIMITIVE_BACKEND"):"1");
    count_calls=std::getenv("PRIMITIVE_COUNT")!=nullptr;
}
__attribute__((destructor)) static void report() {if(count_calls)fprintf(stderr,"C2 large leaf calls=%llu calls_4096=%llu calls_65536=%llu backend=%d\n",(unsigned long long)large_calls.load(),(unsigned long long)calls_4k.load(),(unsigned long long)calls_64k.load(),backend);}
extern "C" void avx2_sort(void* a,int type,int32_t lo,int32_t hi) {
    if((type==10||type==11)&&hi-lo>=4096) {
        if(count_calls)large_calls.fetch_add(1,std::memory_order_relaxed);
        if(count_calls&&hi-lo==4096)calls_4k.fetch_add(1,std::memory_order_relaxed);
        if(count_calls&&hi-lo==65536)calls_64k.fetch_add(1,std::memory_order_relaxed);
        if(hi-lo>65536) std::abort(); // Never accidentally extend the raw leaf scope.
        int width=type==10?4:8;
        if(!primitive_sort(static_cast<char*>(a)+size_t(lo)*width,hi-lo,width,backend)) std::abort();
    } else original2(a,type,lo,hi);
}
extern "C" void avx512_sort(void* a,int type,int32_t lo,int32_t hi) {
    if((type==10||type==11)&&hi-lo>=4096) avx2_sort(a,type,lo,hi);
    else original5(a,type,lo,hi);
}
extern "C" void avx2_partition(void* a,int t,int32_t l,int32_t h,int32_t* p,int32_t x,int32_t y) {partition2(a,t,l,h,p,x,y);}
extern "C" void avx512_partition(void* a,int t,int32_t l,int32_t h,int32_t* p,int32_t x,int32_t y) {partition5(a,t,l,h,p,x,y);}
