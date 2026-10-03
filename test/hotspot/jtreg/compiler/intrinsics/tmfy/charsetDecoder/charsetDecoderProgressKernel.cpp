// Standalone differential driver. Expected data/progress/result values are
// serialized by an unchanged stock CharsetDecoder, never computed by a second
// native UTF-8 parser. This file is source only until separately authorized.
#include "kernels.h"
#include "simdutf.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <string>
#include <vector>
#if defined(__unix__)
#include <sys/mman.h>
#include <unistd.h>
#endif

static void require(bool value, const char* reason) {
  if (!value) {
    std::fprintf(stderr, "FAIL: %s\n", reason);
    std::exit(1);
  }
}

static bool untouched(const uint8_t* begin, const uint8_t* end, uint8_t value) {
  return std::all_of(begin, end, [value](uint8_t byte) { return byte == value; });
}

static int32_t call(const uint8_t* input, size_t length, uint8_t* output,
                    size_t capacity_units) {
  return tmfy_decode_utf8_array_utf16(input, length,
                                     reinterpret_cast<uint16_t*>(output), capacity_units);
}

static void no_store_checks() {
  alignas(64) uint8_t input[64] = {};
  alignas(64) uint8_t output[128];
  std::memset(output, 0x5a, sizeof(output));
  require(call(nullptr, 0, nullptr, 0) == 0, "empty nulls");
  require(call(reinterpret_cast<const uint8_t*>(UINTPTR_MAX), 0,
               reinterpret_cast<uint8_t*>(UINTPTR_MAX), SIZE_MAX) == 0,
          "empty ignores addresses and capacity");
  require(call(input, TMFY_CONVERT_MAX_BYTES + 1, output, SIZE_MAX) == TMFY_NEEDS_GENERAL,
          "bounded input length");
  require(call(input, SIZE_MAX, output, SIZE_MAX) == TMFY_NEEDS_GENERAL, "size overflow");
  for (size_t capacity = 0; capacity < 4; ++capacity) {
    require(call(input, 4, output, capacity) == TMFY_BAD_ARGUMENT, "short unit reservation");
  }
  require(call(nullptr, 4, output, 4) == TMFY_BAD_ARGUMENT, "null source");
  require(call(input, 4, nullptr, 4) == TMFY_BAD_ARGUMENT, "null target");
  require(call(input, 4, output + 1, 4) == TMFY_BAD_ARGUMENT, "misaligned target");
  require(call(output, 4, output, 4) == TMFY_BAD_ARGUMENT, "same span");
  require(call(output, 4, output + 2, 4) == TMFY_BAD_ARGUMENT, "source-end overlap");
  require(call(output + 7, 4, output, 4) == TMFY_BAD_ARGUMENT, "reserved-end overlap");
  require(call(reinterpret_cast<const uint8_t*>(UINTPTR_MAX - 2), 4, output, 4)
          == TMFY_BAD_ARGUMENT, "input range overflow");
  require(call(input, 4, reinterpret_cast<uint8_t*>(UINTPTR_MAX - 7), 4)
          == TMFY_BAD_ARGUMENT, "output range overflow");
  require(untouched(output, output + sizeof(output), 0x5a), "decline changed output");
}

static void initialize(const std::string& mode) {
  uint8_t input[4] = {0x41, 0xe4, 0xb8, 0xad};
  alignas(16) uint8_t output[16];
  std::memset(output, 0x5a, sizeof(output));
  require(call(input, sizeof(input), output, 4) == TMFY_NOT_INITIALIZED,
          "leaf performed lazy initialization");
  require(untouched(output, output + sizeof(output), 0x5a), "uninitialized store");
  require(std::strcmp(tmfy_implementation_name(), "uninitialized") == 0, "initial backend");
  if (mode == "host") {
    require(tmfy_runtime_initialize() == 0, "initialize host");
  } else {
    const simdutf::implementation* requested = simdutf::get_available_implementations()[mode];
    require(requested != nullptr, "backend not compiled");
    const uint32_t mask = requested->required_instruction_sets();
    require((mask & ~simdutf::internal::detect_supported_architectures()) == 0,
            "backend unsupported by host");
    require(tmfy_runtime_initialize_with_isa(mask) == 0, "initialize requested backend");
    require(mode == tmfy_implementation_name(), "selected backend differs");
  }
}

static uint32_t read_u32(std::ifstream& file) {
  uint8_t value[4];
  file.read(reinterpret_cast<char*>(value), sizeof(value));
  require(bool(file), "truncated integer");
  return (uint32_t(value[0]) << 24) | (uint32_t(value[1]) << 16) |
         (uint32_t(value[2]) << 8) | value[3];
}

static uint64_t read_u64(std::ifstream& file) {
  const uint64_t high = read_u32(file);
  return (high << 32) | read_u32(file);
}

static std::vector<uint8_t> read_bytes(std::ifstream& file, size_t bound) {
  const size_t length = read_u32(file);
  require(length <= bound, "corpus byte bound");
  std::vector<uint8_t> result(length);
  if (length != 0) file.read(reinterpret_cast<char*>(result.data()), length);
  require(bool(file), "truncated bytes");
  return result;
}

static std::string read_text(std::ifstream& file) {
  const std::vector<uint8_t> value = read_bytes(file, 4096);
  return std::string(value.begin(), value.end());
}

struct answer {
  uint32_t consumed;
  std::vector<uint8_t> utf16; // Native-endian bytes, converted while reading.
  uint32_t kind;
  uint32_t error_length;
};

static answer read_answer(std::ifstream& file) {
  answer result;
  result.consumed = read_u32(file);
  const size_t units = read_u32(file);
  require(units <= 2 * TMFY_CONVERT_MAX_BYTES + 16, "oracle character bound");
  result.utf16.resize(2 * units);
  if (units != 0) file.read(reinterpret_cast<char*>(result.utf16.data()), 2 * units);
  require(bool(file), "truncated UTF16");
  for (size_t i = 0; i < result.utf16.size(); i += 2) {
    const uint16_t value = (uint16_t(result.utf16[i]) << 8) | result.utf16[i + 1];
    std::memcpy(result.utf16.data() + i, &value, 2);
  }
  result.kind = read_u32(file);
  result.error_length = read_u32(file);
  require(result.kind <= 2 && (result.kind == 1 ?
          result.error_length >= 1 && result.error_length <= 3 : result.error_length == 0),
          "oracle CoderResult");
  return result;
}

struct record {
  std::string name;
  std::vector<uint8_t> backing;
  size_t offset;
  size_t length;
  size_t capacity;
  uint32_t action;
  bool end;
  size_t block;
  uint32_t status;
  answer prefix;
  answer ended;
  answer suffix;
  answer direct;
  bool protocol;
};

static record read_record(std::ifstream& file, bool protocol) {
  record result{};
  result.protocol = protocol;
  result.name = read_text(file);
  result.backing = read_bytes(file, 2 * TMFY_CONVERT_MAX_BYTES + 24);
  result.offset = read_u32(file);
  result.length = read_u32(file);
  require(result.offset <= result.backing.size() &&
          result.length <= result.backing.size() - result.offset, "oracle slice");
  if (protocol) {
    result.capacity = read_u32(file);
    result.action = read_u32(file);
    const int end = file.get();
    require(end == 0 || end == 1, "end flag");
    result.end = end != 0;
    result.block = read_u32(file);
    require(result.action <= 2 && result.capacity <= 2 * TMFY_CONVERT_MAX_BYTES + 16,
            "protocol parameters");
    require(result.block == std::min(size_t(TMFY_CONVERT_MAX_BYTES),
                                    std::min(result.length, result.capacity)), "admitted block");
  } else {
    result.block = result.length;
    result.capacity = result.length;
  }
  result.status = read_u32(file);
  result.prefix = read_answer(file);
  require(result.block <= TMFY_CONVERT_MAX_BYTES && result.status <= 1,
          "kernel record bounds");
  require(result.prefix.consumed <= result.block &&
          result.prefix.utf16.size() <= 2 * result.prefix.consumed &&
          result.prefix.kind != 2, "valid-prefix oracle");
  require(result.status == (result.prefix.consumed == result.block ? 0u : 1u),
          "complete/unresolved protocol");
  if (protocol) {
    result.suffix = read_answer(file);
    result.direct = read_answer(file);
    require(result.prefix.consumed + result.suffix.consumed == result.direct.consumed &&
            result.direct.consumed <= result.length &&
            result.prefix.utf16.size() + result.suffix.utf16.size() == result.direct.utf16.size() &&
            result.direct.utf16.size() <= 2 * result.capacity &&
            result.suffix.kind == result.direct.kind &&
            result.suffix.error_length == result.direct.error_length,
            "stock resume metadata");
  } else {
    result.ended = read_answer(file);
    require(result.ended.consumed == result.prefix.consumed &&
            result.ended.utf16 == result.prefix.utf16 &&
            (result.status == 0 ? result.ended.kind == 0 : result.ended.kind == 1),
            "stock end-of-input mapping");
  }
  return result;
}

static void compare(const record& value, const uint8_t* input, uint8_t* output,
                    size_t capacity) {
  const int32_t packed = call(input, value.block, output, capacity);
  const uint32_t bits = uint32_t(packed);
  const uint32_t consumed = bits & TMFY_CHARSET_DECODE_BYTES_MASK;
  const uint32_t written = (bits >> TMFY_CHARSET_DECODE_UNITS_SHIFT) &
                           TMFY_CHARSET_DECODE_UNITS_MASK;
  const uint32_t status = bits >> TMFY_CHARSET_DECODE_STATUS_SHIFT;
  if (packed < 0 || consumed != value.prefix.consumed ||
      2 * written != value.prefix.utf16.size() || status != value.status ||
      !std::equal(value.prefix.utf16.begin(), value.prefix.utf16.end(), output)) {
    std::fprintf(stderr, "record=%s block=%zu got=(%d,%u,%u,%u) expected=(%u,%zu,%u)\n",
        value.name.c_str(), value.block, packed, consumed, written, status,
        value.prefix.consumed, value.prefix.utf16.size() / 2, value.status);
    require(false, "stock CharsetDecoder prefix mismatch");
  }
  if (value.protocol) {
    // Check the native prefix plus stock-computed scalar suffix against the
    // direct public result. This does NOT execute Java integration in C++.
    std::vector<uint8_t> combined(output, output + 2 * written);
    combined.insert(combined.end(), value.suffix.utf16.begin(), value.suffix.utf16.end());
    require(combined == value.direct.utf16, "native prefix plus stock suffix text");
    require(consumed + value.suffix.consumed == value.direct.consumed,
            "native prefix plus stock suffix position");
  }
}

static void sliced_alignments(const record& value) {
  for (size_t source_alignment : {size_t(0), size_t(1)}) {
    for (size_t target_unit_offset : {size_t(0), size_t(1)}) {
      for (size_t extra : {size_t(0), size_t(7)}) {
        const size_t source_base = 16 + source_alignment;
        const size_t target_base = 16 + 2 * target_unit_offset;
        std::vector<uint8_t> source(value.backing.size() + 34, 0xa5);
        std::copy(value.backing.begin(), value.backing.end(), source.begin() + source_base);
        const std::vector<uint8_t> before = source;
        std::vector<uint8_t> target(2 * (value.block + extra) + 34, 0x5a);
        const uint8_t* input = source.data() + source_base + value.offset;
        uint8_t* output = target.data() + target_base;
        compare(value, input, output, value.block + extra);
        require(source == before, "source or source guards changed");
        require(untouched(target.data(), output, 0x5a), "output prefix guard");
        require(untouched(output + value.prefix.utf16.size(), target.data() + target.size(), 0x5a),
                "store outside committed output prefix");
        if (value.block != 0 && extra == 0) {
          std::fill(target.begin(), target.end(), 0x5a);
          require(call(input, value.block, output, value.block - 1) == TMFY_BAD_ARGUMENT,
                  "insufficient reservation accepted");
          require(untouched(target.data(), target.data() + target.size(), 0x5a),
                  "short reservation stored");
        }
      }
    }
  }
}

// Reuse mappings across corpus records. PROT_NONE immediately after the exact
// captured input and exact output reservation exposes overreads/overwrites.
class guarded_spans {
#if defined(__unix__)
  uint8_t* source = nullptr;
  uint8_t* target = nullptr;
  size_t data = 0;
  size_t mapping = 0;
#endif
public:
  guarded_spans() {
#if defined(__unix__)
    const long page_size = sysconf(_SC_PAGESIZE);
    require(page_size > 0, "page size");
    const size_t page = size_t(page_size);
    data = ((2 * TMFY_CONVERT_MAX_BYTES + 64 + page - 1) / page) * page;
    mapping = data + page;
    source = static_cast<uint8_t*>(mmap(nullptr, mapping, PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0));
    target = static_cast<uint8_t*>(mmap(nullptr, mapping, PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0));
    require(source != MAP_FAILED && target != MAP_FAILED, "guard mappings");
    require(mprotect(source + data, page, PROT_NONE) == 0 &&
            mprotect(target + data, page, PROT_NONE) == 0, "guard protections");
#endif
  }

  void check(const record& value) {
#if defined(__unix__)
    const size_t reserved = 2 * value.block;
    uint8_t* input = source + data - value.block;
    uint8_t* output = target + data - reserved;
    if (value.block != 0) {
      std::memcpy(input, value.backing.data() + value.offset, value.block);
    }
    std::memset(output - 32, 0x5a, reserved + 32);
    compare(value, input, output, value.block);
    require(std::equal(input, input + value.block, value.backing.data() + value.offset),
            "guarded input changed");
    require(untouched(output - 32, output, 0x5a), "guarded output prefix");
    require(untouched(output + value.prefix.utf16.size(), target + data, 0x5a),
            "guarded output tail");
#endif
  }

  ~guarded_spans() {
#if defined(__unix__)
    require(munmap(source, mapping) == 0 && munmap(target, mapping) == 0, "release mappings");
#endif
  }
};

int main(int argc, char** argv) {
  require(argc == 2 || argc == 3, "usage: charsetDecoderProgressKernel corpus.bin [host|backend]");
  no_store_checks();
  initialize(argc == 3 ? argv[2] : "host");
  no_store_checks();
  guarded_spans guards;
  std::ifstream file(argv[1], std::ios::binary);
  require(bool(file), "open oracle corpus");
  char magic[8];
  file.read(magic, sizeof(magic));
  require(bool(file) && std::memcmp(magic, "TMFYDEC1", 8) == 0, "corpus magic");
  const std::string runtime = read_text(file);
  const std::string vendor = read_text(file);
  const std::string vm = read_text(file);
  uint64_t records = 0;
  uint64_t protocols = 0;
  uint64_t statuses[2] = {};
  uint64_t results[3][3] = {};
  while (true) {
    const int marker = file.get();
    require(marker != EOF, "missing corpus footer");
    if (marker == 0) {
      require(records == read_u64(file), "record count footer");
      require(protocols == read_u64(file), "protocol count footer");
      require(file.get() == EOF && file.eof(), "bytes after corpus footer");
      break;
    }
    require(marker == 1 || marker == 2, "record marker");
    const record value = read_record(file, marker == 2);
    sliced_alignments(value);
    guards.check(value);
    statuses[value.status]++;
    records++;
    if (value.protocol) {
      protocols++;
      results[value.action][value.direct.kind]++;
    }
  }
  require(records > 240000 && protocols > 1000, "missing required corpus families");
  require(statuses[0] != 0 && statuses[1] != 0, "missing kernel status coverage");
  for (size_t action = 0; action < 3; ++action) {
    require(results[action][0] != 0 && results[action][2] != 0, "missing capacity/action coverage");
  }
  require(results[0][1] != 0 && results[1][1] == 0 && results[2][1] == 0,
          "malformed action coverage");
  std::printf("PASS CharsetDecoder prefix records=%llu protocols=%llu backend=%s statuses=%llu/%llu\n",
      static_cast<unsigned long long>(records), static_cast<unsigned long long>(protocols),
      tmfy_implementation_name(), static_cast<unsigned long long>(statuses[0]),
      static_cast<unsigned long long>(statuses[1]));
  std::printf("Oracle runtime=%s vendor=%s VM=%s\n", runtime.c_str(), vendor.c_str(), vm.c_str());
}
