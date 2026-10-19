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

// Primitive-only, allocation-free Rust 1.99 unstable sort. No unwinding across C ABI.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn rust_i32(p: *mut i32, n: usize) {
    unsafe { std::slice::from_raw_parts_mut(p, n).sort_unstable() }
}
#[unsafe(no_mangle)]
pub unsafe extern "C" fn rust_i64(p: *mut i64, n: usize) {
    unsafe { std::slice::from_raw_parts_mut(p, n).sort_unstable() }
}
