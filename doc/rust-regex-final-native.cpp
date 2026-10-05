/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

#include <chrono>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include <string>
using Compile = void* (*)(const unsigned char*, size_t);
using Search = unsigned char (*)(const void*, const unsigned char*, size_t);
using Free = void (*)(void*);
struct Adapter { Compile compile; Search search; Free free; };
int main() {
    Adapter adapters[2];
    int index = 0;
    for (const char* path : {"/tmp/regex-final-before.so", "/tmp/regex-final-after.so"}) {
        void* library = dlopen(path, RTLD_NOW | RTLD_LOCAL);
        if (!library) { std::fprintf(stderr, "%s\n", dlerror()); return 1; }
        adapters[index++] = {reinterpret_cast<Compile>(dlsym(library, "jdk_regex_compile")),
                            reinterpret_cast<Search>(dlsym(library, "jdk_regex_may_match")),
                            reinterpret_cast<Free>(dlsym(library, "jdk_regex_free"))};
    }
    std::puts("operation,pattern_or_bytes,pair,revision,ns_per_call");
    for (const char* pattern : {"error[0-9]+", "(?:error|warn)[0-9]+", "[0-9]{3}-[0-9]{2}-[0-9]{4}", "a.*b"}) {
        for (auto& adapter : adapters) {
            for (int i = 0; i < 100; i++) {
                void* handle = adapter.compile(reinterpret_cast<const unsigned char*>(pattern), std::strlen(pattern));
                if (!handle) return 2;
                adapter.free(handle);
            }
        }
        for (int pair = 0; pair < 12; pair++) for (int order = 0; order < 2; order++) {
            int revision = (pair + order) % 2;
            auto& adapter = adapters[revision];
            auto start = std::chrono::steady_clock::now();
            for (int i = 0; i < 500; i++) {
                void* handle = adapter.compile(reinterpret_cast<const unsigned char*>(pattern), std::strlen(pattern));
                if (!handle) return 3;
                adapter.free(handle);
            }
            double elapsed = std::chrono::duration<double, std::nano>(std::chrono::steady_clock::now() - start).count() / 500;
            std::printf("compile,%s,%d,%s,%.3f\n", pattern, pair, revision ? "after" : "before", elapsed);
        }
    }
    for (int length : {4096, 32768}) {
        std::string input(length, 'x');
        for (int i = 1; i < length; i += 2) input[i] = ' ';
        void* handles[2];
        const char* pattern = "error[0-9]+";
        for (int i = 0; i < 2; i++) {
            handles[i] = adapters[i].compile(reinterpret_cast<const unsigned char*>(pattern), std::strlen(pattern));
            if (!handles[i]) return 4;
            for (int warm = 0; warm < 20000; warm++)
                if (adapters[i].search(handles[i], reinterpret_cast<const unsigned char*>(input.data()), length)) return 5;
        }
        for (int pair = 0; pair < 12; pair++) for (int order = 0; order < 2; order++) {
            int revision = (pair + order) % 2;
            auto start = std::chrono::steady_clock::now();
            for (int i = 0; i < 100000; i++)
                if (adapters[revision].search(handles[revision], reinterpret_cast<const unsigned char*>(input.data()), length)) return 6;
            double elapsed = std::chrono::duration<double, std::nano>(std::chrono::steady_clock::now() - start).count() / 100000;
            std::printf("search,%d,%d,%s,%.3f\n", length, pair, revision ? "after" : "before", elapsed);
        }
        for (int i = 0; i < 2; i++) adapters[i].free(handles[i]);
    }
}
