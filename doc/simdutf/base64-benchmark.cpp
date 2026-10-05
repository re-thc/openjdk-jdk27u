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

// Standalone vendor/adapter comparison. This does not measure JVM transitions.
#include "simdutf.h"
#include "libbase64.h"
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <string>
#include <vector>

using Clock = std::chrono::steady_clock;
static volatile size_t checksum;

static bool valid(const char* src, size_t len, bool url) {
  unsigned invalid = 0;
  for (size_t i = 0; i < len; i++) {
    unsigned c = static_cast<unsigned char>(src[i]);
    invalid |= !((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') ||
                 (c >= '0' && c <= '9') || c == unsigned(url ? '-' : '+') ||
                 c == unsigned(url ? '_' : '/'));
  }
  return invalid == 0;
}

static size_t convert(bool aklomp, int op, const char* src,
                      size_t len, char* dst, size_t capacity) {
  const bool encode = op == 0 || op == 3;
  const bool url = op == 3 || op == 4;
  if (encode) {
    if (!aklomp) return simdutf::binary_to_base64(src, len, dst,
        url ? simdutf::base64_url : simdutf::base64_default);
    size_t n = 0;
    base64_encode(src, len, dst, &n, 0);
    if (url) {
      for (size_t i = 0; i < n; i++) {
        unsigned c = static_cast<unsigned char>(dst[i]);
        dst[i] = char(c + 2 * (c == '+') + 48 * (c == '/'));
      }
    }
    return n;
  }
  if (op != 1 && !valid(src, len, url)) return 0;
  if (!aklomp) {
    size_t n = capacity;
    auto r = simdutf::base64_to_binary_safe(src, len, dst, n,
        url ? simdutf::base64_url : simdutf::base64_default,
        simdutf::last_chunk_handling_options::strict);
    return r.error == simdutf::SUCCESS ? n : 0;
  }
  size_t n = 0;
  if (!url) return base64_decode(src, len, dst, &n, 0) == 1 ? n : 0;
  // No URL-safe API in aklomp. Bounded staging avoids allocating/copying an
  // entire Java input array or reserving a large leaf stack buffer.
  base64_state state;
  base64_stream_decode_init(&state, 0);
  for (size_t off = 0; off < len; off += 256) {
    char block[256];
    size_t count = std::min(size_t(256), len - off);
    for (size_t i = 0; i < count; i++) {
      unsigned c = static_cast<unsigned char>(src[off + i]);
      block[i] = char(c - 2 * (c == '-') - 48 * (c == '_'));
    }
    size_t written = 0;
    if (base64_stream_decode(&state, block, count, dst + n, &written) != 1) return 0;
    n += written;
  }
  return n;
}

static std::vector<char> oracle(const std::vector<char>& src, bool url) {
  const char* alphabet = url
      ? "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
      : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  std::vector<char> out(src.size() / 3 * 4);
  for (size_t i = 0, j = 0; i < src.size(); i += 3) {
    unsigned v = (unsigned(uint8_t(src[i])) << 16) |
                 (unsigned(uint8_t(src[i + 1])) << 8) | uint8_t(src[i + 2]);
    out[j++] = alphabet[v >> 18];
    out[j++] = alphabet[(v >> 12) & 63];
    out[j++] = alphabet[(v >> 6) & 63];
    out[j++] = alphabet[v & 63];
  }
  return out;
}

static double sample(bool aklomp, int op, const char* src, size_t len,
                     char* dst, size_t capacity, double duration) {
  auto start = Clock::now();
  uint64_t calls = 0;
  double elapsed;
  do {
    for (int i = 0; i < 100; i++) checksum = convert(aklomp, op, src, len, dst, capacity);
    calls += 100;
    elapsed = std::chrono::duration<double>(Clock::now() - start).count();
  } while (elapsed < duration);
  return elapsed * 1e9 / calls;
}

int main() {
  std::puts("# same source and destination buffers; complete unpadded blocks; five alternating pairs; CPU pin externally");
  std::puts("simdutf_isa,operation,target_size,input_bytes,output_mod64,pair,simdutf_ns,aklomp_ns,simdutf_over_aklomp");
  for (auto profile : {std::pair<const char*, int>{"icelake", BASE64_FORCE_AVX512},
                       {"haswell", BASE64_FORCE_AVX2}, {"westmere", BASE64_FORCE_SSE42}}) {
    const auto* impl = simdutf::get_available_implementations()[profile.first];
    if (impl == nullptr || !impl->supported_by_runtime_system()) continue;
    simdutf::get_active_implementation() = impl;
    // Force once using the decode initializer, which honors the AVX512 flag
    // too. Timed calls use flags=0, retaining the chosen codec without CPUID.
    base64_state state;
    base64_stream_decode_init(&state, profile.second);
    const char* names[] = {"encode", "decode_raw", "decode_checked", "encode_url", "decode_url"};
    for (int op = 0; op < 5; op++) {
      bool encode = op == 0 || op == 3;
      bool url = op == 3 || op == 4;
      for (size_t size : {size_t(16), size_t(32), size_t(64), size_t(128), size_t(256), size_t(1024), size_t(65536)}) {
        size_t rawsize = encode ? size / 3 * 3 : size / 4 * 3;
        std::vector<char> raw(rawsize);
        std::mt19937 random(9271);
        for (char& c : raw) c = char(random());
        auto coded = oracle(raw, url);
        const auto& input = encode ? raw : coded;
        const auto& expected = encode ? coded : raw;
        std::vector<char> output(expected.size() + 160, char(0x55));
        for (size_t alignment : {size_t(0), size_t(16), size_t(32), size_t(48)}) {
          size_t offset = 64 + (alignment + 64 - uintptr_t(output.data()) % 64) % 64;
          for (bool aklomp : {false, true}) {
            std::fill(output.begin(), output.end(), char(0x55));
            size_t n = convert(aklomp, op, input.data(), input.size(), output.data() + offset, expected.size());
            if (n != expected.size() || std::memcmp(output.data() + offset, expected.data(), n) != 0) std::abort();
            for (size_t i = 0; i < output.size(); i++) {
              if ((i < offset || i >= offset + expected.size()) && output[i] != 0x55) std::abort();
            }
            sample(aklomp, op, input.data(), input.size(), output.data() + offset, expected.size(), 0.01);
          }
          for (int pair = 0; pair < 5; pair++) {
            double s, a;
            if (pair % 2 == 0) {
              s = sample(false, op, input.data(), input.size(), output.data() + offset, expected.size(), 0.03);
              a = sample(true, op, input.data(), input.size(), output.data() + offset, expected.size(), 0.03);
            } else {
              a = sample(true, op, input.data(), input.size(), output.data() + offset, expected.size(), 0.03);
              s = sample(false, op, input.data(), input.size(), output.data() + offset, expected.size(), 0.03);
            }
            std::printf("%s,%s,%zu,%zu,%zu,%d,%.3f,%.3f,%.4f\n", profile.first, names[op], size,
                        input.size(), alignment, pair, s, a, s/a);
            std::fflush(stdout);
          }
        }
      }
    }
  }
  std::puts("# independent scalar byte oracle and output canaries passed");
}
