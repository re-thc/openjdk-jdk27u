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

#ifndef OS_WINDOWS_HEADLESS_MESSAGE_BOX_HPP
#define OS_WINDOWS_HEADLESS_MESSAGE_BOX_HPP

// Windows API declarations and strlen are supplied by the including file.
// Error handling must also work before VM initialization and for JNI callers
// without a console. A redirected stdin must never stall a failing service.
inline bool headless_message_box(const char* title, const char* message) {
  HANDLE output = GetStdHandle(STD_ERROR_HANDLE);
  DWORD written;
  WriteFile(output, title, (DWORD)strlen(title), &written, nullptr);
  WriteFile(output, "\r\n", 2, &written, nullptr);
  WriteFile(output, message, (DWORD)strlen(message), &written, nullptr);
  WriteFile(output, "\r\n", 2, &written, nullptr);

  HANDLE input = GetStdHandle(STD_INPUT_HANDLE);
  DWORD mode;
  if (!GetConsoleMode(input, &mode)) {
    return false;
  }
  const char prompt[] = "Enter y or N: ";
  WriteFile(output, prompt, sizeof(prompt) - 1, &written, nullptr);
  char answer[16];
  DWORD count;
  return ReadFile(input, answer, sizeof(answer), &count, nullptr) && count > 0 &&
         (answer[0] == 'y' || answer[0] == 'Y');
}

#endif // OS_WINDOWS_HEADLESS_MESSAGE_BOX_HPP
