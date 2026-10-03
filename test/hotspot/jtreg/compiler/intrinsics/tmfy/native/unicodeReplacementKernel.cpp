/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
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
 */
// Standalone native driver for the fresh UnicodeReplacementOracle.java corpus.
// Build with C++17, kernels.cpp, generated simdutf.cpp, and -pthread.
// Usage: unicodeReplacementKernel corpus.bin [host|race|fallback|backend-name]
// Each process initializes one immutable backend. No performance claims.
#include "kernels.h"
#include "simdutf.h"

#include <algorithm>
#include <atomic>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <string>
#include <thread>
#include <vector>
#if defined(__unix__)
#include <sys/mman.h>
#include <unistd.h>
#endif

static void require(bool condition, const char* reason) {
  if (!condition) {
    std::fprintf(stderr, "FAIL: %s\n", reason);
    std::exit(1);
  }
}

using kernel = int32_t (*)(const uint8_t*, size_t, uint8_t*, size_t);
static const kernel kernels[] = {nullptr, tmfy_encode_latin1_utf8,
                                 tmfy_encode_utf16_utf8, tmfy_decode_utf8_utf16};

static size_t reservation(int operation, size_t length) {
  return operation == 2 ? 3 * (length / 2) : 2 * length;
}

static void no_store_checks() {
  alignas(16) uint8_t input[32] = {};
  alignas(16) uint8_t output[128];
  for (int op = 1; op <= 3; ++op) {
    kernel call = kernels[op];
    std::memset(output, 0x5a, sizeof(output));
    require(call(nullptr, 0, nullptr, 0) == 0, "empty null span");
    require(call(input, 4097, output, sizeof(output)) == TMFY_NEEDS_GENERAL, "bound before stores");
    require(call(input, SIZE_MAX, output, sizeof(output)) == TMFY_NEEDS_GENERAL, "huge bound");
    require(call(input, 4, output, reservation(op, 4) - 1) == TMFY_BAD_ARGUMENT, "insufficient capacity");
    require(call(nullptr, 4, output, sizeof(output)) == TMFY_BAD_ARGUMENT, "null input");
    require(call(input, 4, nullptr, sizeof(output)) == TMFY_BAD_ARGUMENT, "null output");
    require(call(output, 4, output, sizeof(output)) == TMFY_BAD_ARGUMENT, "identical spans");
    require(call(output, 4, output + 2, 64) == TMFY_BAD_ARGUMENT, "forward overlap");
    require(call(output + 2, 4, output, 64) == TMFY_BAD_ARGUMENT, "reverse overlap");
    require(call(reinterpret_cast<const uint8_t*>(UINTPTR_MAX - 1), 4,
                 output, sizeof(output)) == TMFY_BAD_ARGUMENT, "input range overflow");
    require(call(input, 4, reinterpret_cast<uint8_t*>(UINTPTR_MAX - 1), 16)
            == TMFY_BAD_ARGUMENT, "output range overflow");
    for (uint8_t value : output) require(value == 0x5a, "negative status changed output");
  }
  require(tmfy_encode_utf16_utf8(input, 3, output, sizeof(output)) == TMFY_BAD_ARGUMENT,
          "odd UTF16 byte count");
}

static void initialize(const std::string& mode) {
  alignas(16) uint8_t input[2] = {65, 0};
  alignas(16) uint8_t output[8] = {};
  for (int op = 1; op <= 3; ++op) {
    require(kernels[op](input, 2, output, sizeof(output)) == TMFY_NOT_INITIALIZED,
            "conversion initialized dispatch lazily");
  }
  require(std::strcmp(tmfy_implementation_name(), "uninitialized") == 0, "initial label");
  const uint32_t host = simdutf::internal::detect_supported_architectures();
  if (mode == "race") {
    std::atomic<bool> start(false);
    std::atomic<bool> failed(false);
    std::vector<std::thread> threads;
    for (int i = 0; i < 16; ++i) {
      threads.emplace_back([&, i] {
        while (!start.load(std::memory_order_acquire)) {}
        const int32_t status = tmfy_runtime_initialize_with_isa(i % 2 ? host : 0);
        if (status != 0 && status != TMFY_BAD_ARGUMENT) failed.store(true);
      });
    }
    start.store(true, std::memory_order_release);
    for (auto& thread : threads) thread.join();
    require(!failed.load(), "concurrent initialization status");
  } else if (mode == "host") {
    require(tmfy_runtime_initialize() == 0, "host initialization");
  } else {
    const simdutf::implementation* requested = simdutf::get_available_implementations()[mode];
    require(requested != nullptr, "requested backend is not compiled");
    const uint32_t mask = requested->required_instruction_sets();
    require((mask & ~host) == 0, "requested backend is not host supported");
    require(tmfy_runtime_initialize_with_isa(mask) == 0, "masked initialization");
    require(mode == tmfy_implementation_name(), "masked selection differs");
  }
  const std::string name = tmfy_implementation_name();
  const bool fallback = name == "fallback";
  require(tmfy_runtime_initialize_with_isa(0) == (fallback ? 0 : TMFY_BAD_ARGUMENT),
          "incompatible existing selection was accepted");
  require(name == tmfy_implementation_name(), "existing selection changed");
  require(tmfy_runtime_initialize_with_isa(host) == 0, "compatible existing selection rejected");
  require(name == tmfy_implementation_name(), "compatible initialization changed selection");
}

// Real inaccessible pages catch vector tail reads/stores beyond the admitted
// spans. Canary-only corpus checks deliberately cover a different property.
static void guard_pages() {
#if defined(__unix__)
  const long system_page = sysconf(_SC_PAGESIZE);
  require(system_page > 0, "page size");
  const size_t page = size_t(system_page);
  const size_t data_size = ((2 * TMFY_CONVERT_MAX_BYTES + page - 1) / page + 1) * page;
  const size_t mapping_size = data_size + page;
  uint8_t* input_map = static_cast<uint8_t*>(mmap(nullptr, mapping_size,
      PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0));
  uint8_t* output_map = static_cast<uint8_t*>(mmap(nullptr, mapping_size,
      PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0));
  require(input_map != MAP_FAILED && output_map != MAP_FAILED, "guard mapping");
  require(mprotect(input_map + data_size, page, PROT_NONE) == 0, "input guard protection");
  require(mprotect(output_map + data_size, page, PROT_NONE) == 0, "output guard protection");
  std::vector<size_t> lengths;
  for (size_t length = 1; length <= 128; ++length) lengths.push_back(length);
  for (size_t length : {255, 256, 257, 511, 512, 1023, 1024, 2047, 2048, 4095, 4096}) {
    lengths.push_back(length);
  }
  for (int op = 1; op <= 3; ++op) {
    for (size_t length : lengths) {
      if (op == 2 && (length & 1)) continue;
      const size_t capacity = reservation(op, length);
      uint8_t* input = input_map + data_size - length;
      uint8_t* output = output_map + data_size - capacity;
      for (int pattern = 0; pattern < 3; ++pattern) {
        std::memset(input, pattern == 0 ? 0x61 : 0xff, length);
        if (pattern == 2 && op == 2) {
          const uint16_t surrogate = 0xd800;
          std::memcpy(input + length - 2, &surrogate, 2);
        }
        if (pattern == 2 && op == 3) input[length - 1] = 0xe0;
        std::memset(output_map, 0x5a, data_size);
        require(mprotect(input_map, data_size, PROT_READ) == 0, "read-only input");
        const int32_t written = kernels[op](input, length, output, capacity);
        require(written > 0 && size_t(written) * (op == 3 ? 2 : 1) <= capacity,
                "guard-page conversion status");
        require(mprotect(input_map, data_size, PROT_READ | PROT_WRITE) == 0,
                "restore input mapping");
        for (int i = 1; i <= 16; ++i) require(output[-i] == 0x5a, "guard-page output prefix");
      }
    }
  }
  require(munmap(input_map, mapping_size) == 0, "release input mapping");
  require(munmap(output_map, mapping_size) == 0, "release output mapping");
#endif
}

static uint32_t read_u32(std::ifstream& file) {
  uint8_t bytes[4];
  file.read(reinterpret_cast<char*>(bytes), 4);
  require(bool(file), "truncated corpus integer");
  return (uint32_t(bytes[0]) << 24) | (uint32_t(bytes[1]) << 16) |
         (uint32_t(bytes[2]) << 8) | uint32_t(bytes[3]);
}

static std::vector<uint8_t> read_bytes(std::ifstream& file) {
  const uint32_t count = read_u32(file);
  require(count <= 8192, "invalid corpus span length");
  std::vector<uint8_t> result(count);
  file.read(reinterpret_cast<char*>(result.data()), count);
  require(bool(file), "truncated corpus bytes");
  return result;
}

static void native_utf16(std::vector<uint8_t>& bytes) {
  require(bytes.size() % 2 == 0, "invalid corpus UTF16 length");
  for (size_t i = 0; i < bytes.size(); i += 2) {
    const uint16_t value = (uint16_t(bytes[i]) << 8) | bytes[i + 1];
    std::memcpy(bytes.data() + i, &value, 2);
  }
}

int main(int argc, char** argv) {
  require(argc >= 2 && argc <= 3, "usage: unicodeReplacementKernel corpus [backend|host|race]");
  no_store_checks();
  initialize(argc == 3 ? argv[2] : "host");
  no_store_checks();
  guard_pages();
  std::ifstream file(argv[1], std::ios::binary);
  require(bool(file), "cannot open corpus");
  char magic[8];
  file.read(magic, sizeof(magic));
  require(bool(file) && std::memcmp(magic, "TMFYUNI2", 8) == 0, "corpus magic");
  uint64_t records = 0;
  while (true) {
    const int operation = file.get();
    require(operation != EOF, "missing corpus completion footer");
    if (operation == 0) {
      const uint64_t high = read_u32(file);
      const uint64_t expected_records = (high << 32) | read_u32(file);
      require(records == expected_records, "corpus footer record count");
      require(file.get() == EOF && file.eof(), "bytes after corpus completion footer");
      break;
    }
    require(operation >= 1 && operation <= 3, "corpus operation");
    std::vector<uint8_t> input = read_bytes(file);
    std::vector<uint8_t> expected = read_bytes(file);
    require(input.size() <= TMFY_CONVERT_MAX_BYTES, "oracle input exceeds admitted bound");
    if (operation == 2) native_utf16(input);
    if (operation == 3) native_utf16(expected);
    const size_t capacity = reservation(operation, input.size());
    for (int source_offset = 0; source_offset <= 1; ++source_offset) {
      for (int target_offset = 0; target_offset <= 1; ++target_offset) {
        std::vector<uint8_t> source(input.size() + 33, 0xa5);
        std::vector<uint8_t> target(capacity + 33, 0x5a);
        uint8_t* in = source.data() + 16 + source_offset;
        uint8_t* out = target.data() + 16 + target_offset;
        std::copy(input.begin(), input.end(), in);
        const int32_t written = kernels[operation](in, input.size(), out, capacity);
        const size_t bytes = written < 0 ? SIZE_MAX : size_t(written) * (operation == 3 ? 2 : 1);
        if (bytes != expected.size() || !std::equal(expected.begin(), expected.end(), out)) {
          std::fprintf(stderr, "record=%llu op=%d input=%zu got=%d expectedBytes=%zu sourceOffset=%d targetOffset=%d\n",
              static_cast<unsigned long long>(records), operation, input.size(), written,
              expected.size(), source_offset, target_offset);
          require(false, "public String oracle mismatch");
        }
        require(std::equal(input.begin(), input.end(), in), "input changed");
        for (size_t i = 0; i < size_t(16 + source_offset); ++i) require(source[i] == 0xa5, "input prefix guard");
        for (size_t i = 16 + source_offset + input.size(); i < source.size(); ++i) require(source[i] == 0xa5, "input suffix guard");
        for (size_t i = 0; i < size_t(16 + target_offset); ++i) require(target[i] == 0x5a, "output prefix guard");
        for (size_t i = 16 + target_offset + capacity; i < target.size(); ++i) require(target[i] == 0x5a, "output suffix guard");
      }
    }
    records++;
  }
  require(records > 1000000, "incomplete oracle corpus");
  std::printf("PASS new native differential records=%llu alignments=4 backend=%s\n",
              static_cast<unsigned long long>(records), tmfy_implementation_name());
}
