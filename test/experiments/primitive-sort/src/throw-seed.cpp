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
#include <sys/random.h>
#include <dlfcn.h>
#include <new>
#include <atomic>
#include <cstdio>
#include <cstring>
#include <execinfo.h>
#include <signal.h>
#include <unistd.h>
static std::atomic<unsigned long> failures{0};
static void on_abort(int){void* frames[48];int n=backtrace(frames,48);backtrace_symbols_fd(frames,n,2);_exit(134);}
__attribute__((constructor)) static void setup(){signal(SIGABRT,on_abort);}
extern "C" ssize_t getrandom(void* p,size_t n,unsigned int flags) {
    Dl_info info;
    if(dladdr(__builtin_return_address(0),&info)&&info.dli_fname&&std::strstr(info.dli_fname,"libprimitivesort.so")){
        std::fprintf(stderr,"Throw from product getrandom caller offset=%p\n",(void*)((uintptr_t)__builtin_return_address(0)-(uintptr_t)info.dli_fbase));
        failures.fetch_add(1);throw std::bad_alloc();
    }
    using Fn=ssize_t(*)(void*,size_t,unsigned int);
    static Fn real=(Fn)dlsym(RTLD_NEXT,"getrandom");
    return real(p,n,flags);
}
__attribute__((destructor)) static void report(){std::fprintf(stderr,"Injected native C++ seed failures: %lu\n",failures.load());}
