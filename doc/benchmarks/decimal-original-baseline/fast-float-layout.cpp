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

#include "fast_float/fast_float.h"
#include <chrono>
#include <cstdio>
#include <fstream>
#include <string>
#include <vector>

template <typename T>
int run(const std::vector<std::string>& inputs) {
  double checksum = 0;
  const auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 200; ++i) {
    for (const auto& s : inputs) {
      T value;
      auto parsed = fast_float::from_chars(s.data(), s.data() + s.size(), value);
      if (parsed.ec != std::errc() || parsed.ptr != s.data() + s.size()) {
        return 1;
      }
      checksum += value;
    }
  }
  double ns = std::chrono::duration<double, std::nano>(
      std::chrono::steady_clock::now() - start).count();
  std::printf("%zu\t%zu\t%.3f\t%.9f\n", sizeof(fast_float::parsed_number_string),
              inputs.size(), ns / (200 * inputs.size()), checksum);
  return 0;
}

int main(int argc, char** argv) {
  if (argc != 3 || (std::string(argv[2]) != "32" && std::string(argv[2]) != "64")) {
    std::fprintf(stderr, "Usage: %s <decimal-lines-file> <32|64>\n", argv[0]);
    return 1;
  }
  std::ifstream stream(argv[1]);
  if (!stream) {
    return 1;
  }
  std::vector<std::string> inputs;
  for (std::string s; std::getline(stream, s);) {
    if (!s.empty()) {
      inputs.push_back(s);
    }
  }
  if (inputs.empty()) {
    return 1;
  }
  return std::string(argv[2]) == "32" ? run<float>(inputs) : run<double>(inputs);
}
