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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

// Standalone native library: no HotSpot oops or Java heap addresses are retained.
#define PCRE2_CODE_UNIT_WIDTH 0
#include "pcre2.h"
#include <atomic>
#include <cstdint>
#include <cstddef>
#include <cstdlib>
#include <cstring>
#include <new>

namespace {
constexpr size_t MAX_SUBJECT = 65536, MAX_CODE = 256 * 1024;
constexpr size_t GLOBAL_BUDGET = 64 * 1024 * 1024, JIT_RESERVATION = 1024 * 1024;
constexpr size_t JIT_BUILD_RESERVATION = 16 * 1024 * 1024;
constexpr unsigned POOL_SIZE = 16, LEAF_INPUT = 64, LEAF_LIMIT = 32;
std::atomic<size_t> live_bytes{0}, allocation_count{0}, allocated_bytes{0}, freed_bytes{0}, jit_bytes{0};

bool reserve(size_t bytes) {
  size_t current = live_bytes.load(std::memory_order_relaxed);
  while (bytes <= GLOBAL_BUDGET - current) {
    if (live_bytes.compare_exchange_weak(current, current + bytes, std::memory_order_relaxed)) return true;
  }
  return false;
}
struct alignas(std::max_align_t) Allocation { size_t bytes; };
void* allocate(PCRE2_SIZE size, void*) {
  if (size > GLOBAL_BUDGET - sizeof(Allocation) || !reserve(size + sizeof(Allocation))) return nullptr;
  auto* block = static_cast<Allocation*>(std::malloc(size + sizeof(Allocation)));
  if (block == nullptr) { live_bytes.fetch_sub(size + sizeof(Allocation)); return nullptr; }
  allocation_count.fetch_add(1, std::memory_order_relaxed);
  allocated_bytes.fetch_add(size + sizeof(Allocation), std::memory_order_relaxed);
  block->bytes = size + sizeof(Allocation);
  return block + 1;
}
void deallocate(void* pointer, void*) {
  if (pointer != nullptr) {
    auto* block = static_cast<Allocation*>(pointer) - 1;
    freed_bytes.fetch_add(block->bytes, std::memory_order_relaxed);
    live_bytes.fetch_sub(block->bytes, std::memory_order_relaxed);
    std::free(block);
  }
}

// Width-generic API bindings. Both engines use code units, without UTF/UCP.
#define API(W) \
 template<> struct Api<W> { \
  using Code = pcre2_code_##W; using Data = pcre2_match_data_##W; \
  using Stack = pcre2_jit_stack_##W; using Context = pcre2_match_context_##W; using General = pcre2_general_context_##W; \
  using Unit = uint##W##_t; \
  static General* general() { return pcre2_general_context_create_##W(allocate, deallocate, nullptr); } \
  static Code* compile(const Unit* pattern, size_t length, uint32_t options, int* error, PCRE2_SIZE* offset, General* g) { \
    auto* c = pcre2_compile_context_create_##W(g); \
    if (!c) return nullptr; \
    pcre2_set_max_pattern_length_##W(c, 16384); \
    Code* code = pcre2_compile_##W(pattern, length, options, error, offset, c); \
    pcre2_compile_context_free_##W(c); return code; \
  } \
  static Data* data(Code* code, General* g) { return pcre2_match_data_create_from_pattern_##W(code, g); } \
  static Context* context(General* g) { return pcre2_match_context_create_##W(g); } \
  static void limits(Context* c, bool leaf) { \
    pcre2_set_match_limit_##W(c, leaf ? LEAF_LIMIT : 100000); \
    pcre2_set_depth_limit_##W(c, leaf ? 32 : 256); \
    pcre2_set_heap_limit_##W(c, leaf ? 16 : 256); \
  } \
  static int match(Code* code, const Unit* text, size_t length, size_t start, uint32_t options, Data* d, Context* c) { \
    return pcre2_match_##W(code, text, length, start, options, d, c); \
  } \
  static void info(Code* code, uint32_t what, void* result) { pcre2_pattern_info_##W(code, what, result); } \
  static PCRE2_SIZE* offsets(Data* d) { return pcre2_get_ovector_pointer_##W(d); } \
  static Stack* stack(General* g) { return pcre2_jit_stack_create_##W(32768, 65536, g); } \
  static void assign(Context* c, Stack* (*callback)(void*), void* data) { pcre2_jit_stack_assign_##W(c, callback, data); } \
  static void free_stack(Stack* s) { pcre2_jit_stack_free_##W(s); } \
  static Code* copy(Code* code) { return pcre2_code_copy_##W(code); } \
  static int jit(Code* code) { return pcre2_jit_compile_##W(code, PCRE2_JIT_COMPLETE); } \
  static void free_code(Code* code) { pcre2_code_free_##W(code); } \
  static void free_data(Data* d) { pcre2_match_data_free_##W(d); } \
  static void free_context(Context* c) { pcre2_match_context_free_##W(c); } \
  static void free_general(General* g) { pcre2_general_context_free_##W(g); } \
 };
template<int W> struct Api;
API(8)
API(16)
#undef API

template<int W> struct Handle {
  using A = Api<W>;
  struct Slot {
    std::atomic<bool> busy{false};
    typename A::Data* data = nullptr;
    typename A::Context* context = nullptr;
    typename A::Stack* stack = nullptr;
    bool stack_reserved = false, entered_jit = false;
    int mode = 0;
    std::atomic<uint64_t> interpreted[3]{}, entered[3]{};
  };
  struct Jit {
    std::atomic<typename A::Code*> code{nullptr};
    // 0: eligible, 1: one preparer, 2: completed/unavailable.
    std::atomic<unsigned> state{0}, hits{0}, samples{0}, preparations{0};
    std::atomic<uint64_t> recent{0};
    size_t size = 0;
    bool reserved = false;
    bool worthwhile(unsigned threshold) const {
      unsigned count = samples.load(std::memory_order_relaxed);
      uint64_t bits = recent.load(std::memory_order_relaxed);
      unsigned positives = 0;
      while (bits) { bits &= bits - 1; positives++; }
      return hits.load(std::memory_order_relaxed) >= threshold && count != 0 && positives * 4 >= count * 3;
    }
    void record(bool useful, unsigned threshold) {
      uint64_t bits = recent.load(std::memory_order_relaxed);
      while (!recent.compare_exchange_weak(bits, (bits << 1) | unsigned(useful), std::memory_order_relaxed)) {}
      unsigned count = samples.load(std::memory_order_relaxed);
      while (count < 64 && !samples.compare_exchange_weak(count, count + 1, std::memory_order_relaxed)) {}
      count = hits.load(std::memory_order_relaxed);
      if (useful) while (count < threshold && !hits.compare_exchange_weak(count, count + 1, std::memory_order_relaxed)) {}
    }
  };
  typename A::General* general = nullptr;
  typename A::Code* code = nullptr;
  typename A::Unit* pattern = nullptr;
  size_t pattern_length = 0;
  uint32_t compile_options = 0;
  Jit variants[2]; // find and compile-time anchored lookingAt, independently admitted
  std::atomic<uint64_t> saturation{0}, errors{0}, declined{0}, leaf_rejects{0};
  bool allow_jit = false, leaf_eligible = false;
  unsigned threshold = 32;
  size_t groups = 0;
  Slot pool[POOL_SIZE];
  ~Handle() {
    for (auto& variant : variants) {
      A::free_code(variant.code.load());
      jit_bytes.fetch_sub(variant.size);
      if (variant.reserved) live_bytes.fetch_sub(JIT_RESERVATION);
    }
    for (auto& slot : pool) { A::free_stack(slot.stack); A::free_data(slot.data); A::free_context(slot.context);
      if (slot.stack_reserved) live_bytes.fetch_sub(65536); }
    A::free_code(code); A::free_general(general); deallocate(pattern, nullptr);
  }
  static typename A::Stack* jit_stack(void* data) {
    auto* slot = static_cast<Slot*>(data);
    slot->entered_jit = true;
    slot->entered[slot->mode].fetch_add(1, std::memory_order_relaxed);
    return slot->stack;
  }
  void prepare_jit(size_t length, int mode) {
    if (!allow_jit || mode == 2 || length < 256) return;
    auto& variant = variants[mode];
    if (!variant.worthwhile(threshold)) return;
    unsigned eligible = 0;
    if (!variant.state.compare_exchange_strong(eligible, 1)) return;
    if (reserve(JIT_BUILD_RESERVATION)) {
      variant.reserved = true;
      variant.preparations.fetch_add(1, std::memory_order_relaxed);
      int error; PCRE2_SIZE offset;
      // Runtime ANCHORED prevents pcre2_match from entering JIT. Compile that
      // property into the lookingAt variant, retaining the original grammar.
      auto* copy = mode == 0 ? A::copy(code) : A::compile(pattern, pattern_length,
          compile_options | PCRE2_ANCHORED, &error, &offset, general);
      size_t bytes = 0;
      if (copy && A::jit(copy) == 0) {
        A::info(copy, PCRE2_INFO_JITSIZE, &bytes);
        if (bytes <= JIT_RESERVATION / 2) {
          variant.size = bytes; jit_bytes.fetch_add(bytes);
          variant.code.store(copy, std::memory_order_release); copy = nullptr;
        }
      }
      A::free_code(copy);
      if (!variant.code.load()) { variant.reserved = false; live_bytes.fetch_sub(JIT_BUILD_RESERVATION); }
      else live_bytes.fetch_sub(JIT_BUILD_RESERVATION - JIT_RESERVATION);
    }
    variant.state.store(2, std::memory_order_release);
  }
  void stats(int64_t* values) {
    for (int i = 0; i < 12; i++) values[i] = 0;
    for (auto& slot : pool) for (int mode = 0; mode < 3; mode++) {
      values[mode] += slot.interpreted[mode].load(std::memory_order_relaxed);
      values[3 + mode] += slot.entered[mode].load(std::memory_order_relaxed);
    }
    values[6] = variants[0].preparations.load(); values[7] = variants[1].preparations.load();
    values[8] = saturation.load(); values[9] = errors.load(); values[10] = declined.load(); values[11] = leaf_rejects.load();
  }
};

template<int W> void* compile(const unsigned char* bytes, size_t length, unsigned flags,
                              size_t groups, bool jit, unsigned threshold) {
  if (!bytes || length > 16384 || groups == 0 || groups > 33) return nullptr;
  auto* memory = allocate(sizeof(Handle<W>), nullptr);
  if (!memory) return nullptr;
  auto* handle = new (memory) Handle<W>();
  using A = Api<W>;
  handle->groups = groups; handle->allow_jit = jit; handle->threshold = threshold;
  handle->general = A::general();
  if (!handle->general) { handle->~Handle<W>(); deallocate(handle, nullptr); return nullptr; }
  typename A::Unit pattern[16384];
  for (size_t i = 0; i < length; i++) pattern[i] = bytes[i];
  int error; PCRE2_SIZE offset;
  // CASELESS C-locale folding is ASCII; Java Unicode flags remain unqualified.
  handle->compile_options = (flags & 2) ? PCRE2_CASELESS : 0;
  handle->code = A::compile(pattern, length, handle->compile_options, &error, &offset, handle->general);
  uint32_t count = 0; size_t code_size = 0;
  if (handle->code) { A::info(handle->code, PCRE2_INFO_CAPTURECOUNT, &count); A::info(handle->code, PCRE2_INFO_SIZE, &code_size); }
  handle->leaf_eligible = code_size <= 4096;
  handle->allow_jit = handle->allow_jit && code_size <= 4096;
  bool valid = handle->code && count + 1 == groups && code_size <= MAX_CODE;
  if (valid && handle->allow_jit) {
    handle->pattern = static_cast<typename A::Unit*>(allocate(length * sizeof(typename A::Unit), nullptr));
    valid = handle->pattern != nullptr;
    if (valid) { std::memcpy(handle->pattern, pattern, length * sizeof(typename A::Unit)); handle->pattern_length = length; }
  }
  if (valid) {
    auto& slot = handle->pool[0];
    slot.data = A::data(handle->code, handle->general);
    slot.context = A::context(handle->general);
    valid = slot.data && slot.context;
    if (valid) {
      A::limits(slot.context, true);
      typename A::Unit empty[1] = {0};
      A::match(handle->code, empty, 0, 0, PCRE2_NO_JIT, slot.data, slot.context);
    }
  }
  if (!valid) { handle->~Handle<W>(); deallocate(handle, nullptr); return nullptr; }
  return handle;
}

template<int W> int match(Handle<W>* handle, const typename Api<W>::Unit* text,
                          int* state, bool safepoint) {
  if (!handle || !text || !state) return -1;
  using A = Api<W>;
  size_t base = 2 * handle->groups;
  int from = state[base], to = state[base + 1], start = state[base + 2], mode = state[base + 3];
  if (from < 0 || to < from || to - from > int(MAX_SUBJECT) || start < from || start > to || mode < 0 || mode > 2) return -1;
  // PCRE2's backtracking limit alone does not bound an unanchored search: it
  // restarts for each subject position. Bound both subject length and per-start
  // match/depth/heap work on the leaf path. All larger work uses stable copies.
  if (!safepoint && (W != 8 || !handle->leaf_eligible || to - from > int(LEAF_INPUT))) {
    handle->leaf_rejects.fetch_add(1, std::memory_order_relaxed); return -2;
  }
  if (safepoint && mode != 2) handle->prepare_jit(to - from, mode);
  typename Handle<W>::Slot* acquired = nullptr;
  for (unsigned index = 0; index < (safepoint ? POOL_SIZE : 1); index++) {
    auto& slot = handle->pool[index];
    bool free = false;
    if (slot.busy.compare_exchange_strong(free, true, std::memory_order_acquire)) { acquired = &slot; break; }
  }
  // No blocking or spin waiting in a leaf. Saturation hands control to Java.
  if (!acquired) { handle->saturation.fetch_add(1, std::memory_order_relaxed); return safepoint ? -1 : -2; }
  if (!acquired->data || !acquired->context) {
    if (!acquired->data) acquired->data = A::data(handle->code, handle->general);
    if (!acquired->context) acquired->context = A::context(handle->general);
    if (!acquired->data || !acquired->context) {
      acquired->busy.store(false, std::memory_order_release);
      handle->errors.fetch_add(1, std::memory_order_relaxed); return -1;
    }
  }
  acquired->mode = mode; acquired->entered_jit = false;
  A::limits(acquired->context, !safepoint);
  uint32_t options = mode ? PCRE2_ANCHORED : 0;
  if (mode == 2) options |= PCRE2_ENDANCHORED;
  // Small work interprets even when this pattern owns JIT code.
  auto* code = safepoint && mode != 2 && to - from >= 256
      ? handle->variants[mode].code.load(std::memory_order_acquire) : nullptr;
  if (code && !handle->variants[mode].worthwhile(handle->threshold)) {
    handle->declined.fetch_add(1, std::memory_order_relaxed); code = nullptr;
  }
  if (code && !acquired->stack && reserve(65536)) {
    acquired->stack = A::stack(handle->general);
    acquired->stack_reserved = acquired->stack != nullptr;
    if (acquired->stack) A::assign(acquired->context, Handle<W>::jit_stack, acquired);
    else live_bytes.fetch_sub(65536);
  }
  if (!code || !acquired->stack) { code = handle->code; options |= PCRE2_NO_JIT; }
  else options = 0; // Anchoring is a compile-time property of the selected variant.
  // PCRE2 match data/scratch retain subject pointer values after returning.
  // A leaf must not publish Java heap addresses into a reusable native cache.
  // Its tiny copy has a fixed bound and does not transcode Latin-1.
  typename A::Unit bounded_input[LEAF_INPUT];
  const typename A::Unit* subject = text + from;
  if (!safepoint) {
    std::memcpy(bounded_input, subject, (to - from) * sizeof(typename A::Unit));
    subject = bounded_input;
  }
  int result = A::match(code, subject, to - from, start - from, options, acquired->data, acquired->context);
  if (!acquired->entered_jit) acquired->interpreted[mode].fetch_add(1, std::memory_order_relaxed);
  // JIT does not implement ENDANCHORED and can exhaust its fixed internal
  // stack. Repeat in the interpreter in native state, preserving the operation.
  if (safepoint && (result == PCRE2_ERROR_JIT_STACKLIMIT || result == PCRE2_ERROR_JIT_BADOPTION)) {
    result = A::match(handle->code, text + from, to - from, start - from,
                      (mode ? PCRE2_ANCHORED : 0) | PCRE2_NO_JIT, acquired->data, acquired->context);
    acquired->interpreted[mode].fetch_add(1, std::memory_order_relaxed);
  }
  if (safepoint && mode != 2 && to - from >= 256) {
    PCRE2_SIZE* offsets = A::offsets(acquired->data);
    handle->variants[mode].record(result > 0 && offsets[1] - offsets[0] >= 128, handle->threshold);
  }
  if (result > 0) {
    PCRE2_SIZE* offsets = A::offsets(acquired->data);
    for (size_t i = 0; i < base; i++) state[i] = i >= size_t(result) * 2 || offsets[i] == PCRE2_UNSET ? -1 : int(offsets[i]) + from;
    result = 1;
  } else if (result == PCRE2_ERROR_NOMATCH) result = 0;
  else { handle->errors.fetch_add(1, std::memory_order_relaxed); result = safepoint ? -1 : -2; } // Never a fabricated miss.
  acquired->busy.store(false, std::memory_order_release);
  return result;
}
} // namespace

extern "C" {
void* jdk_regex_compile(const unsigned char* p, size_t n, unsigned f, size_t g, bool jit, unsigned threshold) {
  return compile<8>(p, n, f, g, jit, threshold);
}
void* jdk_regex_compile16(const unsigned char* p, size_t n, unsigned f, size_t g, bool jit, unsigned threshold) {
  return compile<16>(p, n, f, g, jit, threshold);
}
void jdk_regex_free(void* p) { if (p) { static_cast<Handle<8>*>(p)->~Handle<8>(); deallocate(p, nullptr); } }
void jdk_regex_free16(void* p) { if (p) { static_cast<Handle<16>*>(p)->~Handle<16>(); deallocate(p, nullptr); } }
int jdk_regex_match(const void* p, const unsigned char* b, int* s) { return match<8>(const_cast<Handle<8>*>(static_cast<const Handle<8>*>(p)), b, s, false); }
int jdk_regex_match_safepoint(const void* p, const unsigned char* b, size_t n, int* s, size_t count) {
  if (!p || count != 2 * static_cast<const Handle<8>*>(p)->groups + 4 || n > MAX_SUBJECT || s[count - 3] < 0 || size_t(s[count - 3]) > n) return -1;
  return match<8>(const_cast<Handle<8>*>(static_cast<const Handle<8>*>(p)), b, s, true);
}
int jdk_regex_match16_safepoint(const void* p, const uint16_t* b, size_t n, int* s, size_t count) {
  if (!p || count != 2 * static_cast<const Handle<16>*>(p)->groups + 4 || n > MAX_SUBJECT || s[count - 3] < 0 || size_t(s[count - 3]) > n) return -1;
  return match<16>(const_cast<Handle<16>*>(static_cast<const Handle<16>*>(p)), b, s, true);
}
void jdk_regex_route_stats(const void* p8, const void* p16, int64_t* values) {
  for (int i = 0; i < 24; i++) values[i] = 0;
  if (p8) const_cast<Handle<8>*>(static_cast<const Handle<8>*>(p8))->stats(values);
  if (p16) const_cast<Handle<16>*>(static_cast<const Handle<16>*>(p16))->stats(values + 12);
}
size_t jdk_regex_live_bytes() { return live_bytes.load(); }
void jdk_regex_memory_stats(int64_t* values) {
  values[0] = live_bytes.load(); values[1] = allocation_count.load();
  values[2] = allocated_bytes.load(); values[3] = freed_bytes.load();
  values[4] = jit_bytes.load();
}
}
