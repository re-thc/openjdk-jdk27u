/*
 * Copyright (c) 2015, 2019, Red Hat, Inc. All rights reserved.
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

#ifndef SHARE_GC_SHENANDOAH_SHENANDOAHFORWARDING_INLINE_HPP
#define SHARE_GC_SHENANDOAH_SHENANDOAHFORWARDING_INLINE_HPP

#include "gc/shenandoah/shenandoahForwarding.hpp"

#include "gc/shenandoah/shenandoahAsserts.hpp"
#include "oops/klass.hpp"
#include "oops/markWord.hpp"
#include "runtime/javaThread.hpp"

inline oop ShenandoahForwarding::get_forwardee_raw(oop obj) {
  shenandoah_assert_in_heap_bounds(nullptr, obj);
  return get_forwardee_raw_unchecked(obj);
}

static HeapWord* to_forwardee(markWord mark) {
  return reinterpret_cast<HeapWord*>(mark.clear_lock_bits().to_pointer());
}

inline bool ShenandoahForwarding::has_forwardee(markWord m) {
  // Lock bits == marked_value (0b11): the upper bits encode a forwardee
  // pointer. Matches normal-forwarded (0b011) and forward-expanded (0b111);
  // excludes self-forwarded (0b100, 0b101, 0b110).
  return (m.value() & markWord::lock_mask_in_place) == markWord::marked_value;
}

inline oop ShenandoahForwarding::get_forwardee_raw_unchecked(oop obj) {
  // JVMTI and JFR code use mark words for marking objects for their needs.
  // On this path, we can encounter the "marked" object, but with null
  // fwdptr. That object is still not forwarded, and we need to return
  // the object itself.
  markWord mark = obj->mark();
  if (has_forwardee(mark)) {
    HeapWord* fwdptr = to_forwardee(mark);
    if (fwdptr != nullptr) {
      return cast_to_oop(fwdptr);
    }
  }
  // Self-forwarded (evacuation failure): the object stays put; the
  // self-fwd bit is set alongside normal lock bits.
  return obj;
}

inline oop ShenandoahForwarding::get_forwardee_mutator(oop obj) {
  // Same as above, but mutator thread cannot ever see null forwardee.
  shenandoah_assert_correct(nullptr, obj);
  assert(Thread::current()->is_Java_thread(), "Must be a mutator thread");

  markWord mark = obj->mark();
  if (has_forwardee(mark)) {
    HeapWord* fwdptr = to_forwardee(mark);
    assert(fwdptr != nullptr, "Forwarding pointer is never null here");
    return cast_to_oop(fwdptr);
  }
  // Self-forwarded or not forwarded: return the object itself.
  return obj;
}

inline oop ShenandoahForwarding::get_forwardee(oop obj) {
  shenandoah_assert_correct(nullptr, obj);
  return get_forwardee_raw_unchecked(obj);
}

inline bool ShenandoahForwarding::is_forwarded(oop obj) {
  return obj->mark().is_forwarded();
}

inline bool ShenandoahForwarding::is_self_forwarded(oop obj) {
  return obj->mark().is_self_forwarded();
}

inline oop ShenandoahForwarding::try_update_forwardee(oop obj, oop update, markWord old_mark) {
  assert(!old_mark.is_forwarded(), "copy must be sized from an unforwarded mark");
  markWord new_mark = markWord::encode_pointer_as_mark(update);
  if (UseFourByteObjectHeaders && old_mark.is_hashed_not_expanded()) {
    new_mark = markWord(new_mark.value() | FWDED_HASH_TRANSITION);
  }
  // Publish only if the header used to size and initialize the copy is unchanged.
  // In particular, a newly installed hash may require a larger allocation.
  markWord prev_mark = obj->cas_set_mark(new_mark, old_mark, memory_order_conservative);
  if (prev_mark == old_mark) {
    return update;
  }
  if (has_forwardee(prev_mark)) {
    return cast_to_oop(to_forwardee(prev_mark));
  }
  if (prev_mark.is_self_forwarded()) {
    return obj;
  }
  // A non-forwarding header change does not evacuate the object. The caller
  // must discard this copy and retry allocation and initialization.
  return nullptr;
}

inline oop ShenandoahForwarding::try_forward_to_self(oop obj, markWord old_mark) {
  assert(!old_mark.is_forwarded(),
         "caller must pass a non-forwarded mark: old=" INTPTR_FORMAT, old_mark.value());
  while (true) {
    markWord new_mark = old_mark.set_self_forwarded();
    markWord prev_mark = obj->cas_set_mark(new_mark, old_mark, memory_order_conservative);
    if (prev_mark == old_mark) {
      return nullptr;
    }
    if (has_forwardee(prev_mark)) {
      return cast_to_oop(to_forwardee(prev_mark));
    }
    if (prev_mark.is_self_forwarded()) {
      return obj;
    }
    // Preserve any intervening lock, hash or field update when retrying.
    old_mark = prev_mark;
  }
}

inline Klass* ShenandoahForwarding::klass(oop obj) {
  if (UseCompactObjectHeaders) {
    markWord mark = obj->mark();
    if (has_forwardee(mark)) {
      oop fwd = cast_to_oop(to_forwardee(mark));
      mark = fwd->mark();
    }
    return mark.klass();
  } else {
    return obj->klass();
  }
}

inline size_t ShenandoahForwarding::size(oop obj) {
  if (!UseFourByteObjectHeaders) {
    Klass* k = klass(obj);
    return obj->size_given_mark_and_klass(obj->mark(), k);
  }
  markWord mark = obj->mark();
  if (has_forwardee(mark)) {
    oop fwd = cast_to_oop(to_forwardee(mark));
    markWord fwd_mark = fwd->mark();
    Klass* klass = fwd_mark.klass();
    size_t size = fwd->base_size_given_klass(fwd_mark, klass);
    if ((mark.value() & FWDED_HASH_TRANSITION) != FWDED_HASH_TRANSITION) {
      if (fwd_mark.is_expanded() && klass->expand_for_hash(fwd, fwd_mark)) {
        size = oopDesc::hash_expanded_size(size);
      }
    }
    return size;
  } else {
    Klass* klass = mark.klass();
    return obj->size_given_mark_and_klass(mark, klass);
  }
}

#endif // SHARE_GC_SHENANDOAH_SHENANDOAHFORWARDING_INLINE_HPP
