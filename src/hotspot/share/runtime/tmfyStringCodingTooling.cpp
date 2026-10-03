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

#include "runtime/tmfyStringCodingTooling.hpp"

#include "code/codeCache.hpp"
#include "memory/universe.hpp"
#include "oops/klass.inline.hpp"
#include "oops/instanceKlass.hpp"
#include "oops/method.hpp"
#include "oops/symbol.hpp"
#include "runtime/deoptimization.hpp"
#include "runtime/handles.inline.hpp"
#include "runtime/handshake.hpp"
#include "runtime/javaThread.hpp"
#include "runtime/mutexLocker.hpp"
#include "runtime/tmfyStringCoding.hpp"
#include "runtime/vmThread.hpp"

Atomic<uint8_t> TmfyStringCodingTooling::_revoked{0};
Atomic<uint8_t> TmfyStringCodingTooling::_cold_admission_revoked{0};
jmethodID TmfyStringCodingTooling::_methods[TmfyStringCodingTooling::kernel_count] = {};
const JNINativeMethod* TmfyStringCodingTooling::_initial_table = nullptr;
JavaThread* TmfyStringCodingTooling::_initial_thread = nullptr;
int TmfyStringCodingTooling::_initial_count = 0;
bool TmfyStringCodingTooling::_initial_registration_available = false;

bool TmfyStringCodingTooling::is_bindings_class(Klass* klass) {
  return klass->is_instance_klass() && klass->class_loader() == nullptr &&
         klass->name()->equals("java/lang/StringCoding");
}

bool TmfyStringCodingTooling::contains_catalogue_method(const JNINativeMethod* methods, int count) {
#define TMFY_DESCRIPTOR_output "([BII[BII)I"
  for (int i = 0; i < count; ++i) {
    if (strcmp(methods[i].name, "registerNatives") == 0 &&
        strcmp(methods[i].signature, "()Z") == 0) return true;
#define TMFY_MATCH(kernel_name, shape, helper, bound, audited) \
    if (strcmp(methods[i].name, #kernel_name "0") == 0 && \
        strcmp(methods[i].signature, TMFY_DESCRIPTOR_##shape) == 0) return true;
    TMFY_KERNELS_DO(TMFY_MATCH)
#undef TMFY_MATCH
  }
#undef TMFY_DESCRIPTOR_output
  return false;
}

void TmfyStringCodingTooling::record_method(Method* method) {
  JavaThread* thread = JavaThread::current();
  assert(thread->thread_state() == _thread_in_vm, "VM state required");
  methodHandle mh(thread, method);
  int slot;
  switch (method->intrinsic_id()) {
#define TMFY_METHOD_SLOT(name, shape, helper, bound, audited) \
    case vmIntrinsics::_tmfy_##name: slot = slot_##name; break;
    TMFY_KERNELS_DO(TMFY_METHOD_SLOT)
#undef TMFY_METHOD_SLOT
    default: ShouldNotReachHere(); return;
  }
  assert(is_bindings_class(method->method_holder()), "only bootstrap TmfyStringCoding methods");
  // Allocate outside Compile_lock, with a handle protecting the method. The
  // compiler may arrive here while another thread redefines the class.
  jmethodID id = mh->jmethod_id();
  MutexLocker ml(Compile_lock);
  if (mh->is_old()) return; // evol_method installation checks reject this compile.
  Method* existing = _methods[slot] == nullptr ? nullptr :
                     Method::checked_resolve_jmethod_id(_methods[slot]);
  if (existing == nullptr || existing->is_old()) {
    _methods[slot] = id;
  } else {
    assert(existing == mh(), "one current method per catalogue slot");
  }
}

bool TmfyStringCodingTooling::prepare_registration(Klass* klass, const JNINativeMethod* methods, int count) {
  guarantee(is_bindings_class(klass), "only the bootstrap TmfyStringCoding bindings may register");
  JavaThread* thread = JavaThread::current();
  assert(thread->thread_state() == _thread_in_vm, "VM state required");
  int found = 0;
  InstanceKlass* ik = InstanceKlass::cast(klass);
  for (int i = 0; i < ik->methods()->length(); ++i) {
    methodHandle method(thread, ik->methods()->at(i));
    if (TmfyStringCoding::is_intrinsic(method->intrinsic_id())) {
      guarantee(found < kernel_count, "unexpected TmfyStringCoding method count");
      ++found;
    }
  }
  if (found != kernel_count) {
    // A transformer/native-prefix agent may replace an intrinsic native method
    // with a wrapper. Disable intrinsic bypasses, but let RegisterNatives bind
    // the prefixed native through Method::register_native as usual.
    revoke();
    return true;
  }
  bool repeated;
  {
    MutexLocker ml(Compile_lock);
    repeated = _initial_table != nullptr;
    if (repeated) {
      // Reflection may invoke the private registration bridge again. Treat it
      // as an ordinary rebind, retaining stable IDs and never granting another
      // bootstrap exemption, even if the first registration is still running.
      _initial_registration_available = false;
      _initial_thread = nullptr;
    } else {
      _initial_table = methods;
      _initial_count = count;
      _initial_thread = thread;
      _initial_registration_available = true;
    }
  }
  if (repeated) revoke();
  return true;
}

void TmfyStringCodingTooling::before_register(Klass* klass, const JNINativeMethod* methods, int count) {
  if (!is_bindings_class(klass) || !contains_catalogue_method(methods, count)) return;
  {
    MutexLocker ml(Compile_lock);
    if (_initial_registration_available && methods == _initial_table &&
        count == _initial_count && JavaThread::current() == _initial_thread) {
      _initial_registration_available = false;
      _initial_thread = nullptr;
      return;
    }
  }
  revoke();
}

void TmfyStringCodingTooling::before_unregister(Klass* klass) {
  if (is_bindings_class(klass)) revoke();
}

void TmfyStringCodingTooling::revoke_cold_admission() {
#if defined(AMD64) && !defined(ZERO)
  _cold_admission_revoked.release_store(1);
  if (!Universe::is_fully_initialized() || VMThread::vm_thread() == nullptr ||
      !VMThread::vm_thread()->is_running()) return;
  assert(JavaThread::current()->thread_state() == _thread_in_vm, "VM state required");
  // No origin shortcut calls into the VM before its next dispatch poll. Drain
  // any thread that read the old byte before publishing the new observation.
  // Every enabler must wait, even if another revoker already stored the flag.
  class DrainColdAdmission : public HandshakeClosure {
   public:
    DrainColdAdmission() : HandshakeClosure("DrainStringUtf8ColdAdmission") {}
    void do_thread(Thread* thread) override { }
  } drain;
  Handshake::execute(&drain);
#endif
}

void TmfyStringCodingTooling::revoke() {
  revoke_cold_admission();
  if (!Universe::is_fully_initialized()) {
    // Agent_OnLoad runs before Java threads, compilation and Compile_lock exist.
    // Publishing the sticky flag prevents later interpreter/compiler admission.
    _revoked.release_store(1);
    return;
  }
  assert(JavaThread::current()->thread_state() == _thread_in_vm, "VM state required");
  DeoptimizationScope deopt_scope;
  {
    MutexLocker ml(Compile_lock);
    // ciEnv installation checks this flag under the same lock. A compilation
    // admitted earlier cannot publish a new leaf caller after this store.
    _revoked.release_store(1);
    for (int i = 0; i < kernel_count; ++i) {
      if (_methods[i] != nullptr) {
        Method* method = Method::checked_resolve_jmethod_id(_methods[i]);
        // Redefinition already invalidates callers of deleted/obsolete methods.
        if (method != nullptr) CodeCache::mark_for_deoptimization(&deopt_scope, method);
      }
    }
  }
  // Never return early merely because another revoker set the flag. Re-marking
  // dependent nmethods records their pending deoptimization generation; this
  // scope waits for that generation even if another thread performs the work.
  // Release Compile_lock before a handshake that can block/safepoint.
  deopt_scope.deoptimize_marked();
}
