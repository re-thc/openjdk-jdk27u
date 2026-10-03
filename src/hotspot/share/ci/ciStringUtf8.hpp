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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#ifndef SHARE_CI_CISTRINGUTF8_HPP
#define SHARE_CI_CISTRINGUTF8_HPP

#include "memory/allStatic.hpp"

class ciEnv;
class ciMethod;

// Admission is optional and applies only to the validated original String
// Unicode regions. Java retains the original scalar route for this nmethod;
// Ready permits the compiler's measured size policy without doing setup.
class ciStringUtf8 : AllStatic {
 public:
  enum Admission { Ordinary, Java, Ready };
  static Admission admission(ciMethod* method, int guard_bci, ciEnv* env);
};

#endif // SHARE_CI_CISTRINGUTF8_HPP
