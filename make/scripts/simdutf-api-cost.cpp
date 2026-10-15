#include "simdutf.h"
#include <algorithm>
#include <chrono>
#include <cstring>
#include <iostream>
#include <vector>
using convert_fn = int (*)(const char*, int, char16_t*, int);
static volatile int sink;
static int staged(const char* input, int len, char16_t* output, int capacity) {
  char utf8[1024]; char16_t utf16[1024]; int written=0;
  for (int off=0;off<len;) {
    size_t size=std::min(size_t(1024),size_t(len-off));
    memcpy(utf8,input+off,size);
    if (off+size<size_t(len)) size=simdutf::trim_partial_utf8(utf8,size);
    if(size==0) return -off-1;
    size_t count=simdutf::convert_utf8_to_utf16(utf8,size,utf16);
    if(count==0) { auto error=simdutf::validate_utf8_with_errors(utf8,size); return -int(off+error.count)-1; }
    if(count>size_t(capacity-written)) return -1;
    memcpy(output+written,utf16,count*sizeof(char16_t));written+=count;off+=size;
  }
  return written;
}
static int current_tight(const char* p,int n,char16_t* d,int cap) {
  auto error=simdutf::validate_utf8_with_errors(p,n);
  if(error.error!=simdutf::SUCCESS)return -int(error.count)-1;
  if(simdutf::utf16_length_from_utf8(p,n)>size_t(cap))return -1;
  return staged(p,n,d,cap);
}
static int current_roomy(const char* p,int n,char16_t* d,int cap) {
  auto error=simdutf::validate_utf8_with_errors(p,n);
  if(error.error!=simdutf::SUCCESS)return -int(error.count)-1;
  auto result=simdutf::convert_utf8_to_utf16_with_errors(p,n,d);
  return result.error==simdutf::SUCCESS?int(result.count):-1;
}
static int normal_roomy(const char* p,int n,char16_t* d,int cap) {
  auto error=simdutf::validate_utf8_with_errors(p,n);
  if(error.error!=simdutf::SUCCESS)return -int(error.count)-1;
  size_t result=simdutf::convert_utf8_to_utf16(p,n,d);
  return result?int(result):-1;
}
int main() {
  const auto& list=simdutf::get_available_implementations();
#if defined(__aarch64__)
  simdutf::get_active_implementation()=list["arm64"];
#else
  const char* impl="westmere";
  if(__builtin_cpu_supports("avx2")&&__builtin_cpu_supports("bmi")&&__builtin_cpu_supports("bmi2")&&__builtin_cpu_supports("lzcnt")&&__builtin_cpu_supports("popcnt"))impl="haswell";
  if(__builtin_cpu_supports("avx512f")&&__builtin_cpu_supports("avx512dq")&&__builtin_cpu_supports("avx512cd")&&__builtin_cpu_supports("avx512bw")&&__builtin_cpu_supports("avx512vl")&&__builtin_cpu_supports("avx512vbmi")&&__builtin_cpu_supports("avx512vbmi2")&&__builtin_cpu_supports("avx512vpopcntdq")&&__builtin_cpu_supports("pclmul")&&__builtin_cpu_supports("bmi")&&__builtin_cpu_supports("bmi2")&&__builtin_cpu_supports("lzcnt")&&__builtin_cpu_supports("popcnt"))impl="icelake";
  simdutf::get_active_implementation()=list[impl];
#endif
  std::cout<<"NATIVE_BACKEND "<<simdutf::get_active_implementation()->name()<<std::endl;
  const char* patterns[]={"a","\xc3\xa9","\xe6\xbc\xa2","\xf0\x9f\x98\x83"};
  const char* kinds[]={"ascii","latin1","bmp","supplementary"};
  for(int kind=0;kind<4;kind++)for(int units:{128,256,512,4096,8192,1048576}) {
    std::string input;for(int i=0;i<units;i++)input+=patterns[kind];
    std::vector<char16_t> reference(input.size()),output(input.size());
    int count=simdutf::convert_utf8_to_utf16(input.data(),input.size(),reference.data());
    const char* names[]={"current-tight","staged-tight","current-roomy","normal-roomy","staged-roomy"};
    convert_fn functions[]={current_tight,staged,current_roomy,normal_roomy,staged};
    for(int method=0;method<5;method++) {
      int capacity=method<2?count:int(input.size());
      int result=functions[method](input.data(),input.size(),output.data(),capacity);
      if(result!=count||!std::equal(reference.begin(),reference.begin()+count,output.begin()))return 2;
      int iterations=std::max(10,10000000/int(input.size()));
      std::vector<double> times;
      for(int sample=0;sample<7;sample++){
        auto start=std::chrono::steady_clock::now();
        for(int i=0;i<iterations;i++)sink=functions[method](input.data(),input.size(),output.data(),capacity);
        auto end=std::chrono::steady_clock::now();
        times.push_back(std::chrono::duration<double,std::nano>(end-start).count()/iterations);
      }
      std::sort(times.begin(),times.end());
      std::cout<<"NATIVE_RESULT {\"kind\":\""<<kinds[kind]<<"\",\"units\":"<<units<<",\"bytes\":"<<input.size()<<",\"method\":\""<<names[method]<<"\",\"ns\":"<<times[3]<<",\"min\":"<<times.front()<<",\"max\":"<<times.back()<<"}"<<std::endl;
    }
  }
}
