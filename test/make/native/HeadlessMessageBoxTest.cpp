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

// Test the production Windows diagnostic helper with deterministic console IO.
#include <cassert>
#include <cstring>
#include <string>
using DWORD = unsigned long;
using HANDLE = int;
constexpr int STD_ERROR_HANDLE = -12;
constexpr int STD_INPUT_HANDLE = -10;
static bool console;
static bool read_ok;
static bool write_ok;
static int reads;
static std::string reply;
static std::string output;
static HANDLE GetStdHandle(int kind) { return kind; }
static bool GetConsoleMode(HANDLE, DWORD* mode) { *mode = 0; return console; }
static bool WriteFile(HANDLE, const void* data, DWORD size, DWORD* count, void*) {
  output.append(static_cast<const char*>(data), size);
  *count = size;
  return write_ok;
}
static bool ReadFile(HANDLE, void* data, DWORD size, DWORD* count, void*) {
  ++reads;
  *count = reply.size() < size ? reply.size() : size;
  memcpy(data, reply.data(), *count);
  return read_ok;
}
#include "headless_message_box.hpp"

int main() {
  write_ok = read_ok = true;
  console = false;
  reply = "y\n";
  assert(!headless_message_box("JNI error", "diagnostic preserved"));
  assert(reads == 0);
  assert(output == "JNI error\r\ndiagnostic preserved\r\n");
  console = true;
  for (const char* answer : {"y\n", "Y\n", "n\n", "\n", "", "yes\n"}) {
    reply = answer;
    bool expected = reply.size() > 0 && (reply[0] == 'y' || reply[0] == 'Y');
    assert(headless_message_box("Error", "message") == expected);
  }
  read_ok = false;
  assert(!headless_message_box("Error", "message"));
  console = false;
  write_ok = false; // JNI caller without standard handles still returns promptly.
  reads = 0;
  assert(!headless_message_box("Error", "message"));
  assert(reads == 0);
}
