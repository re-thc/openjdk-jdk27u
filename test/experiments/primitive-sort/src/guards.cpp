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
#include <cstdio>
#include <cstdlib>
#include <new>
#include <limits>
#include <vector>
#include <sys/mman.h>
#include <unistd.h>
extern "C" int primitive_sort(void*,size_t,int,int) noexcept;
static thread_local bool count_alloc=false, fail_alloc=false;
static thread_local size_t alloc_bytes,alloc_calls;
void* operator new(size_t n) {if(fail_alloc)throw std::bad_alloc();if(count_alloc){alloc_bytes+=n;alloc_calls++;}if(void* p=malloc(n))return p;throw std::bad_alloc();}
void* operator new[](size_t n) {return ::operator new(n);}
void operator delete(void* p) noexcept{free(p);}
void operator delete[](void* p) noexcept{free(p);}
void operator delete(void* p,size_t) noexcept{free(p);}
void operator delete[](void* p,size_t) noexcept{free(p);}
uint64_t mix(uint64_t x) {x=(x^(x>>30))*0xbf58476d1ce4e5b9ull;x=(x^(x>>27))*0x94d049bb133111ebull;return x^(x>>31);}
template<class T> int run() {
  int count=0; size_t page=sysconf(_SC_PAGESIZE);
  std::vector<T> initial(65536);for(size_t i=0;i<initial.size();i++)initial[i]=(T)mix(i);
  for(int algo=1;algo<=9;algo++)for(int use=0;use<2;use++) {
    alloc_bytes=alloc_calls=0;count_alloc=true;
    if(!primitive_sort(initial.data(),initial.size(),sizeof(T),algo))abort();count_alloc=false;
    printf("initial alloc width=%zu algo=%d use=%d bytes=%zu calls=%zu\n",sizeof(T),algo,use,alloc_bytes,alloc_calls);
  }
  std::vector<size_t> sizes={0,1,2,3,7,8,15,16,17,31,32,33,43,44,45,63,64,65,127,128,129,255,256,257,1023,1024,1025,4095,4096,4097,16383,16384,16385,65535,65536,65537,1048576};
  for(size_t n:sizes)for(int edge=0;edge<2;edge++)for(int pattern=0;pattern<8;pattern++)for(int algo=1;algo<=9;algo++){
    size_t bytes=std::max(page,((n*sizeof(T)+page-1)/page)*page);
    char* mem=(char*)mmap(nullptr,bytes+2*page,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);if(mem==MAP_FAILED)abort();
    if(mprotect(mem+page,bytes,PROT_READ|PROT_WRITE))abort();
    T* p=(T*)(edge?mem+page+bytes-n*sizeof(T):mem+page);
    std::vector<T> expected(n);
    for(size_t i=0;i<n;i++){
      T v=(T)mix(i+2026);if(pattern==1)v=i%2?std::numeric_limits<T>::min():std::numeric_limits<T>::max();
      if(pattern==2)v=i%13-6;if(pattern==3)v=7;if(pattern==4)v=i-n/2;
      if(pattern==5)v=n/2-i;if(pattern==6)v=std::min(i,n-i);if(pattern==7)v=i<n/3?n-i:(T)mix(i);
      expected[i]=p[i]=v;
    }
    std::sort(expected.begin(),expected.end());
    if(!primitive_sort(p,n,sizeof(T),algo)||!std::equal(expected.begin(),expected.end(),p)){
      fprintf(stderr,"FAIL width=%zu n=%zu edge=%d pattern=%d algo=%d\n",sizeof(T),n,edge,pattern,algo);abort();
    }
    munmap(mem,bytes+2*page);count++;
  }
  std::vector<T> x(65536);for(size_t i=0;i<x.size();i++)x[i]=(T)mix(i);
  for(int algo=1;algo<=9;algo++){
    alloc_bytes=alloc_calls=0;count_alloc=true;
    if(!primitive_sort(x.data(),x.size(),sizeof(T),algo))abort();count_alloc=false;
    printf("alloc width=%zu algo=%d bytes=%zu calls=%zu\n",sizeof(T),algo,alloc_bytes,alloc_calls);
  }
  fail_alloc=true;int ok=primitive_sort(x.data(),x.size(),sizeof(T),2);fail_alloc=false;
  if(ok)abort();printf("failure containment width=%zu PASS\n",sizeof(T));
  return count;
}
int main(){int a=run<int32_t>(),b=run<int64_t>();printf("PASS %d guard-page sorts\n",a+b);}
