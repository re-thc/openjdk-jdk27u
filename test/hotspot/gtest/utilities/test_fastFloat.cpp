/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

#include "runtime/os.hpp"
#include "utilities/fast_float/fast_float.h"
#include "utilities/fastFloat.hpp"
#include "unittest.hpp"

#include <cmath>

template <typename T, typename C>
static void check_fused_long_result(const fast_float::parsed_number_string_t<C>& parsed,
                                   const fast_float::long_mantissa_input<C>& resume,
                                   C decimal_point) {
  auto prepared = parsed;
  T expected;
  auto reference = fast_float::from_chars_advanced(prepared, expected);
  auto converted = fast_float::parse_number_long_path<T>(resume, decimal_point);
  EXPECT_EQ(reference.ec, converted.ec);
  EXPECT_EQ(0, memcmp(&expected, &converted.value, sizeof(T)));
}

template <bool json, typename C>
static void check_long_mantissa_spans(const char* text, fast_float::parse_options_t<C> options,
                                     bool expect_long = false) {
  C input[1025];
  size_t length = strlen(text);
  ASSERT_LT(length, ARRAY_SIZE(input));
  for (size_t i = 0; i < length; ++i) {
    input[i] = C(text[i]);
  }
  auto omitted = fast_float::parse_number_string<json>(input, input + length, options, false);
  auto stored = fast_float::parse_number_string<json>(input, input + length, options, true);
  // JavaScript uses its separate prepared parser, outside the deferred route.
  if (!uint64_t(options.format & fast_float::detail::basic_javascript_fmt)) {
    fast_float::long_mantissa_input<C> resume = {nullptr, -1, -1, nullptr, false};
    auto scanned = fast_float::parse_number_string_for_conversion<json>(
        input, input + length, options, resume);
    ASSERT_EQ(stored.valid, scanned.valid);
    ASSERT_EQ(stored.too_many_digits, scanned.too_many_digits);
    EXPECT_EQ(stored.error, scanned.error);
    EXPECT_EQ(stored.lastmatch, scanned.lastmatch);
    EXPECT_EQ(stored.negative, scanned.negative);
    if (stored.valid && stored.too_many_digits) {
      EXPECT_EQ(stored.integer.ptr, resume.start_digits);
      EXPECT_EQ(int64_t(stored.integer.len() + stored.fraction.len()), resume.raw_digit_count);
      EXPECT_EQ(stored.lastmatch, resume.lastmatch);
      EXPECT_EQ(stored.negative, resume.negative);
      check_fused_long_result<float>(stored, resume, options.decimal_point);
      check_fused_long_result<double>(stored, resume, options.decimal_point);
    } else {
      EXPECT_EQ(stored.mantissa, scanned.mantissa);
      EXPECT_EQ(stored.exponent, scanned.exponent);
      EXPECT_EQ(nullptr, resume.start_digits);
      EXPECT_EQ(int64_t(-1), resume.raw_digit_count);
      EXPECT_EQ(int64_t(-1), resume.exponent);
      EXPECT_EQ(nullptr, resume.lastmatch);
      EXPECT_FALSE(resume.negative);
    }
  }
  if (expect_long) {
    ASSERT_TRUE(stored.valid);
    ASSERT_TRUE(stored.too_many_digits);
    ASSERT_TRUE(omitted.too_many_digits);
    ASSERT_EQ(input + length, stored.lastmatch);
  }
  ASSERT_EQ(stored.valid, omitted.valid);
  if (!stored.valid || !stored.too_many_digits) {
    return;
  }
  EXPECT_TRUE(omitted.too_many_digits);
  EXPECT_EQ(stored.mantissa, omitted.mantissa);
  EXPECT_EQ(stored.exponent, omitted.exponent);
  EXPECT_EQ(stored.negative, omitted.negative);
  EXPECT_EQ(stored.lastmatch, omitted.lastmatch);
  EXPECT_EQ(stored.integer.ptr, omitted.integer.ptr);
  EXPECT_EQ(stored.integer.len(), omitted.integer.len());
  EXPECT_EQ(stored.fraction.ptr, omitted.fraction.ptr);
  EXPECT_EQ(stored.fraction.len(), omitted.fraction.len());
}

template <typename C>
static void check_long_mantissa_spans() {
  fast_float::parse_options_t<C> general(fast_float::chars_format::general);
  for (const char* text : {
      "123456789012345678901234567890.12345678901234567890e-31",
      ".00000000000000000000123456789012345678901234567890e+25",
      "0.123456789012345678901234567890e-99999999999999999999",
      "123456789012345678901234567890.e+4"}) {
    check_long_mantissa_spans<false>(text, general, true);
  }
  // A digit used as the point character is still consumed by the integer scan.
  // Zeroes after its leading '1' must remain part of the prefix scale.
  const char text[] = "1000002222222222222222222222222";
  C input[sizeof(text) - 1];
  for (size_t i = 0; i < ARRAY_SIZE(input); ++i) {
    input[i] = C(text[i]);
  }
  fast_float::parse_options_t<C> digit_point(fast_float::chars_format::general, C('1'));
  fast_float::long_mantissa_input<C> resume;
  auto scanned = fast_float::parse_number_string_for_conversion<false>(
      input, input + ARRAY_SIZE(input), digit_point, resume);
  ASSERT_TRUE(scanned.valid);
  ASSERT_TRUE(scanned.too_many_digits);
  EXPECT_EQ(input, resume.start_digits);
  EXPECT_EQ(int64_t(31), resume.raw_digit_count);
  EXPECT_EQ(int64_t(0), resume.exponent);
  EXPECT_EQ(input + ARRAY_SIZE(input), resume.lastmatch);
  EXPECT_FALSE(resume.negative);
  for (bool store_spans : {false, true}) {
    auto parsed = fast_float::parse_number_string<false>(
        input, input + ARRAY_SIZE(input), digit_point, store_spans);
    ASSERT_TRUE(parsed.valid);
    EXPECT_TRUE(parsed.too_many_digits);
    EXPECT_TRUE(!parsed.negative);
    EXPECT_EQ(fast_float::parse_error::no_error, parsed.error);
    EXPECT_EQ(uint64_t(1000002222222222222), parsed.mantissa);
    EXPECT_EQ(int64_t(12), parsed.exponent);
    EXPECT_EQ(input + ARRAY_SIZE(input), parsed.lastmatch);
    EXPECT_EQ(input, parsed.integer.ptr);
    EXPECT_EQ(ARRAY_SIZE(input), parsed.integer.len());
    EXPECT_EQ(nullptr, parsed.fraction.ptr);
    EXPECT_EQ(size_t(0), parsed.fraction.len());
    check_fused_long_result<float>(parsed, resume, C('1'));
    check_fused_long_result<double>(parsed, resume, C('1'));
  }
  const fast_float::chars_format formats[] = {
    fast_float::chars_format::general, fast_float::chars_format::fixed,
    fast_float::chars_format::scientific, fast_float::chars_format::json,
    fast_float::chars_format::javascript, fast_float::chars_format::fortran
  };
  const char* inputs[] = {
    "0", "-0", "0000000000000000000000000000000000000", "16777217",
    "9007199254740993", "1.2345678901234567", ".", "1e+",
    "123456789012345678901234567890123456789", "-123456789012345678901234567890",
    "00000000000000000000123456789012345678901234567890",
    "123456789012345678901234567890.12345678901234567890e-31",
    ".00000000000000000000123456789012345678901234567890e+25",
    "0.123456789012345678901234567890e-99999999999999999999",
    "123456789012345678901234567890.e+4", "123456789012345678901234567890e+",
    "123456789012345678901234567890x", "123456789012345678901234567890D-4",
    "123456789012345678901234567890.", "123456789012345678901234567890.e+",
    "123456789012345678901234567890+12345678901234567890",
    "123456789012345678901234567890,12345678901234567890e-20"
  };
  for (auto format : formats) {
    for (C point : {C('.'), C(','), C('e'), C('D'), C('+'), C('0'), C('x')}) {
      fast_float::parse_options_t<C> options(format, point);
      for (const char* input : inputs) {
        if (format == fast_float::chars_format::json) {
          check_long_mantissa_spans<true>(input, options);
        } else {
          check_long_mantissa_spans<false>(input, options);
        }
      }
    }
  }
}

TEST(FastFloat, long_mantissa_spans) {
  check_long_mantissa_spans<char>();
  check_long_mantissa_spans<char16_t>();
  check_long_mantissa_spans<char32_t>();
  check_long_mantissa_spans<wchar_t>();
}

template <typename C>
static void check_fast_float_decimal_bounds(C* input, int length, int coder) {
  struct Halfway {
    const char* text;
    double tie_float;
    double above_float;
    double tie_double;
    double above_double;
  };
  const Halfway cases[] = {
    {"1.000000059604644775390625", 1.0, double(std::nextafter(1.0f, 2.0f)),
     0x1.000001p0, 0x1.000001p0},
    {"1.00000000000000011102230246251565404236316680908203125", 1.0, 1.0,
     1.0, std::nextafter(1.0, 2.0)}
  };
  for (int ix = 1; ix <= 2; ++ix) {
    for (const auto& halfway : cases) {
      int digits = int(strlen(halfway.text));
      for (int negative = 0; negative <= 1; ++negative) {
        for (const char* tail : {"", "e0", "e+0", "e-0", "e", "e+", "e-", "x", "."}) {
          int tail_length = int(strlen(tail));
          if (length <= negative + digits + tail_length) {
            continue;
          }
          for (int sticky = 0; sticky <= 1; ++sticky) {
            if (negative) {
              input[0] = C('-');
            }
            for (int i = 0; i < digits; ++i) {
              input[negative + i] = C(halfway.text[i]);
            }
            for (int i = negative + digits; i < length - tail_length; ++i) {
              input[i] = C('0');
            }
            input[length - tail_length - 1] = C('0' + sticky);
            for (int i = 0; i < tail_length; ++i) {
              input[length - tail_length + i] = C(tail[i]);
            }
            double value = FastFloat::parse(input, length << coder, coder, ix);
            bool valid_tail = tail_length == 0 || tail[tail_length - 1] == '0';
            if (length > FastFloat::max_input_length || !valid_tail) {
              EXPECT_TRUE(std::isnan(value));
            } else {
              double expected = ix == 1
                  ? (sticky ? halfway.above_float : halfway.tie_float)
                  : (sticky ? halfway.above_double : halfway.tie_double);
              EXPECT_EQ(negative ? -expected : expected, value);
            }
            if (sizeof(C) > 1) {
              for (C invalid : {C(0x130), C(0xd800)}) {
                input[length - tail_length - 1] = invalid;
                EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
              }
            }
          }
        }
      }
    }
    if (length < 32) {
      continue;
    }
    // A late point or exponent follows an already long integer span.
    for (const char* point : {"", ".", ".0"}) {
      int prefix = length - 8;
      input[0] = C('1');
      for (int i = 1; i < prefix; ++i) {
        input[i] = C('0');
      }
      int tail = prefix;
      for (int i = 0; point[i] != '\0'; ++i) {
        input[tail++] = C(point[i]);
      }
      input[tail++] = C('e');
      input[tail++] = C('-');
      int exponent = prefix - 1;
      for (int i = length - 1; i >= tail; --i) {
        input[i] = C('0' + exponent % 10);
        exponent /= 10;
      }
      ASSERT_EQ(0, exponent);
      double value = FastFloat::parse(input, length << coder, coder, ix);
      if (length > FastFloat::max_input_length) {
        EXPECT_TRUE(std::isnan(value));
      } else {
        EXPECT_EQ(1.0, value);
      }
    }
  }
}

template <typename C>
static void check_fast_float_bounds(C* input, int length, int coder) {
  check_fast_float_decimal_bounds(input, length, coder);
  for (int ix = 1; ix <= 2; ++ix) {
    for (int i = 0; i < length; ++i) {
      input[i] = C('0');
    }
    if (length > 0) {
      input[length - 1] = C('1');
    }
    double value = FastFloat::parse(input, length << coder, coder, ix);
    if (length == 0 || length > FastFloat::max_input_length) {
      EXPECT_TRUE(std::isnan(value));
      continue;
    }
    EXPECT_EQ(1.0, value);
    input[length - 1] = C('x');
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    input[length - 1] = C(0xff);
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    if (sizeof(C) > 1) {
      input[length - 1] = C(0x130);
      EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    }
    for (int i = 0; i < length; ++i) {
      input[i] = C(' ');
    }
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    input[length - 1] = C('+');
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    input[length - 1] = C('f');
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    if (length >= 3) {
      input[length - 3] = C('1');
      input[length - 2] = C(' ');
      EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    }
    for (int i = 0; i < length; ++i) {
      input[i] = C('9');
    }
    EXPECT_GT(FastFloat::parse(input, length << coder, coder, ix), 0.0);
    input[length - 1] = C('x');
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    if (sizeof(C) > 1) {
      input[length - 1] = C(0x130);
      EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    }
    for (int i = 0; i < length; ++i) {
      input[i] = C('0');
    }
    if (length >= 2) {
      input[0] = C('-');
      input[length - 1] = C('0');
      value = FastFloat::parse(input, length << coder, coder, ix);
      EXPECT_EQ(0.0, value);
      EXPECT_TRUE(std::signbit(value));
    }
  }
}

TEST_VM(FastFloat, input_bounds) {
  const size_t page = os::vm_page_size();
  char* memory = os::reserve_memory(3 * page, mtTest);
  ASSERT_NE(nullptr, memory);
  ASSERT_TRUE(os::commit_memory(memory + page, page, false));
  const int edges[] = {63, 64, 65, 127, 128, 129, 1023, 1024, 1025};
  // Leave inaccessible pages before and after the input, without padding it.
  for (int coder = 0; coder <= 1; ++coder) {
    for (int edge = 0; edge < 49 + int(ARRAY_SIZE(edges)); ++edge) {
      int length = edge < 49 ? edge : edges[edge - 49];
      ASSERT_LE(size_t(length << coder), page);
      for (int end = 0; end <= 1; ++end) {
        char* input = memory + page + (end ? page - (length << coder) : 0);
        if (coder == 0) {
          check_fast_float_bounds(input, length, coder);
        } else {
          check_fast_float_bounds(reinterpret_cast<char16_t*>(input), length, coder);
        }
      }
    }
  }
  EXPECT_TRUE(os::release_memory(memory, 3 * page));
}
