#include "simdutf.h"
#include <algorithm>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#include <cstdint>

static const simdutf::implementation* select_backend() {
  const auto& all = simdutf::get_available_implementations();
  const simdutf::implementation* result = nullptr;
#if defined(__x86_64__)
  __builtin_cpu_init();
  bool sse = __builtin_cpu_supports("sse3") && __builtin_cpu_supports("ssse3") &&
      __builtin_cpu_supports("sse4.1") && __builtin_cpu_supports("sse4.2");
  bool avx = sse && __builtin_cpu_supports("avx") && __builtin_cpu_supports("avx2");
  if (avx && __builtin_cpu_supports("avx512f") && __builtin_cpu_supports("avx512dq") &&
      __builtin_cpu_supports("avx512cd") && __builtin_cpu_supports("avx512bw") &&
      __builtin_cpu_supports("avx512vl") && __builtin_cpu_supports("avx512vbmi") &&
      __builtin_cpu_supports("avx512vbmi2") && __builtin_cpu_supports("avx512vpopcntdq") &&
      __builtin_cpu_supports("bmi") && __builtin_cpu_supports("bmi2") &&
      __builtin_cpu_supports("pclmul") && __builtin_cpu_supports("lzcnt") &&
      __builtin_cpu_supports("popcnt")) result = all["icelake"];
  if (result == nullptr && avx && __builtin_cpu_supports("bmi") &&
      __builtin_cpu_supports("bmi2") && __builtin_cpu_supports("lzcnt") &&
      __builtin_cpu_supports("popcnt")) result = all["haswell"];
  if (result == nullptr && sse && __builtin_cpu_supports("popcnt")) result = all["westmere"];
#elif defined(__aarch64__)
  result = all["arm64"];
#endif
  if (result == nullptr || !result->supported_by_runtime_system()) result = all["fallback"];
  if (result == nullptr || !result->supported_by_runtime_system()) std::abort();
  return result;
}

static int classic(const char* input, int len, char16_t* output, int capacity) {
#ifdef __aarch64__
  constexpr size_t block_size = 4096;
#else
  constexpr size_t block_size = 1024;
#endif
  char utf8[block_size];
  char16_t utf16[block_size];
  int written = 0;
  for (int off = 0; off < len;) {
    size_t size = std::min(block_size, size_t(len - off));
    std::memcpy(utf8, input + off, size);
    if (off + size < size_t(len)) size = simdutf::trim_partial_utf8(utf8, size);
    if (size == 0) return -off - 1;
    char16_t* target = utf16;
#ifdef __aarch64__
    auto validation = simdutf::validate_utf8_with_errors(utf8, size);
    if (validation.error != simdutf::SUCCESS) return -int(size_t(off) + validation.count) - 1;
    if (size <= size_t(capacity - written)) target = output + written;
    size_t count = simdutf::convert_valid_utf8_to_utf16(utf8, size, target);
#else
    size_t count = simdutf::convert_utf8_to_utf16(utf8, size, target);
    if (count == 0) {
      auto validation = simdutf::validate_utf8_with_errors(utf8, size);
      return -int(size_t(off) + validation.count) - 1;
    }
#endif
    if (count == 0 || count > size_t(capacity - written)) return -1;
    if (target != output + written) std::memcpy(output + written, target, count * sizeof(char16_t));
    written += int(count);
    off += int(size);
  }
  return written;
}

#if HAS930
static int counted(const char* input, int len, char16_t* output, int capacity) {
#ifdef __aarch64__
  constexpr size_t block_size = 4096;
#else
  constexpr size_t block_size = 1024;
#endif
  char utf8[block_size];
  int written = 0;
  for (int off = 0; off < len;) {
    size_t size = std::min(block_size, size_t(len - off));
    std::memcpy(utf8, input + off, size);
    if (off + size < size_t(len)) size = simdutf::trim_partial_utf8(utf8, size);
    if (size == 0) return -off - 1;
    auto validation = simdutf::validate_utf8_with_counts(utf8, size);
    if (validation.error != simdutf::SUCCESS) return -int(size_t(off) + validation.input_count) - 1;
    size_t count = validation.utf16_length();
    if (count == 0 || count > size_t(capacity - written)) return -1;
    size_t converted = simdutf::convert_valid_utf8_to_utf16(utf8, size, output + written);
    if (converted != count) std::abort();
    written += int(count);
    off += int(size);
  }
  return written;
}
#endif

struct Text {
  std::string utf8;
  std::vector<char16_t> utf16;
};
static Text text(size_t size, int kind) {
  Text t;
  for (size_t i = 0; i < size;) {
    if (kind == 3 && i + 1 < size) {
      t.utf8 += "\xf0\x9f\x98\x83";
      t.utf16.push_back(0xd83d); t.utf16.push_back(0xde03); i += 2;
    } else if (kind == 2 || (kind == 4 && i % 7 == 0)) {
      t.utf8 += "\xe6\xbc\xa2"; t.utf16.push_back(0x6f22); ++i;
    } else if (kind == 1) {
      t.utf8 += "\xc3\xa9"; t.utf16.push_back(0xe9); ++i;
    } else {
      t.utf8 += 'a'; t.utf16.push_back('a'); ++i;
    }
  }
  return t;
}

static uint64_t semantic = 1469598103934665603ULL;
static void digest(uint64_t value) { semantic = (semantic ^ value) * 1099511628211ULL; }
static void check(const std::string& input, int capacity) {
  std::vector<char16_t> a(size_t(capacity) + 8, 0x5555);
  int result = classic(input.data(), int(input.size()), a.data(), capacity);
  for (size_t i = capacity; i < a.size(); ++i) if (a[i] != 0x5555) std::abort();
  digest(uint32_t(result));
  for (char16_t v : a) digest(v);
#if HAS930
  std::vector<char16_t> b(size_t(capacity) + 8, 0x5555);
  int alternative = counted(input.data(), int(input.size()), b.data(), capacity);
  if (result != alternative || a != b) {
    std::fprintf(stderr, "COUNT_MISMATCH bytes=%zu capacity=%d classic=%d counted=%d\n",
                 input.size(), capacity, result, alternative);
    std::abort();
  }
#endif
}
static void correctness() {
  for (size_t size : {1,2,15,16,17,31,32,33,255,256,257,511,512,513,1023,1024,1025,4095,4096,4097}) {
    for (int kind = 0; kind < 5; ++kind) {
      Text t = text(size, kind);
      for (int capacity : {0,1,int(size)-1,int(size),int(t.utf8.size())}) check(t.utf8, capacity);
    }
  }
  for (const std::string& bad : {
        std::string("\x80",1), std::string("\xc0\xaf",2), std::string("\xe0\x80\x80",3),
        std::string("\xed\xa0\x80",3), std::string("\xf4\x90\x80\x80",4),
        std::string("\xe6\xbc",2), std::string("\xf0\x9f\x98",3),
        std::string("\xc3\x41",2), std::string("\xe6\x41\x80",3)}) {
    for (size_t prefix : {0,1,31,63,127,1023,1024,4095,4096}) {
      std::string input(prefix,'a'); input += bad; input += std::string(17,'z');
      for (int capacity : {0,1,int(input.size()/3),int(input.size())}) check(input,capacity);
    }
  }
  std::printf("NATIVE_SEMANTICS %llu\n", (unsigned long long)semantic);
#if HAS930
  char16_t output[3];
  size_t n = simdutf::convert_utf8_to_utf16_with_replacement("\xed\xa0\x80",3,output);
  std::printf("REPLACEMENT_POLICY simdutf930 %zu",n);
  for (size_t i=0;i<n;++i) std::printf(" %04x",unsigned(output[i]));
  std::printf("\n");
#endif
}

static volatile uint64_t sink;
template<typename Function>
static void measure(const char* method, const char* kind, size_t size, Function function) {
  size_t iterations=1;
  double elapsed=0;
  uint64_t sum=0;
  auto batch=[&](size_t count) {
    auto begin=std::chrono::steady_clock::now();
    for (size_t i=0;i<count;++i) {
      sum += function();
      asm volatile("" ::: "memory");
    }
    return std::chrono::duration<double,std::nano>(std::chrono::steady_clock::now()-begin).count();
  };
  do { elapsed=batch(iterations); if (elapsed<20000000) iterations*=2; } while (elapsed<20000000);
  iterations*=4;
  elapsed=batch(iterations);
  sink=sum;
  std::printf("NATIVE_RESULT {\"method\":\"%s\",\"kind\":\"%s\",\"size\":%zu,\"ns\":%.9f,\"iterations\":%zu}\n",
              method,kind,size,elapsed/iterations,iterations);
  std::fflush(stdout);
}
int main() {
  auto impl=select_backend();
  simdutf::get_active_implementation()=impl;
  std::printf("NATIVE_META %s %s\n",SIMDUTF_VERSION,std::string(impl->name()).c_str());
  correctness();
  for (size_t size : {31,32,33,63,64,65,127,128,129,255,256,258,4095,4096}) {
    for (int kind : {0,2,3,4}) {
      Text t=text(size,kind);
      const char* label=kind==0?"ascii":kind==2?"bmp":kind==3?"supplementary":"mixed";
      std::vector<char16_t> out(t.utf8.size());
      measure("utf8_tight_classic",label,size,[&] {
        return classic(t.utf8.data(),int(t.utf8.size()),out.data(),int(t.utf16.size()));
      });
#if HAS930
      measure("utf8_tight_counted",label,size,[&] {
        return counted(t.utf8.data(),int(t.utf8.size()),out.data(),int(t.utf16.size()));
      });
#endif
    }
    Text t=text(size,2);
    std::vector<char32_t> out32(size);
    measure("utf16_to_utf32","bmp",size,[&] {
      return simdutf::convert_utf16_to_utf32(t.utf16.data(),t.utf16.size(),out32.data());
    });
    measure("utf16_count","bmp",size,[&] { return simdutf::count_utf16(t.utf16.data(),t.utf16.size()); });
    measure("utf8_length","bmp",size,[&] { return simdutf::utf8_length_from_utf16(t.utf16.data(),t.utf16.size()); });
    size_t bytes=size-size%3;
    std::string binary(bytes,'x'),encoded(bytes/3*4,'\0');
    measure("base64_encode_blocks","binary",bytes,[&] {
      return simdutf::binary_to_base64(binary.data(),binary.size(),encoded.data(),simdutf::base64_default);
    });
  }
  std::printf("NATIVE_COMPLETE\n");
}
