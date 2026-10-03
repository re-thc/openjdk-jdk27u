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

#ifndef SHARE_RUNTIME_TMFYTOOLING_HPP
#define SHARE_RUNTIME_TMFYTOOLING_HPP

#include "jni.h"
#include "memory/allStatic.hpp"
#include "tmfy/tmfyKernelCatalogue.hpp"
#include "runtime/atomic.hpp"
#include "utilities/globalDefinitions.hpp"

class JavaThread;
class Klass;
class Method;

// Feature-local, permanent revocation of TmfyStringCoding leaf code. Revocation must
// finish before a native binding or NativeMethodBind capability is published.
class TmfyStringCodingTooling : AllStatic {
 private:
#define TMFY_SLOT(name, shape, helper, bound, audited) slot_##name,
  enum { TMFY_KERNELS_DO(TMFY_SLOT) kernel_count };
#undef TMFY_SLOT
  static Atomic<uint8_t> _revoked;
  // Bootstrap classes cannot unload. Stable JNI method IDs also follow class
  // redefinition, unlike retaining unrooted raw Method* values indefinitely.
  static jmethodID _methods[kernel_count];
  enum Owner { string_owner, charset_owner, owner_count, no_owner = -1 };
  static const JNINativeMethod* _initial_table[owner_count];
  static JavaThread* _initial_thread[owner_count];
  static int _initial_count[owner_count];
  static bool _initial_registration_available[owner_count];
  static Owner bindings_owner(Klass* klass);
  static bool is_bindings_class(Klass* klass);
  static bool contains_catalogue_method(Owner owner, const JNINativeMethod* methods, int count);

 public:
  static bool revoked() { return _revoked.load_acquire() != 0; }
  static address revoked_address() {
    return reinterpret_cast<address>(&_revoked) + _revoked.value_offset_in_bytes();
  }

  // Called by the trusted registration bridge in VM state, before its
  // ThreadToNativeFromVM. Each holder's first exact table/thread gets an exemption;
  // repeat bridge calls permanently revoke leaf support.
  static bool prepare_registration(Klass* klass, const JNINativeMethod* methods, int count);
  // Also called from ciEnv before a leaf caller can install, without relying on
  // initialization having reached the registration bridge. Requires VM state.
  static void record_method(Method* method);
  static void before_register(Klass* klass, const JNINativeMethod* methods, int count);
  static void before_unregister(Klass* klass);
  // Safe before threads/Universe exist. Otherwise requires a JavaThread in VM
  // state and no externally held locks; performs a synchronous deopt handshake.
  static void revoke();
};

#endif // SHARE_RUNTIME_TMFYTOOLING_HPP
