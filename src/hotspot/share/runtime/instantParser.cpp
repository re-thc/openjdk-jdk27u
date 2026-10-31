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
 */

#include "jvm.h"
#include "runtime/instantParser.hpp"
#include "runtime/interfaceSupport.inline.hpp"

Atomic<void*> InstantParser::_parser(nullptr);

void InstantParser::register_parser(void* parser) {
  _parser.release_store(parser);
}

JVM_LEAF(void, JVM_RegisterInstantParser(void* parser))
  InstantParser::register_parser(parser);
JVM_END

JRT_LEAF(jlong, InstantParser::parse(address bytes, jint byte_length, jint coder))
  typedef int64_t (*Parser)(const uint8_t*, size_t);
  Parser parser = CAST_TO_FN_PTR(Parser, InstantParser::_parser.load_acquire());
  if (parser == nullptr) return min_jlong;
  if (coder == 0) return parser(bytes, byte_length);
  int length = byte_length / 2;
  if (length < 20 || length > 27) return min_jlong;
  // StringUTF16 storage uses native byte order. Narrow once; speedate owns
  // grammar and calendar validation. Non-ASCII input takes the Java fallback.
  const jchar* chars = reinterpret_cast<const jchar*>(bytes);
  uint8_t ascii[27];
  for (int i = 0; i < length; i++) {
    if (chars[i] > 0x7f) return min_jlong;
    ascii[i] = static_cast<uint8_t>(chars[i]);
  }
  return parser(ascii, length);
JRT_END
