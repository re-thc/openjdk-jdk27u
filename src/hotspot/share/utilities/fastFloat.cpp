/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

#include "classfile/javaClasses.hpp"
#include "utilities/fast_float/fast_float.h"
#include "utilities/fastFloat.hpp"

#include <limits>

namespace {

template <typename T, typename C>
double parse_java_decimal(const C* first, const C* last) {
  while (first != last && static_cast<unsigned int>(*first) <= ' ') {
    ++first;
  }
  while (first != last && static_cast<unsigned int>(last[-1]) <= ' ') {
    --last;
  }
  if (first != last && (last[-1] == C('f') || last[-1] == C('F') ||
                        last[-1] == C('d') || last[-1] == C('D'))) {
    --last;
  }
  const auto format = fast_float::chars_format::general |
                      fast_float::chars_format::allow_leading_plus |
                      fast_float::chars_format::no_infnan;
  T result;
  auto parsed = fast_float::from_chars(first, last, result, format);
  // Java specifies correctly rounded infinities and signed zeros on range errors.
  if (parsed.ptr == last && (parsed.ec == std::errc() ||
                            parsed.ec == std::errc::result_out_of_range)) {
    return result;
  }
  return std::numeric_limits<double>::quiet_NaN();
}

template <typename C>
double parse_java_decimal(const void* value, int length, int ix) {
  const C* first = static_cast<const C*>(value);
  return ix == 1 ? parse_java_decimal<float>(first, first + length)
                 : parse_java_decimal<double>(first, first + length);
}

template <typename T, typename C>
int64_t parse_java_integer(const C* first, const C* last) {
  // Java accepts one leading plus, but no whitespace, suffix or base prefix.
  if (first != last && *first == C('+')) {
    ++first;
    if (first != last && (*first == C('+') || *first == C('-'))) {
      return INT64_MIN;
    }
  }
  T value;
  auto parsed = fast_float::from_chars(first, last, value, 10);
  if (parsed.ec != std::errc() || parsed.ptr != last) {
    return INT64_MIN;
  }
  uint64_t bits = uint64_t(value);
  int64_t result;
  memcpy(&result, &bits, sizeof(result));
  return result;
}

template <typename C>
int64_t parse_java_integer(const void* value, int length, int mode) {
  const C* first = static_cast<const C*>(value);
  const C* last = first + length;
  switch (mode) {
    case 0: return parse_java_integer<int32_t>(first, last);
    case 1: return parse_java_integer<int64_t>(first, last);
    case 2: return parse_java_integer<uint32_t>(first, last);
    case 3: return parse_java_integer<uint64_t>(first, last);
    default: return INT64_MIN;
  }
}

} // namespace

double FastFloat::parse(const void* value, int byte_length, int coder, int ix) {
  int length = byte_length >> coder;
  if (length > max_input_length) {
    return std::numeric_limits<double>::quiet_NaN();
  }
  return coder == java_lang_String::CODER_LATIN1
      ? parse_java_decimal<char>(value, length, ix)
      : parse_java_decimal<char16_t>(value, length, ix);
}

int64_t FastFloat::parse_integer(const void* value, int byte_length, int coder, int mode) {
  int length = byte_length >> coder;
  if (length <= 0 || length > max_input_length) {
    return INT64_MIN;
  }
  return coder == java_lang_String::CODER_LATIN1
      ? parse_java_integer<char>(value, length, mode)
      : parse_java_integer<char16_t>(value, length, mode);
}

// DecimalFormat's DigitList supplies a decimal point position separately.
// Parse the original digit buffer and adjust its exponent without copying or
// formatting an exponent. from_chars_advanced accepts this tokenized form.
double FastFloat::parse_digits(const void* digits, int length, int decimal_exponent) {
  if (length <= 0 || length > 768) {
    return std::numeric_limits<double>::quiet_NaN();
  }
  const char* first = static_cast<const char*>(digits);
  const char* last = first + length;
  // This entry accepts trusted ASCII digits, not Java's String grammar.
  // Use fast_float's eight-digit primitive to tokenize only the significant
  // prefix. The complete span is retained for exact rounding of long inputs.
  const char* significant = first;
  while (significant != last && *significant == '0') {
    ++significant;
  }
  int count = MIN2(int(last - significant), 19);
  const char* end = significant + count;
  const char* cursor = significant;
  uint64_t mantissa = 0;
  while (end - cursor >= 8) {
    mantissa = mantissa * 100000000 + fast_float::parse_eight_digits_unrolled(cursor);
    cursor += 8;
  }
  while (cursor != end) {
    mantissa = mantissa * 10 + (*cursor++ - '0');
  }
  fast_float::parsed_number_string parsed;
  parsed.mantissa = mantissa;
  parsed.exponent = int64_t(decimal_exponent) - (end - first);
  parsed.too_many_digits = last - significant > 19;
  parsed.integer = fast_float::span<const char>(first, length);
  parsed.lastmatch = last;
  parsed.valid = true;
  double result;
  auto converted = fast_float::from_chars_advanced(parsed, result);
  return converted.ec == std::errc() || converted.ec == std::errc::result_out_of_range
      ? result : std::numeric_limits<double>::quiet_NaN();
}
