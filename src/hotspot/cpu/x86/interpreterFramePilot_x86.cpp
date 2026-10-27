/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#include "interpreter/interpreterFramePilot.hpp"
#if defined(AMD64) && !defined(ZERO)
#include "asm/codeBuffer.hpp"
#include "interpreter/bytecodeStream.hpp"
#include "interpreter/interpreter.hpp"
#include "interpreter/templateTable.hpp"
#include "oops/method.inline.hpp"
#include "oops/instanceKlass.hpp"
#include "oops/methodCounters.hpp"
#include "prims/jvmtiExport.hpp"
#include "runtime/icache.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/javaThread.inline.hpp"
#include "runtime/os.hpp"
#include "runtime/mutexLocker.hpp"
#include "runtime/safepointVerifiers.hpp"
#include "runtime/safepoint.hpp"
#include "runtime/safepointMechanism.hpp"
#include "runtime/safepointMechanism.inline.hpp"
#include "runtime/signature.hpp"

namespace {
address arena=nullptr;
int next_slot=0;
Mutex* generation_lock=nullptr;
jlong blob_cpu=0,blob_wall=0,blob_bytes=0,arena_cpu=0,arena_wall=0;

template<bool Observe>
class CpuCut : public StackObj {
  jlong* _value; jlong _start;
 public:
  CpuCut(jlong* value):_value(value),_start(0) {
    if constexpr (Observe) _start=os::current_thread_cpu_time();
  }
  void stop() {
    if constexpr (Observe) {
      if(_value!=nullptr){*_value+=os::current_thread_cpu_time()-_start;_value=nullptr;}
    }
  }
  ~CpuCut(){stop();}
};
template<bool Observe>
class BufferCleanup : public StackObj {
  jlong* _stats; jlong& _start;
 public:
  BufferCleanup(jlong* stats,jlong& start):_stats(stats),_start(start){}
  ~BufferCleanup(){
    if constexpr (Observe) {
      if(_start!=0)_stats[InterpreterFramePilot::buffer_cleanup_cpu]+=os::current_thread_cpu_time()-_start;
    }
  }
};
constexpr int slot_size=4096;
constexpr int max_operations=64;
const Register rbcp=r13;
const Register rlocals=r14;
}

void InterpreterFramePilot::reserve() {
  assert(arena==nullptr,"startup only");
  jlong cpu=os::current_thread_cpu_time(),wall=os::javaTimeNanos();
  generation_lock=new Mutex(Mutex::nosafepoint,"InterpreterFramePilot",true);
  InterpreterCodelet* c=(InterpreterCodelet*)Interpreter::code()->request_committed(arena_size);
  guarantee(c!=nullptr,"bounded interpreter pilot arena");
  c->initialize("WhiteBox interpreter-frame integer prefixes",Bytecodes::_illegal);
  arena=c->code_begin();
  memset(arena,0xcc,arena_size);
  arena_cpu=os::current_thread_cpu_time()-cpu;arena_wall=os::javaTimeNanos()-wall;
}

void InterpreterFramePilot::record_blob_allocation(jlong cpu,jlong wall,int bytes) {
  blob_cpu=cpu;blob_wall=wall;blob_bytes=bytes;
}
void InterpreterFramePilot::startup_costs(jlong* stats) {
  stats[blob_allocation_cpu]=blob_cpu;stats[blob_allocation_wall]=blob_wall;stats[blob_requested_bytes]=blob_bytes;
  stats[arena_initialization_cpu]=arena_cpu;stats[arena_initialization_wall]=arena_wall;
}
void InterpreterFramePilot::snapshot(const methodHandle& method,jlong* stats) {
  if(generation_lock==nullptr)return;
  NoSafepointVerifier nsv;
  MutexLocker locker(generation_lock,Mutex::_no_safepoint_check_flag);
  MethodCounters* counters=method->method_counters();
  if(counters==nullptr || counters->method()!=method())return;
  stats[8]=(jlong)counters->interpreter_pilot_entry();stats[9]=counters->interpreter_pilot_hits();
  stats[10]=counters->interpreter_pilot_enabled();
}
bool InterpreterFramePilot::set_enabled(const methodHandle& method,bool enabled) {
  if(generation_lock==nullptr)return false;
  NoSafepointVerifier nsv;
  MutexLocker locker(generation_lock,Mutex::_no_safepoint_check_flag);
  MethodCounters* counters=method->method_counters();
  if(counters==nullptr || counters->method()!=method())return false;
  counters->enable_interpreter_pilot(enabled && counters->interpreter_pilot_entry()!=nullptr);
  return true;
}
bool InterpreterFramePilot::prepare(const methodHandle& method) {
  Thread* current=Thread::current();
  assert(SafepointSynchronize::is_at_safepoint() ||
         (current->is_Java_thread() && JavaThread::cast(current)->thread_state()==_thread_in_vm),"VM-state producer");
  if(generation_lock==nullptr)return false;
  NoSafepointVerifier nsv;
  ResourceMark rm;
  MutexLocker locker(generation_lock,Mutex::_no_safepoint_check_flag);
  return generate_locked<false>(method,nullptr);
}
bool InterpreterFramePilot::prepare(const methodHandle& method,jlong* stats) {
  Thread* current=Thread::current();
  assert(SafepointSynchronize::is_at_safepoint() ||
         (current->is_Java_thread() && JavaThread::cast(current)->thread_state()==_thread_in_vm),"VM-state producer");
  jlong cpu=os::current_thread_cpu_time(),wall=os::javaTimeNanos();
  stats[producer_thread_id]=os::current_thread_id();
  bool success=false;
  if(generation_lock!=nullptr) {
    NoSafepointVerifier nsv;
    jlong cleanup=0;
    {
      ResourceMark rm;
      size_t used=current->resource_area()->used(),capacity=current->resource_area()->size_in_bytes();
      {
        jlong lock_begin=os::current_thread_cpu_time(),lock_wall_begin=os::javaTimeNanos();
        MutexLocker locker(generation_lock,Mutex::_no_safepoint_check_flag);
        stats[lock_cpu]=os::current_thread_cpu_time()-lock_begin;
        stats[lock_wall]=os::javaTimeNanos()-lock_wall_begin;
        success=generate_locked<true>(method,stats);
        stats[resource_used_bytes]=current->resource_area()->used()-used;
        stats[resource_chunk_bytes]=current->resource_area()->size_in_bytes()-capacity;
      }
      cleanup=os::current_thread_cpu_time();
    }
    stats[resource_cleanup_cpu]=os::current_thread_cpu_time()-cleanup;
  }
  stats[1]=os::current_thread_cpu_time()-cpu;stats[2]=os::javaTimeNanos()-wall;
  return success;
}
bool InterpreterFramePilot::request_poll_test(const methodHandle& method) {
  if(!WhiteBoxAPI || !UseInterpreterFramePilot)return false;
  MethodCounters* counters=method->method_counters();
  if(counters==nullptr || counters->method()!=method() || !counters->interpreter_pilot_enabled() ||
     counters->interpreter_pilot_entry()==nullptr)return false;
  u1 state=counters->interpreter_pilot_poll_test();
  if(state!=test_poll_none && state!=test_poll_processed)return false;
  return counters->cas_interpreter_pilot_poll_test(state,test_poll_requested);
}
int InterpreterFramePilot::poll_test_state(const methodHandle& method) {
  MethodCounters* counters=method->method_counters();
  if(counters==nullptr || counters->method()!=method())return test_poll_none;
  return counters->interpreter_pilot_poll_test();
}
JRT_LEAF(void, InterpreterFramePilot::arm_test_poll(MethodCounters* counters))
  assert(WhiteBoxAPI && UseInterpreterFramePilot,"test-only entry");
  if(counters->cas_interpreter_pilot_poll_test(test_poll_requested,test_poll_armed)) {
    // Real word and page values, with no allocation, handshake enqueue, wait
    // or Java/VM transition that could consume the poll before the guard.
    SafepointMechanism::arm_local_poll_release(JavaThread::current());
  }
JRT_END
JRT_LEAF(void, InterpreterFramePilot::record_test_poll(Method* method,address bcp))
  assert(WhiteBoxAPI && UseInterpreterFramePilot,"test-only entry");
  MethodCounters* counters=method->method_counters();
  if(counters!=nullptr && counters->method()==method &&
     counters->interpreter_pilot_poll_test()==test_poll_guard_seen) {
    counters->set_interpreter_pilot_poll_test(bcp==method->code_base()?test_poll_processed:test_poll_wrong_bci);
  }
JRT_END
void InterpreterFramePilot::emit_test_poll_return(InterpreterMacroAssembler* masm) {
  assert(WhiteBoxAPI && UseInterpreterFramePilot,"test-only generation");
  Label done;
  masm->get_method(rbx);
  masm->movptr(rdx,Address(rbx,Method::method_counters_offset()));
  masm->testptr(rdx,rdx);masm->jcc(Assembler::zero,done);
  masm->cmpptr(rbx,Address(rdx,in_bytes(MethodCounters::method_offset())));
  masm->jcc(Assembler::notEqual,done);
  masm->cmpb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_poll_test_offset())),test_poll_guard_seen);
  masm->jcc(Assembler::notEqual,done);
  masm->push(rax);masm->push(rdx);masm->push(rbx);
  // call_VM has reset the JavaFrameAnchor. Pass the live interpreter Method
  // and BCP registers rather than trying to recover a last Java frame in C++.
  masm->call_VM_leaf(CAST_FROM_FN_PTR(address,record_test_poll),rbx,rbcp);
  masm->pop(rbx);masm->pop(rdx);masm->pop(rax);
  masm->bind(done);
}
void InterpreterFramePilot::emit_entry_guards(InterpreterMacroAssembler* masm,Label& fallback) {
  if(WhiteBoxAPI) {
    Label no_request;
    masm->cmpb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_poll_test_offset())),test_poll_requested);
    masm->jcc(Assembler::notEqual,no_request);
    masm->push(rax);masm->push(rdx);masm->push(rbx);
    masm->call_VM_leaf(CAST_FROM_FN_PTR(address,arm_test_poll),rdx);
    masm->pop(rbx);masm->pop(rdx);masm->pop(rax);
    masm->bind(no_request);
  }
  masm->testb(Address(r15_thread,JavaThread::polling_word_offset()),SafepointMechanism::poll_bit());
  if(WhiteBoxAPI) {
    Label not_armed,not_requested;
    masm->jcc(Assembler::zero,not_armed);
    masm->cmpb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_poll_test_offset())),test_poll_armed);
    masm->jcc(Assembler::notEqual,not_requested);
    masm->movb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_poll_test_offset())),test_poll_guard_seen);
    masm->bind(not_requested);
    masm->jmp(fallback);
    masm->bind(not_armed);
  } else {
    masm->jcc(Assembler::notZero,fallback);
  }
  masm->cmpl(Address(r15_thread,JavaThread::interp_only_mode_offset()),0);
  masm->jcc(Assembler::notEqual,fallback);
#if INCLUDE_JVMTI
  bool* const flags[]={&JvmtiExport::_can_access_local_variables,&JvmtiExport::_can_walk_any_space,
      &JvmtiExport::_can_get_owned_monitor_info,&JvmtiExport::_can_post_interpreter_events,
      &JvmtiExport::_can_post_on_exceptions,&JvmtiExport::_should_post_single_step,
      &JvmtiExport::_can_pop_frame,&JvmtiExport::_can_force_early_return,&JvmtiExport::_can_post_breakpoint};
  for (bool* flag:flags) {
    masm->movptr(rscratch1,(intptr_t)flag);
    masm->cmpb(Address(rscratch1,0),0);masm->jcc(Assembler::notEqual,fallback);
  }
  masm->cmpw(Address(rdx,in_bytes(MethodCounters::number_of_breakpoints_offset())),0);
  masm->jcc(Assembler::notEqual,fallback);
#endif
#ifdef ASSERT
  bool* const debug_flags[]={&TraceBytecodes,&CountBytecodes,&PrintBytecodeHistogram,&PrintBytecodePairHistogram};
  for (bool* flag:debug_flags) {
    masm->movptr(rscratch1,(intptr_t)flag);
    masm->cmpb(Address(rscratch1,0),0);masm->jcc(Assembler::notEqual,fallback);
  }
  masm->movptr(rscratch1,(intptr_t)&StopInterpreterAt);
  masm->cmpq(Address(rscratch1,0),0);masm->jcc(Assembler::notEqual,fallback);
#endif
  masm->incrementl(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_hits_offset())));
}
template<bool Observe>
bool InterpreterFramePilot::generate_locked(const methodHandle& method,jlong* stats) {
  assert(generation_lock->owned_by_self(),"serialized immutable slots and publication");
  CpuCut<Observe> analysis(Observe?&stats[analysis_cpu]:nullptr);
  if (!UseInterpreterFramePilot || arena==nullptr || next_slot+slot_size>arena_size) return false;
  Method* m=method();
  if (!m->method_holder()->is_linked() || !m->method_holder()->is_rewritten() || !m->is_static() || m->is_native() || m->is_abstract() || m->is_synchronized() ||
      m->is_old() || m->is_obsolete() || m->has_monitor_bytecodes() ||
      m->is_scoped() || m->has_reserved_stack_access() || m->intrinsic_id()!=vmIntrinsics::_none ||
      m->max_locals()>64 || m->max_stack()>32 || m->code_size()==0 ||
      Interpreter::method_kind(method)!=Interpreter::zerolocals) return false;
  MethodCounters* counters=m->method_counters();
  if (counters==nullptr || counters->method()!=m || counters->interpreter_pilot_entry()!=nullptr) return false;
#ifdef ASSERT
  if (TraceBytecodes || CountBytecodes || PrintBytecodeHistogram || PrintBytecodePairHistogram || StopInterpreterAt>0) return false;
#endif
  uint64_t int_locals=0;
  int slot=0;
  for (SignatureStream ss(m->signature());!ss.at_return_type();ss.next()) {
    BasicType type=ss.type();
    if (is_java_primitive(type) && type!=T_FLOAT && type!=T_DOUBLE && type!=T_LONG) int_locals|=uint64_t(1)<<slot;
    slot+=type==T_LONG || type==T_DOUBLE?2:1;
  }
  // A fixed private slice is never rewritten/recycled after publication. No
  // Method/klass/oop address is embedded; dead class versions leave dead bytes.
  analysis.stop();
  jlong cleanup_start=0;
  BufferCleanup<Observe> cleanup(stats,cleanup_start);
  jlong allocation_begin=0;
  if constexpr (Observe) allocation_begin=os::current_thread_cpu_time();
  CodeBuffer code(arena+next_slot,slot_size);
  InterpreterMacroAssembler masm(&code);
  if constexpr (Observe) {
    stats[buffer_setup_cpu]=os::current_thread_cpu_time()-allocation_begin;
    stats[buffer_owns_blob]=code.blob()!=nullptr;
  }
  assert(code.blob()==nullptr,"fixed interpreter slice, no per-method code cache allocation");
  CpuCut<Observe> emission(Observe?&stats[emission_cpu]:nullptr);
  auto reject_unpublished = [&]() {
    emission.stop();
    if constexpr (Observe) cleanup_start=os::current_thread_cpu_time();
    return false;
  };
  int depth=0,operations=0,end_bci=0;
  BytecodeStream stream(method);
  for (Bytecodes::Code bc;(bc=stream.next())!=Bytecodes::_illegal && operations<max_operations;) {
    int index=-1,value=0;
    enum { stop, load, store, constant, binary, nop } action=stop;
    TemplateTable::Operation op=TemplateTable::add;
    if (bc>=Bytecodes::_iload_0 && bc<=Bytecodes::_iload_3) { action=load;index=bc-Bytecodes::_iload_0; }
    else if (bc==Bytecodes::_iload) { action=load;index=stream.get_index(); }
    else if (bc>=Bytecodes::_istore_0 && bc<=Bytecodes::_istore_3) { action=store;index=bc-Bytecodes::_istore_0; }
    else if (bc==Bytecodes::_istore) { action=store;index=stream.get_index(); }
    else if (bc>=Bytecodes::_iconst_m1 && bc<=Bytecodes::_iconst_5) { action=constant;value=bc-Bytecodes::_iconst_0; }
    else switch (bc) {
      case Bytecodes::_bipush: action=constant;value=(jbyte)stream.bcp()[1];break;
      case Bytecodes::_sipush: action=constant;value=(jshort)Bytes::get_Java_u2(stream.bcp()+1);break;
      case Bytecodes::_iadd: action=binary;op=TemplateTable::add;break;
      case Bytecodes::_isub: action=binary;op=TemplateTable::sub;break;
      case Bytecodes::_imul: action=binary;op=TemplateTable::mul;break;
      case Bytecodes::_iand: action=binary;op=TemplateTable::_and;break;
      case Bytecodes::_ior: action=binary;op=TemplateTable::_or;break;
      case Bytecodes::_ixor: action=binary;op=TemplateTable::_xor;break;
      case Bytecodes::_ishl: action=binary;op=TemplateTable::shl;break;
      case Bytecodes::_ishr: action=binary;op=TemplateTable::shr;break;
      case Bytecodes::_iushr: action=binary;op=TemplateTable::ushr;break;
      case Bytecodes::_nop: action=nop;break;
      default: break;
    }
    if (action==stop || stream.is_wide()) break;
    if (index>=m->max_locals() || (action==load && (int_locals&(uint64_t(1)<<index))==0) ||
        (action==store && depth<1) || (action==binary && depth<2)) return reject_unpublished();
    switch(action) {
      case load: TemplateTable::emit_iload(&masm,index);masm.push(itos);depth++;break;
      case store: masm.pop(itos);TemplateTable::emit_istore(&masm,index);int_locals|=uint64_t(1)<<index;depth--;break;
      case constant: TemplateTable::emit_iconst(&masm,value);masm.push(itos);depth++;break;
      case binary: masm.pop(itos);TemplateTable::emit_iop2(&masm,op);masm.push(itos);depth--;break;
      case nop: break;
      default: ShouldNotReachHere();
    }
    if (depth>m->max_stack()) return reject_unpublished();
    end_bci=stream.next_bci();operations++;
    masm.increment(rbcp,stream.instruction_size());
    masm.save_bcp();
  }
  // Nothing throwing or safepointing runs inside the bounded prefix. All
  // expression values are canonical vtos at every bytecode boundary. Resume
  // the original opcode through the active interpreter table and its poll.
  if (operations==0 || end_bci>=m->code_size()) return reject_unpublished();
  masm.dispatch_next(vtos,0,true);
  emission.stop();
  CpuCut<Observe> publication(Observe?&stats[publication_cpu]:nullptr);
  masm.flush();
  int bytes=code.insts_size();
  guarantee(bytes<slot_size,"bounded pilot code slice");
  ICache::invalidate_range(arena+next_slot,bytes);
  if constexpr (Observe) { stats[3]=bytes;stats[4]=end_bci;stats[5]=operations; }
  counters->publish_interpreter_pilot(arena+next_slot);
  next_slot+=slot_size;
  if constexpr (Observe) stats[assigned_slice_bytes]=slot_size;
  publication.stop();
  if constexpr (Observe) cleanup_start=os::current_thread_cpu_time();
  return true;
}
#endif
