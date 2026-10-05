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

#include "simdutf.h"
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>
using Clock = std::chrono::steady_clock;
static volatile size_t checksum = 0;
static size_t encode(const std::vector<char>& a, const std::vector<char16_t>& u,
                     std::vector<char>& out, bool direct, size_t offset) {
  if (!a.empty()) return direct ? simdutf::convert_latin1_to_utf8(a.data(), a.size(), out.data()+offset)
                               : simdutf::convert_latin1_to_utf8_safe(a.data(), a.size(), out.data()+offset, a.size()*2);
  if (!simdutf::validate_utf16(u.data(), u.size())) return 0;
  return direct ? simdutf::convert_utf16_to_utf8(u.data(), u.size(), out.data()+offset)
                : simdutf::convert_utf16_to_utf8_safe(u.data(), u.size(), out.data()+offset, u.size()*3);
}
static double sample(const std::vector<char>& a, const std::vector<char16_t>& u,
                     std::vector<char>& out, bool direct, double duration, size_t offset) {
  auto start=Clock::now(); uint64_t calls=0; double elapsed;
  do {
    for (int i=0;i<100;i++) checksum = encode(a,u,out,direct,offset);
    calls+=100;
    elapsed=std::chrono::duration<double>(Clock::now()-start).count();
  } while(elapsed<duration);
  return elapsed*1e9/calls;
}
int main() {
  std::printf("# implementation=%.*s; direct and bounded APIs at worst-case capacity; UTF16 includes prevalidation\n",int(simdutf::get_active_implementation()->name().size()),simdutf::get_active_implementation()->name().data());
  std::puts("operation,size,output_mod64,pair,bounded_ns,direct_ns,speedup");
  for (const char* pattern : {"latin1_ascii","latin1_accent","utf16_bmp","utf16_supplementary"}) {
    for (size_t n : {size_t(32),size_t(128),size_t(65536)}) {
      bool latin = std::strncmp(pattern,"latin1_",7)==0;
      std::vector<char> a(latin?n:0,char(std::strcmp(pattern,"latin1_ascii")==0 ? 'a' : 0xe9));
      std::vector<char16_t> u(latin?0:n,char16_t(0x6f22));
      if (!latin && std::strcmp(pattern,"utf16_supplementary")==0) for(size_t i=0;i<n;i+=2){u[i]=0xd83d;u[i+1]=0xde03;}
      std::vector<char> old(n*3+96,char(0x55)),next=old;
      for(size_t offset : {size_t(0),size_t(16),size_t(32),size_t(48)}) {
      std::fill(old.begin(),old.end(),char(0x55));std::fill(next.begin(),next.end(),char(0x55));
      size_t x=encode(a,u,old,false,offset),y=encode(a,u,next,true,offset);
      if(x==0 || x!=y || old!=next) std::abort();
      for(size_t i=0;i<old.size();i++) if((i<offset || i>=offset+n*(latin?2:3)) && (old[i]!=0x55 || next[i]!=0x55))std::abort();
      sample(a,u,old,false,0.05,offset);sample(a,u,old,true,0.05,offset);
      for(int k=0;k<5;k++) {
        double b,d;
        if(k%2==0){b=sample(a,u,old,false,0.1,offset);d=sample(a,u,old,true,0.1,offset);}
        else{d=sample(a,u,old,true,0.1,offset);b=sample(a,u,old,false,0.1,offset);}
        std::printf("%s,%zu,%zu,%d,%.3f,%.3f,%.4f\n",pattern,n,reinterpret_cast<uintptr_t>(old.data()+offset)%64,k,b,d,b/d);
      }
    }
  }
  }
  char16_t input[64]; std::fill(input,input+64,u'\u6f22');
  char output[65];std::fill(output,output+65,0x55);
  auto r=simdutf::convert_utf16_to_utf8_safe_with_details(input,64,output,64);
  if(r.error!=simdutf::OUTPUT_BUFFER_TOO_SMALL || r.input_count==64 || output[64]!=0x55)std::abort();
  std::fill(input,input+64,u'\u00e9');
  r=simdutf::convert_utf16_to_utf8_safe_with_details(input,64,output,64);
  if(r.error!=simdutf::OUTPUT_BUFFER_TOO_SMALL || r.input_count==64 || output[64]!=0x55)std::abort();
  std::puts("# output equality, canaries and detailed partial-consumption checks passed");
}
