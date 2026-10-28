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
#include "oops/constantPool.inline.hpp"
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
NOT_PRODUCT(DbgStrings* arena_strings=nullptr;)
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
constexpr int max_prefix_bytes=max_operations*5;
// Count, code bytes, then (post-invoke BCI, native offset) pairs. No metadata.
constexpr int resume_map_bytes=align_up((2+2*max_operations)*(int)sizeof(u2),wordSize);
constexpr int resume_map_offset=slot_size-resume_map_bytes;
address pilot_returns[2][vtos+1]={};
address pilot_calls[4]={};
int resume_counts[InterpreterFramePilot::arena_size/slot_size]={};
// Every Stage A helper is bounded (TypeProfileWidth is limited to eight by
// the VM). Reserve before emitting, including subtype/profile and GC helpers.
constexpr int max_opcode_bytes=2048;
constexpr int fallback_bytes=512;
const Register rbcp=r13;
const Register rlocals=r14;
}

void InterpreterFramePilot::reserve() {
  assert(arena==nullptr,"startup only");
  jlong cpu=os::current_thread_cpu_time(),wall=os::javaTimeNanos();
  generation_lock=new Mutex(Mutex::nosafepoint,"InterpreterFramePilot",true);
  InterpreterCodelet* c=(InterpreterCodelet*)Interpreter::code()->request_committed(arena_size);
  guarantee(c!=nullptr,"bounded interpreter pilot arena");
  c->initialize("WhiteBox interpreter-frame category-1 bodies",Bytecodes::_illegal);
  arena=c->code_begin();
  memset(arena,0xcc,arena_size);
#ifndef PRODUCT
  // Like CodeletMark, keep diagnostic addresses embedded by VerifyOops
  // alive as long as their immutable code. Sharing one slot must not replace
  // another slot's string collection. This storage is startup-only/bounded.
  arena_strings=NEW_C_HEAP_ARRAY(DbgStrings,arena_size/slot_size,mtCode);
  for(int i=0;i<arena_size/slot_size;i++)new (&arena_strings[i]) DbgStrings();
#endif
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
  address entry=counters->interpreter_pilot_entry();
  if(entry!=nullptr) {
    uintptr_t offset=(uintptr_t)entry-(uintptr_t)arena;
    if(offset<arena_size && offset%slot_size==0)
      stats[continuation_hits]=AtomicAccess::load(&resume_counts[offset/slot_size]);
  }
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
bool InterpreterFramePilot::test_poll_enabled() {
  return UseInterpreterFramePilot && WhiteBoxAPI && InterpreterFramePilotTestPoll;
}
bool InterpreterFramePilot::request_poll_test(const methodHandle& method) {
  if(!test_poll_enabled())return false;
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
  assert(test_poll_enabled(),"test-only entry");
  if(counters->cas_interpreter_pilot_poll_test(test_poll_requested,test_poll_armed)) {
    // Real word and page values, with no allocation, handshake enqueue, wait
    // or Java/VM transition that could consume the poll before the guard.
    SafepointMechanism::arm_local_poll_release(JavaThread::current());
  }
JRT_END
JRT_LEAF(void, InterpreterFramePilot::record_test_poll(Method* method,address bcp))
  assert(test_poll_enabled(),"test-only entry");
  MethodCounters* counters=method->method_counters();
  if(counters!=nullptr && counters->method()==method &&
     counters->interpreter_pilot_poll_test()==test_poll_guard_seen) {
    counters->set_interpreter_pilot_poll_test(bcp==method->code_base()?test_poll_processed:test_poll_wrong_bci);
  }
JRT_END
void InterpreterFramePilot::emit_test_poll_return(InterpreterMacroAssembler* masm) {
  assert(test_poll_enabled(),"test-only generation");
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
void InterpreterFramePilot::emit_entry_guards(InterpreterMacroAssembler* masm,Label& fallback,bool count_hit) {
  if(test_poll_enabled()) {
    Label no_request;
    masm->cmpb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_poll_test_offset())),test_poll_requested);
    masm->jcc(Assembler::notEqual,no_request);
    masm->push(rax);masm->push(rdx);masm->push(rbx);
    masm->call_VM_leaf(CAST_FROM_FN_PTR(address,arm_test_poll),rdx);
    masm->pop(rbx);masm->pop(rdx);masm->pop(rax);
    masm->bind(no_request);
  }
  masm->testb(Address(r15_thread,JavaThread::polling_word_offset()),SafepointMechanism::poll_bit());
  if(test_poll_enabled()) {
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
  if(count_hit)masm->incrementl(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_hits_offset())));
}
address* InterpreterFramePilot::invoke_return_table(bool is_interface) {
  return pilot_returns[is_interface?1:0];
}
void InterpreterFramePilot::set_return_entry(bool is_interface,TosState state,address entry) {
  assert(state>=btos && state<=vtos,"return table index");
  pilot_returns[is_interface?1:0][state]=entry;
}
void InterpreterFramePilot::set_call_entry(Bytecodes::Code code,address entry) {
  assert(code>=Bytecodes::_invokevirtual && code<=Bytecodes::_invokeinterface,"ordinary invoke");
  pilot_calls[code-Bytecodes::_invokevirtual]=entry;
}
address InterpreterFramePilot::call_entry(Bytecodes::Code code) {
  assert(code>=Bytecodes::_invokevirtual && code<=Bytecodes::_invokeinterface,"ordinary invoke");
  return pilot_calls[code-Bytecodes::_invokevirtual];
}
JRT_LEAF(address, InterpreterFramePilot::resume_entry(Method* method,address bcp))
  // The current interpreted frame keeps Method/CP metadata alive. This leaf
  // cannot allocate, block, safepoint, resolve, or enter the VM.
  if(method->is_old() || method->is_obsolete())return nullptr;
  MethodCounters* counters=method->method_counters();
  if(counters==nullptr || counters->method()!=method || !counters->interpreter_pilot_enabled())return nullptr;
  address entry=counters->interpreter_pilot_entry();
  uintptr_t offset=(uintptr_t)entry-(uintptr_t)arena;
  if(entry==nullptr || offset>=arena_size || offset%slot_size!=0)return nullptr;
  ptrdiff_t bci=bcp-method->code_base();
  if(bci<0 || bci>=method->code_size())return nullptr;
  const u2* map=(const u2*)(entry+resume_map_offset);
  int count=map[0],bytes=map[1];
  if(count>max_operations || bytes<=0 || bytes>=resume_map_offset)return nullptr;
  for(int i=0;i<count;i++) {
    if(map[2+2*i]==bci) {
      int native_offset=map[3+2*i];
      if(native_offset>=bytes)return nullptr;
      // Explicit WhiteBox pilot diagnostic, separate from invocation hits.
      AtomicAccess::add(&resume_counts[offset/slot_size],1,memory_order_relaxed);
      return entry+native_offset;
    }
  }
  return nullptr;
JRT_END
void InterpreterFramePilot::emit_resume(InterpreterMacroAssembler* masm,TosState state,int step) {
  Label fallback;
  masm->push(state);
  masm->increment(rbcp,step);masm->save_bcp();
  masm->get_method(rbx);
  masm->movptr(rdx,Address(rbx,Method::method_counters_offset()));
  masm->testptr(rdx,rdx);masm->jcc(Assembler::zero,fallback);
  masm->cmpptr(rbx,Address(rdx,in_bytes(MethodCounters::method_offset())));
  masm->jcc(Assembler::notEqual,fallback);
  masm->cmpb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_enabled_offset())),0);
  masm->jcc(Assembler::zero,fallback);
  // A callee may have enabled tooling. Check it before entering even a leaf.
  emit_entry_guards(masm,fallback,false);
  masm->call_VM_leaf(CAST_FROM_FN_PTR(address,resume_entry),rbx,rbcp);
  masm->testptr(rax,rax);masm->jcc(Assembler::zero,fallback);
  masm->jmp(rax);
  masm->bind(fallback);masm->dispatch_next(vtos,0,true);
}
template<bool Observe>
bool InterpreterFramePilot::generate_locked(const methodHandle& method,jlong* stats) {
  assert(generation_lock->owned_by_self(),"serialized immutable slots and publication");
  CpuCut<Observe> analysis(Observe?&stats[analysis_cpu]:nullptr);
  if (!UseInterpreterFramePilot || arena==nullptr || next_slot+slot_size>arena_size) return false;
  Method* m=method();
  if (!m->method_holder()->is_linked() || !m->method_holder()->is_rewritten() || m->is_native() || m->is_abstract() || m->is_synchronized() ||
      m->is_object_initializer() || m->is_static_initializer() ||
      m->is_old() || m->is_obsolete() || m->has_monitor_bytecodes() ||
      m->is_scoped() || m->has_reserved_stack_access() ||
      m->max_locals()>64 || m->max_stack()>32 || m->code_size()==0 ||
      (!UseSerialGC && !UseG1GC)) return false;
  Interpreter::MethodKind kind=Interpreter::method_kind(method);
  if (kind!=Interpreter::zerolocals && kind!=Interpreter::getter &&
      kind!=Interpreter::setter && kind!=Interpreter::empty) return false;
  for(SignatureStream signature(m->signature());!signature.is_done();signature.next()) {
    BasicType type=signature.type();
    if(type!=T_VOID && !is_reference_type(type) && !is_subword_type(type) && type!=T_INT)return false;
  }
  MethodCounters* counters=m->method_counters();
  if (counters==nullptr || counters->method()!=m || counters->interpreter_pilot_entry()!=nullptr) return false;
#ifdef ASSERT
  if (TraceBytecodes || CountBytecodes || PrintBytecodeHistogram || PrintBytecodePairHistogram || StopInterpreterAt>0) return false;
#endif
  // A fixed private slice is never rewritten/recycled after publication. No
  // Method/klass/oop address is embedded; dead class versions leave dead bytes.
  analysis.stop();
  jlong cleanup_start=0;
  BufferCleanup<Observe> cleanup(stats,cleanup_start);
  jlong allocation_begin=0;
  if constexpr (Observe) allocation_begin=os::current_thread_cpu_time();
  CodeBuffer code(arena+next_slot,resume_map_offset);
  InterpreterMacroAssembler masm(&code);
  if constexpr (Observe) {
    stats[buffer_setup_cpu]=os::current_thread_cpu_time()-allocation_begin;
    stats[buffer_owns_blob]=code.blob()!=nullptr;
  }
  assert(code.blob()==nullptr,"fixed interpreter slice, no per-method code cache allocation");
  CpuCut<Observe> emission(Observe?&stats[emission_cpu]:nullptr);
  Label ordinary;
  Label labels[max_prefix_bytes+1];
  auto bind_exits = [&]() {
    for(int i=0;i<=max_prefix_bytes;i++)
      if(labels[i].is_unbound())masm.bind(labels[i]);
    masm.bind(ordinary);
  };
  auto reject_unpublished = [&]() {
    bind_exits();
    emission.stop();
    if constexpr (Observe) cleanup_start=os::current_thread_cpu_time();
    return false;
  };
  int operations=0,end_bci=0;
  int call_bcis[max_operations],call_count=0;
  ConstantPool* pool=m->constants();
  Array<u2>* reference_map=pool->cache()==nullptr?nullptr:pool->cache()->reference_map();
  BytecodeStream stream(method);
  for (Bytecodes::Code bc;(bc=stream.next())!=Bytecodes::_illegal && operations<max_operations;) {
    if(stream.is_wide() || stream.bci()>max_prefix_bytes ||
       code.insts_remaining()<max_opcode_bytes+fallback_bytes)break;
    masm.bind(labels[stream.bci()]);
    int instruction_begin=code.insts_size();
    int index=-1,value=0;
    enum { stop, load, store, aload, astore, constant, binary, nop, emitted } action=stop;
    TemplateTable::Operation op=TemplateTable::add;
    // Preserve the original integer-prefix controls with handlers. The new
    // semantic batch does not admit reference/control-flow handler bodies.
    if(m->has_exception_handler() && !(bc>=Bytecodes::_iconst_m1 && bc<=Bytecodes::_iconst_5) &&
       bc!=Bytecodes::_iload && !(bc>=Bytecodes::_iload_0 && bc<=Bytecodes::_iload_3) &&
       bc!=Bytecodes::_istore && !(bc>=Bytecodes::_istore_0 && bc<=Bytecodes::_istore_3) &&
       bc!=Bytecodes::_bipush && bc!=Bytecodes::_sipush && bc!=Bytecodes::_nop &&
       bc!=Bytecodes::_iadd && bc!=Bytecodes::_isub && bc!=Bytecodes::_imul &&
       bc!=Bytecodes::_iand && bc!=Bytecodes::_ior && bc!=Bytecodes::_ixor &&
       bc!=Bytecodes::_ishl && bc!=Bytecodes::_ishr && bc!=Bytecodes::_iushr)break;
    if (bc>=Bytecodes::_iload_0 && bc<=Bytecodes::_iload_3) { action=load;index=bc-Bytecodes::_iload_0; }
    else if (bc==Bytecodes::_iload) { action=load;index=stream.get_index(); }
    else if (bc>=Bytecodes::_istore_0 && bc<=Bytecodes::_istore_3) { action=store;index=bc-Bytecodes::_istore_0; }
    else if (bc==Bytecodes::_istore) { action=store;index=stream.get_index(); }
    else if (bc>=Bytecodes::_aload_0 && bc<=Bytecodes::_aload_3) { action=aload;index=bc-Bytecodes::_aload_0; }
    else if (bc==Bytecodes::_aload) { action=aload;index=stream.get_index(); }
    else if (bc>=Bytecodes::_astore_0 && bc<=Bytecodes::_astore_3) { action=astore;index=bc-Bytecodes::_astore_0; }
    else if (bc==Bytecodes::_astore) { action=astore;index=stream.get_index(); }
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
      case Bytecodes::_aconst_null:
        masm.xorl(rax,rax);masm.push(atos);action=emitted;break;
      case Bytecodes::_pop:
        masm.addptr(rsp,wordSize);action=emitted;break;
      case Bytecodes::_dup:
        masm.movptr(rax,Address(rsp,0));masm.push_ptr(rax);action=emitted;break;
      case Bytecodes::_swap:
        masm.pop_ptr(rax);masm.pop_ptr(rdx);masm.push_ptr(rax);masm.push_ptr(rdx);action=emitted;break;
      case Bytecodes::_ineg: case Bytecodes::_i2b: case Bytecodes::_i2c: case Bytecodes::_i2s:
        masm.pop(itos);
        if(bc==Bytecodes::_ineg)masm.negl(rax);
        else if(bc==Bytecodes::_i2b)masm.movsbl(rax,rax);
        else if(bc==Bytecodes::_i2c)masm.movzwl(rax,rax);
        else masm.movswl(rax,rax);
        masm.push(itos);action=emitted;break;
      case Bytecodes::_iinc:
        index=stream.get_index();
        if(index>=m->max_locals())return reject_unpublished();
        masm.addl(Address(rlocals,-index*wordSize),(jbyte)stream.bcp()[2]);action=emitted;break;
      case Bytecodes::_ldc: case Bytecodes::_ldc_w: {
        int cp_index=bc==Bytecodes::_ldc?stream.get_index_u1():stream.get_index_u2();
        int ref_index=-1;
        if(stream.raw_code()==Bytecodes::_fast_aldc || stream.raw_code()==Bytecodes::_fast_aldc_w) {
          ref_index=cp_index;
          if(reference_map==nullptr || ref_index>=reference_map->length())break;
          cp_index=pool->object_to_cp_index(ref_index);
        }
        if(cp_index<=0 || cp_index>=pool->length())break;
        constantTag tag=pool->tag_at(cp_index);
        if(tag.is_int()) {action=constant;value=pool->int_at(cp_index);break;}
        if(tag.is_klass() || tag.is_unresolved_klass()) {
          // Class literals have no resolved-reference index. Read the klass
          // cache and its rooted mirror, without initializing the class.
          masm.get_cpool_and_tags(rcx,rdx);masm.movl(rbx,cp_index);
          masm.cmpb(Address(rdx,rbx,Address::times_1,Array<u1>::base_offset_in_bytes()),JVM_CONSTANT_Class);
          masm.jcc(Assembler::notEqual,ordinary);
          masm.load_resolved_klass_at_index(rax,rcx,rbx);
          masm.movptr(rax,Address(rax,in_bytes(Klass::java_mirror_offset())));
          masm.resolve_oop_handle(rax,rscratch1);masm.push(atos);action=emitted;break;
        }
        if(!(tag.is_string() || tag.is_method_type() || tag.is_method_handle()) || reference_map==nullptr)break;
        if(ref_index<0)ref_index=pool->cp_to_object_index(cp_index);
        if(ref_index<0)break;
        masm.movl(rbx,ref_index);masm.load_resolved_reference_at_index(rax,rbx);
        masm.testptr(rax,rax);masm.jcc(Assembler::zero,ordinary);
        masm.push(atos);action=emitted;break;
      }
      case Bytecodes::_getfield: case Bytecodes::_getstatic: {
        int field_index=stream.get_index_u2();
        if(pool->cache()==nullptr || field_index>=pool->resolved_field_entries_length())break;
        ResolvedFieldEntry* field=pool->resolved_field_entry_at(field_index);
        if(!field->is_resolved(bc) || field->field_holder()==nullptr ||
           field->field_holder()->name()->equals("java/lang/ref/Reference"))break;
        BasicType type=as_BasicType((TosState)field->tos_state());
        if(type!=T_OBJECT && type!=T_ARRAY && type!=T_BOOLEAN && type!=T_BYTE && type!=T_CHAR && type!=T_SHORT && type!=T_INT)break;
        int offset=field->field_offset();
        if(bc==Bytecodes::_getfield) {
          masm.movptr(rax,Address(rsp,0));masm.testptr(rax,rax);masm.jcc(Assembler::zero,ordinary);
          masm.pop_ptr(rax);
        } else {
          masm.load_field_entry(rcx,rdx);
          masm.movptr(rax,Address(rcx,in_bytes(ResolvedFieldEntry::field_holder_offset())));
          masm.clinit_barrier(rax,nullptr,&ordinary);
          masm.movptr(rax,Address(rax,in_bytes(Klass::java_mirror_offset())));
          masm.resolve_oop_handle(rax,rscratch1);
        }
        if(is_reference_type(type)) {
          masm.load_heap_oop(rax,Address(rax,offset),rdx);masm.push(atos);
        } else {
          masm.access_load_at(type,IN_HEAP,rax,Address(rax,offset),noreg);masm.push(itos);
        }
        action=emitted;break;
      }
      case Bytecodes::_checkcast: case Bytecodes::_instanceof: {
        int cp_index=stream.get_index_u2();
        if(cp_index<=0 || cp_index>=pool->length())break;
        Label null_value,success,profile,done;
        masm.movptr(rax,Address(rsp,0));masm.testptr(rax,rax);masm.jcc(Assembler::zero,null_value);
        masm.get_cpool_and_tags(rcx,rdx);
        masm.movl(rbx,cp_index);
        masm.cmpb(Address(rdx,rbx,Address::times_1,Array<u1>::base_offset_in_bytes()),JVM_CONSTANT_Class);
        masm.jcc(Assembler::notEqual,ordinary);
        masm.load_resolved_klass_at_index(rax,rcx,rbx);
        masm.movptr(rdx,Address(rsp,0));masm.load_klass(rdx,rdx,rscratch1);
        // Pure predicate first. A failed checkcast must not advance MDP then
        // replay/profiling the original bytecode a second time.
        masm.check_klass_subtype(rdx,rax,rcx,success);
        if(bc==Bytecodes::_checkcast)masm.jmp(ordinary);
        else {
          masm.xorl(r8,r8);masm.jmp(profile);
        }
        masm.bind(success);
        if(bc==Bytecodes::_instanceof)masm.movl(r8,1);
        masm.bind(profile);
        masm.movptr(rdx,Address(rsp,0));masm.load_klass(rdx,rdx,rscratch1);masm.profile_typecheck(rcx,rdx);
        // profile_typecheck(rcx,rdx) preserves r8, including its CAS path.
        if(bc==Bytecodes::_instanceof) {masm.pop_ptr(rax);masm.movl(rax,r8);masm.push(itos);}
        masm.jmp(done);
        masm.bind(null_value);masm.profile_null_seen(rcx);
        if(bc==Bytecodes::_instanceof) {masm.pop_ptr(rax);masm.xorl(rax,rax);masm.push(itos);}
        masm.bind(done);action=emitted;break;
      }
      case Bytecodes::_invokestatic: case Bytecodes::_invokespecial:
      case Bytecodes::_invokevirtual: case Bytecodes::_invokeinterface: {
        int method_index=stream.get_index_u2();
        if(pool->cache()==nullptr || method_index>=pool->resolved_method_entries_length())break;
        ResolvedMethodEntry* entry=pool->resolved_method_entry_at(method_index);
        int cp_index=entry->constant_pool_index();
        Symbol* owner=pool->uncached_klass_ref_at_noresolve(cp_index);
        if(pool->uncached_name_ref_at(cp_index)->equals("<init>") ||
           owner->equals("java/lang/invoke/MethodHandle") || owner->equals("java/lang/invoke/VarHandle"))break;
        bool supported=true;
        for(SignatureStream signature(pool->uncached_signature_ref_at(cp_index));!signature.is_done();signature.next()) {
          BasicType type=signature.type();
          if(type!=T_VOID && !is_reference_type(type) && !is_subword_type(type) && type!=T_INT) {supported=false;break;}
        }
        address target=call_entry(bc);
        if(!supported || target==nullptr)break;
        if(stream.next_bci()<=max_prefix_bytes)call_bcis[call_count++]=stream.next_bci();
        masm.jump(RuntimeAddress(target));action=emitted;break;
      }
      case Bytecodes::_ifeq: case Bytecodes::_ifne: case Bytecodes::_iflt: case Bytecodes::_ifge:
      case Bytecodes::_ifgt: case Bytecodes::_ifle:
      case Bytecodes::_if_icmpeq: case Bytecodes::_if_icmpne: case Bytecodes::_if_icmplt:
      case Bytecodes::_if_icmpge: case Bytecodes::_if_icmpgt: case Bytecodes::_if_icmple:
      case Bytecodes::_if_acmpeq: case Bytecodes::_if_acmpne:
      case Bytecodes::_ifnull: case Bytecodes::_ifnonnull: case Bytecodes::_goto: case Bytecodes::_goto_w: {
        int target=bc==Bytecodes::_goto_w?stream.dest_w():stream.dest();
        if(target<=stream.bci() || target>=m->code_size())break;
        Label not_taken;
        if(bc!=Bytecodes::_goto && bc!=Bytecodes::_goto_w) {
          Assembler::Condition condition=Assembler::equal;
          if(bc==Bytecodes::_if_acmpeq || bc==Bytecodes::_if_acmpne) {
            masm.pop_ptr(rax);masm.pop_ptr(rdx);masm.cmpoop(rdx,rax);
            condition=bc==Bytecodes::_if_acmpeq?Assembler::equal:Assembler::notEqual;
          } else if(bc==Bytecodes::_ifnull || bc==Bytecodes::_ifnonnull) {
            masm.pop_ptr(rax);masm.testptr(rax,rax);condition=bc==Bytecodes::_ifnull?Assembler::equal:Assembler::notEqual;
          } else {
            bool pair=bc>=Bytecodes::_if_icmpeq && bc<=Bytecodes::_if_icmple;
            int n=bc-(pair?Bytecodes::_if_icmpeq:Bytecodes::_ifeq);
            const Assembler::Condition conditions[]={Assembler::equal,Assembler::notEqual,Assembler::less,Assembler::greaterEqual,Assembler::greater,Assembler::lessEqual};
            condition=conditions[n];masm.pop(itos);
            if(pair) {masm.pop_i(rdx);masm.cmpl(rdx,rax);}else masm.testl(rax,rax);
          }
          masm.jcc(MacroAssembler::negate_condition(condition),not_taken);
        }
        masm.profile_taken_branch(rax);masm.increment(rbcp,target-stream.bci());masm.save_bcp();
        masm.jmp(target<=max_prefix_bytes?labels[target]:ordinary);
        if(bc!=Bytecodes::_goto && bc!=Bytecodes::_goto_w) {
          masm.bind(not_taken);masm.profile_not_taken_branch(rax);
        }
        action=emitted;break;
      }
      default: break;
    }
    if (action==stop)break;
    if (index>=m->max_locals())return reject_unpublished();
    switch(action) {
      case load: TemplateTable::emit_iload(&masm,index);masm.push(itos);break;
      case store: masm.pop(itos);TemplateTable::emit_istore(&masm,index);break;
      case aload: masm.movptr(rax,Address(rlocals,-index*wordSize));masm.push(atos);break;
      case astore: masm.pop(atos);masm.movptr(Address(rlocals,-index*wordSize),rax);break;
      case constant: TemplateTable::emit_iconst(&masm,value);masm.push(itos);break;
      case binary: masm.pop(itos);TemplateTable::emit_iop2(&masm,op);masm.push(itos);break;
      case nop: case emitted: break;
      default: ShouldNotReachHere();
    }
    end_bci=stream.next_bci();operations++;
    masm.increment(rbcp,stream.instruction_size());
    masm.save_bcp();
    guarantee(code.insts_size()-instruction_begin<max_opcode_bytes,"audited bounded Stage A opcode");
  }
  // Values are canonical vtos at every boundary. Shared invoke codelets
  // establish the ordinary interpreted call frame before a callee can run.
  // Unsupported opcodes resume through the active table and its poll.
  if (operations==0 || end_bci>=m->code_size()) return reject_unpublished();
  for(int i=0;i<call_count;i++)
    if(!labels[call_bcis[i]].is_bound())masm.bind(labels[call_bcis[i]]);
  bind_exits();
  masm.dispatch_next(vtos,0,true);
  emission.stop();
  CpuCut<Observe> publication(Observe?&stats[publication_cpu]:nullptr);
  masm.flush();
  int bytes=code.insts_size();
  guarantee(bytes<resume_map_offset,"bounded pilot code before immutable map");
  u2* map=(u2*)(arena+next_slot+resume_map_offset);
  memset(map,0,resume_map_bytes);map[1]=bytes;
  for(int i=0;i<call_count;i++) {
    int bci=call_bcis[i];
    guarantee(labels[bci].is_bound(),"post-call BCI bound to native body or fallback");
    int target=labels[bci].loc_pos();
    if(target==ordinary.loc_pos())continue; // ordinary return/unsupported opcode
    int row=map[0]++;
    map[2+2*row]=bci;map[3+2*row]=target;
  }
  NOT_PRODUCT(arena_strings[next_slot/slot_size].share(code.dbg_strings());)
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
