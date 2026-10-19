/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

#include <cstdint>
#include "x86simdsort-static-incl.h"
#ifndef XSS_NAME
#define XSS_NAME xss2
#endif
#define CAT_(a,b) a##b
#define CAT(a,b) CAT_(a,b)
extern "C" void CAT(XSS_NAME,_i32)(int32_t* p, size_t n) { x86simdsortStatic::qsort(p,n); }
extern "C" void CAT(XSS_NAME,_i64)(int64_t* p, size_t n) { x86simdsortStatic::qsort(p,n); }
