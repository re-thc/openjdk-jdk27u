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
#include "classfile/vmClasses.hpp"
#include "interpreter/bytecodeStream.hpp"
#include "interpreter/interpreter.hpp"
#include "interpreter/templateTable.hpp"
#include "oops/constantPool.inline.hpp"
#include "oops/method.inline.hpp"
#include "oops/instanceKlass.hpp"
#include "oops/methodCounters.hpp"
#include "oops/methodData.hpp"
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
// Every supported operation introduces at most one forward BCI target. Keep
// only those labels and actual return sites, rather than constructing a Label
// for every possible BCI. The enclosing prepare ResourceMark owns the storage.
class PilotLabels : public StackObj {
  u1 _bci_slots[max_prefix_bytes+1];
  Label* _targets[max_operations];
  Label* _returns[max_operations];
  int _target_count;
  int _return_count;

  static Label* create() { return new (NEW_RESOURCE_ARRAY(Label,1)) Label(); }
 public:
  PilotLabels():_target_count(0),_return_count(0) {
    memset(_bci_slots,0xff,sizeof(_bci_slots));
  }
  ~PilotLabels() {
    // Retain Label's unbound-reference assertion before ResourceArea rollback.
    for(int i=0;i<_target_count;i++)_targets[i]->~Label();
    for(int i=0;i<_return_count;i++)_returns[i]->~Label();
  }
  Label* existing(int bci) const {
    assert(bci>=0 && bci<=max_prefix_bytes,"bounded BCI");
    return _bci_slots[bci]==0xff?nullptr:_targets[_bci_slots[bci]];
  }
  Label& target(int bci) {
    Label* label=existing(bci);
    if(label==nullptr) {
      guarantee(_target_count<max_operations,"at most one target per operation");
      label=create();_bci_slots[bci]=_target_count;_targets[_target_count++]=label;
    }
    return *label;
  }
  Label& add_return() {
    guarantee(_return_count<max_operations,"at most one return site per operation");
    Label* label=create();_returns[_return_count++]=label;return *label;
  }
  Label& return_at(int site) const {
    assert(site>=0 && site<_return_count,"existing return site");
    return *_returns[site];
  }
  void bind_pending(InterpreterMacroAssembler* masm) {
    for(int i=0;i<_target_count;i++)
      if(_targets[i]->is_unbound())masm->bind(*_targets[i]);
  }
};
// Retain the qualified 3832-byte code budget. Only a diagnostic site count
// and code-size header remain in the reserved tail; execution reads no map.
constexpr int reserved_tail_bytes=align_up((2+2*max_operations)*(int)sizeof(u2),wordSize);
constexpr int code_budget=slot_size-reserved_tail_bytes;
address pilot_calls[4]={};
int resume_counts[InterpreterFramePilot::arena_size/slot_size]={};
// Every Stage A helper is bounded (TypeProfileWidth is limited to eight by
// the VM). Reserve before emitting, including subtype/profile and GC helpers.
constexpr int max_opcode_bytes=2048;
constexpr int fallback_bytes=512;
// These subsets have bounded inline work; leave complex type/constant helpers
// and profiling/tooling return configurations at the original 2KiB allowance.
static int opcode_budget(Bytecodes::Code bc,int ordinary_call_bytes) {
  if((bc>=Bytecodes::_iconst_m1 && bc<=Bytecodes::_iconst_5) ||
     (bc>=Bytecodes::_iload_0 && bc<=Bytecodes::_iload_3) ||
     (bc>=Bytecodes::_istore_0 && bc<=Bytecodes::_istore_3) ||
     (bc>=Bytecodes::_aload_0 && bc<=Bytecodes::_aload_3) ||
     (bc>=Bytecodes::_astore_0 && bc<=Bytecodes::_astore_3))return 256;
  switch(bc) {
    case Bytecodes::_iload: case Bytecodes::_istore: case Bytecodes::_aload: case Bytecodes::_astore:
    case Bytecodes::_bipush: case Bytecodes::_sipush: case Bytecodes::_aconst_null:
    case Bytecodes::_pop: case Bytecodes::_dup: case Bytecodes::_swap: case Bytecodes::_nop:
    case Bytecodes::_iadd: case Bytecodes::_isub: case Bytecodes::_imul:
    case Bytecodes::_iand: case Bytecodes::_ior: case Bytecodes::_ixor:
    case Bytecodes::_ishl: case Bytecodes::_ishr: case Bytecodes::_iushr:
    case Bytecodes::_ineg: case Bytecodes::_i2b: case Bytecodes::_i2c: case Bytecodes::_i2s: case Bytecodes::_iinc:
    case Bytecodes::_ireturn: case Bytecodes::_areturn: case Bytecodes::_return:
      return 256;
    case Bytecodes::_getfield: case Bytecodes::_getstatic:
    case Bytecodes::_ifeq: case Bytecodes::_ifne: case Bytecodes::_iflt: case Bytecodes::_ifge:
    case Bytecodes::_ifgt: case Bytecodes::_ifle:
    case Bytecodes::_if_icmpeq: case Bytecodes::_if_icmpne: case Bytecodes::_if_icmplt:
    case Bytecodes::_if_icmpge: case Bytecodes::_if_icmpgt: case Bytecodes::_if_icmple:
    case Bytecodes::_if_acmpeq: case Bytecodes::_if_acmpne:
    case Bytecodes::_ifnull: case Bytecodes::_ifnonnull: case Bytecodes::_goto: case Bytecodes::_goto_w:
      return 512;
    case Bytecodes::_invokestatic: case Bytecodes::_invokespecial:
    case Bytecodes::_invokevirtual: case Bytecodes::_invokeinterface:
      return ordinary_call_bytes;
    default:return max_opcode_bytes;
  }
}
const Register rbcp=r13;
const Register rlocals=r14;

// Fixed helper families for this interpreter-frame experiment. Source bytes are
// never executed or referenced by a published body. All construction and copying
// happens under generation_lock; the old C++ emitters remain the fallback.
enum PilotFragmentKind {
  fragment_taken,fragment_not_taken,fragment_type_profile,fragment_null_profile,
  fragment_instanceof,fragment_checkcast,fragment_cold_reference,
  fragment_resume3,fragment_resume5,fragment_count
};
struct PilotFragment {
  static constexpr int capacity=2048;
  static constexpr int max_patches=12;
  u1 bytes[capacity];
  u2 patches[max_patches];
  u2 size;
  u1 patch_count;
  u1 state; // zero: unbuilt, one: retained, two: use C++ instead
  void record(InterpreterMacroAssembler* masm) {
    guarantee(patch_count<max_patches,"bounded helper exits");
    patches[patch_count++]=masm->offset();
  }
};
struct PilotFragmentConfig {
  bool profile,casts,g1,serial,compressed_oops,compressed_klass,compact;
  bool verify_oops,check_oops,verify_mdp,secondary,verify_secondary,popcount,apx;
  int avx;intx width;
  PilotFragmentConfig():profile(ProfileInterpreter),casts(TypeProfileCasts),g1(UseG1GC),serial(UseSerialGC),
    compressed_oops(UseCompressedOops),compressed_klass(UseCompressedClassPointers),compact(UseCompactObjectHeaders),
    verify_oops(VerifyOops),check_oops(CheckCompressedOops),verify_mdp(VerifyDataPointer),
    secondary(UseSecondarySupersTable),verify_secondary(VerifySecondarySupers),popcount(UsePopCountInstruction),
    apx(UseAPX),avx(UseAVX),width(TypeProfileWidth) {}
  bool equals(const PilotFragmentConfig& other) const {
    return profile==other.profile && casts==other.casts && g1==other.g1 && serial==other.serial &&
      compressed_oops==other.compressed_oops && compressed_klass==other.compressed_klass && compact==other.compact &&
      verify_oops==other.verify_oops && check_oops==other.check_oops && verify_mdp==other.verify_mdp &&
      secondary==other.secondary && verify_secondary==other.verify_secondary && popcount==other.popcount &&
      apx==other.apx && avx==other.avx && width==other.width;
  }
};
PilotFragment fragments[fragment_count];
// Capture configuration lazily, inside the complete held preparation interval.
alignas(PilotFragmentConfig) u1 fragment_config_storage[sizeof(PilotFragmentConfig)];
PilotFragmentConfig* fragment_config=nullptr;
bool* fragment_walk_flag=nullptr;
int method_fragment_used=0,method_fragment_built=0;

template<bool Record>
void fragment_failure(InterpreterMacroAssembler* masm,Assembler::Condition condition,
                      Label& fallback,PilotFragment* fragment) {
  if constexpr(Record)fragment->record(masm);
  masm->jcc(condition,fallback);
}

template<bool Record>
void emit_resume_prefix(InterpreterMacroAssembler* masm,int step,Label& fallback,PilotFragment* fragment) {
  masm->increment(rbcp,step);masm->save_bcp();
  masm->get_method(rbx);
  masm->movptr(rdx,Address(rbx,Method::method_counters_offset()));
  masm->cmpb(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_enabled_offset())),0);
  fragment_failure<Record>(masm,Assembler::zero,fallback,fragment);
  masm->testl(Address(rbx,in_bytes(Method::method_flags_offset())+
                         in_bytes(MethodFlags::status_offset())),MethodFlags::old_or_obsolete_mask());
  fragment_failure<Record>(masm,Assembler::notZero,fallback,fragment);
#if INCLUDE_JVMTI
  assert(fragment_walk_flag!=nullptr,"member emitter supplied stable VM flag address");
  masm->movptr(rscratch1,(intptr_t)fragment_walk_flag);
  masm->cmpb(Address(rscratch1,0),0);
  fragment_failure<Record>(masm,Assembler::notEqual,fallback,fragment);
#endif
  masm->testb(Address(r15_thread,JavaThread::polling_word_offset()),SafepointMechanism::poll_bit());
  fragment_failure<Record>(masm,Assembler::notZero,fallback,fragment);
#ifdef ASSERT
  bool* const flags[]={&TraceBytecodes,&CountBytecodes,&PrintBytecodeHistogram,&PrintBytecodePairHistogram};
  for(bool* flag:flags) {
    masm->movptr(rscratch1,(intptr_t)flag);masm->cmpb(Address(rscratch1,0),0);
    fragment_failure<Record>(masm,Assembler::notEqual,fallback,fragment);
  }
  masm->movptr(rscratch1,(intptr_t)&StopInterpreterAt);masm->cmpq(Address(rscratch1,0),0);
  fragment_failure<Record>(masm,Assembler::notEqual,fallback,fragment);
#endif
}

template<bool Record>
void emit_type_predicate(InterpreterMacroAssembler* masm,bool instance,Label& fallback,PilotFragment* fragment) {
  Label success,profile;
  masm->check_klass_subtype(rdx,rax,rcx,success);
  if(!instance) {
    if constexpr(Record)fragment->record(masm);
    masm->jmp(fallback);
  } else {masm->xorl(r8,r8);masm->jmp(profile);}
  masm->bind(success);
  if(instance)masm->movl(r8,1);
  masm->bind(profile);
}

template<bool Record>
void emit_cold_reference(InterpreterMacroAssembler* masm,Label& fallback,PilotFragment* fragment) {
  masm->load_field_entry(rcx,rdx);
  masm->cmpb(Address(rcx,in_bytes(ResolvedFieldEntry::get_code_offset())),Bytecodes::_getfield);
  fragment_failure<Record>(masm,Assembler::notEqual,fallback,fragment);
  masm->cmpb(Address(rcx,in_bytes(ResolvedFieldEntry::type_offset())),atos);
  fragment_failure<Record>(masm,Assembler::notEqual,fallback,fragment);
  masm->movptr(rbx,Address(rcx,in_bytes(ResolvedFieldEntry::field_holder_offset())));
  masm->movptr(rscratch1,(intptr_t)vmClasses::Reference_klass_addr());
  masm->cmpptr(rbx,Address(rscratch1,0));
  fragment_failure<Record>(masm,Assembler::equal,fallback,fragment);
  masm->movptr(rax,Address(rsp,0));masm->testptr(rax,rax);
  fragment_failure<Record>(masm,Assembler::zero,fallback,fragment);
  masm->pop_ptr(rax);
  masm->load_sized_value(rbx,Address(rcx,in_bytes(ResolvedFieldEntry::field_offset_offset())),sizeof(int),true);
  masm->load_heap_oop(rax,Address(rax,rbx,Address::times_1),rdx);masm->push(atos);
}

bool emit_fragment(InterpreterMacroAssembler* masm,PilotFragmentKind kind,Label* fallback=nullptr) {
  assert(generation_lock->owned_by_self(),"serialized template lifetime and publication");
  PilotFragmentConfig config;
  if(fragment_config==nullptr)fragment_config=new (fragment_config_storage) PilotFragmentConfig(config);
  if(!fragment_config->equals(config))return false;
  PilotFragment& fragment=fragments[kind];
  if(fragment.state==0) {
    method_fragment_built|=1<<kind;
    // Known verification paths can add source strings or external transfers.
    // Other modes are checked against actual recorded relocation/string data.
    bool supported=!((kind==fragment_instanceof || kind==fragment_checkcast) && VerifySecondarySupers) &&
      !(kind==fragment_cold_reference && (VerifyOops || CheckCompressedOops));
    fragment.state=2;
    if(supported) {
      // Nothing allocated or patched in this mark escapes except permanent
      // bytes and integer offsets. In particular, destination Label overflow
      // belongs to the caller's OUTER mark and must not grow inside this one.
      ResourceMark rm;
      CodeBuffer source(fragment.bytes,PilotFragment::capacity,Thread::current()->resource_area(),128*sizeof(relocInfo));
      InterpreterMacroAssembler builder(&source);Label exit;
      switch(kind) {
        case fragment_taken:builder.profile_taken_branch(rax);break;
        case fragment_not_taken:builder.profile_not_taken_branch(rax);break;
        case fragment_type_profile:builder.profile_typecheck(rcx,rdx);break;
        case fragment_null_profile:builder.profile_null_seen(rcx);break;
        case fragment_instanceof:emit_type_predicate<true>(&builder,true,exit,&fragment);break;
        case fragment_checkcast:emit_type_predicate<true>(&builder,false,exit,&fragment);break;
        case fragment_cold_reference:emit_cold_reference<true>(&builder,exit,&fragment);break;
        case fragment_resume3:emit_resume_prefix<true>(&builder,3,exit,&fragment);break;
        case fragment_resume5:emit_resume_prefix<true>(&builder,5,exit,&fragment);break;
        default:ShouldNotReachHere();
      }
      builder.bind(exit);
      bool clean=source.consts()->is_empty() && source.stubs()->is_empty() &&
        source.total_relocation_size()==0 && source.total_oop_size()==0 && source.total_metadata_size()==0;
      NOT_PRODUCT(clean=clean && source.dbg_strings().is_empty();)
      if(clean) {
        guarantee(source.insts_size()<PilotFragment::capacity,"bounded fragment");
        fragment.size=source.insts_size();fragment.state=1;
      }
    }
  }
  if(fragment.state!=1)return false;
  // Source CodeBuffer/Labels and their ResourceMark have ended before any
  // destination fixup is attached. Copies retain all runtime guards and BCP work.
  guarantee(masm->code()->insts_remaining()>=fragment.size,"audited opcode reservation");
  address begin=masm->pc();memcpy(begin,fragment.bytes,fragment.size);
  masm->set_inst_end(begin+fragment.size);
  for(int i=0;i<fragment.patch_count;i++) {
    assert(fallback!=nullptr,"explicit external exit");
    address branch=begin+fragment.patches[i];
    address target=masm->code_section()->target(*fallback,branch);
    masm->pd_patch_instruction(branch,target,__FILE__,__LINE__);
  }
  method_fragment_used|=1<<kind;
  return true;
}
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
  // Entry hits are the control for the continuation regression counters.
  // Neither diagnostic is generated in the normal timing configuration.
  if(count_hit && WhiteBoxAPI && InterpreterFramePilotTestContinuations)
    masm->incrementl(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_hits_offset())));
}
void InterpreterFramePilot::set_call_entry(Bytecodes::Code code,address entry) {
  assert(code>=Bytecodes::_invokevirtual && code<=Bytecodes::_invokeinterface,"ordinary invoke");
  pilot_calls[code-Bytecodes::_invokevirtual]=entry;
}
address InterpreterFramePilot::call_entry(Bytecodes::Code code) {
  assert(code>=Bytecodes::_invokevirtual && code<=Bytecodes::_invokeinterface,"ordinary invoke");
  return pilot_calls[code-Bytecodes::_invokevirtual];
}
void InterpreterFramePilot::emit_resume(InterpreterMacroAssembler* masm,TosState state,int step,
                                       Label& successor,Label& fallback,int slot) {
#if INCLUDE_JVMTI
  fragment_walk_flag=&JvmtiExport::_can_walk_any_space;
#endif
  masm->push(state);
  // The push/VerifyOops and slot-specific test counter stay in the shared C++
  // emitter. Only the closed prefix with explicit fallback edges is copied.
  bool copied=(step==3 || step==5) &&
    emit_fragment(masm,step==3?fragment_resume3:fragment_resume5,&fallback);
  if(!copied)emit_resume_prefix<false>(masm,step,fallback,nullptr);
  if(WhiteBoxAPI && InterpreterFramePilotTestContinuations) {
    masm->movptr(rscratch1,(intptr_t)&resume_counts[slot]);
    masm->lock();masm->incrementl(Address(rscratch1,0));
  }
  masm->jmp(successor);
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
  method_fragment_used=0;method_fragment_built=0;
  analysis.stop();
  jlong cleanup_start=0;
  BufferCleanup<Observe> cleanup(stats,cleanup_start);
  jlong allocation_begin=0;
  if constexpr (Observe) allocation_begin=os::current_thread_cpu_time();
  // Branch patch overflow shares the enclosing ResourceMark. No nested mark
  // encloses label emission, and all labels/fixups die before that mark.
  CodeBuffer code(arena+next_slot,code_budget,Thread::current()->resource_area());
  InterpreterMacroAssembler masm(&code);
  if constexpr (Observe) {
    stats[buffer_setup_cpu]=os::current_thread_cpu_time()-allocation_begin;
    stats[buffer_owns_blob]=code.blob()!=nullptr;
  }
  assert(code.blob()==nullptr,"fixed interpreter slice, no per-method code cache allocation");
  CpuCut<Observe> emission(Observe?&stats[emission_cpu]:nullptr);
  Label ordinary;
  PilotLabels labels;
  int call_bcis[max_operations],return_locs[max_operations],call_count=0;
  address ordinary_returns[max_operations];
  auto bind_exits = [&]() {
    labels.bind_pending(&masm);
    masm.bind(ordinary);
  };
  auto reject_unpublished = [&]() {
    bind_exits();
    for(int i=0;i<call_count;i++)
      if(labels.return_at(i).is_unbound())masm.bind(labels.return_at(i));
    emission.stop();
    if constexpr (Observe) cleanup_start=os::current_thread_cpu_time();
    return false;
  };
  // Every supported call is an ordinary invoke. Under jsr292-only policy a
  // non-LambdaForm caller has no return profile; do not encode its unreachable
  // helper. Profile-all and compiled LambdaForms retain the shared emitter.
  const bool profile_oop_returns=!MethodData::profile_return_jsr292_only() || m->is_compiled_lambda_form();
  // Without those three epilogues the whole call/island has fewer than64 x86
  // instructions, including ASSERT guards, VerifyOops setup and test counters.
  // Shared verifier/failure bodies are not copied into the site.
  const int ordinary_call_bytes=(!profile_oop_returns && !JvmtiExport::can_pop_frame() &&
      !JvmtiExport::can_force_early_return())?1024:max_opcode_bytes;
  int operations=0,end_bci=0,furthest_forward_bci=0;
  ConstantPool* pool=m->constants();
  Array<u2>* reference_map=pool->cache()==nullptr?nullptr:pool->cache()->reference_map();
  BytecodeStream stream(method);
  for (Bytecodes::Code bc;(bc=stream.next())!=Bytecodes::_illegal && operations<max_operations;) {
    int instruction_budget=opcode_budget(bc,ordinary_call_bytes);
    if(stream.is_wide() || stream.bci()>max_prefix_bytes ||
       code.insts_remaining()<instruction_budget+fallback_bytes)break;
    if(Label* target=labels.existing(stream.bci());target!=nullptr)masm.bind(*target);
    int instruction_begin=code.insts_size();
    int index=-1,value=0;
    bool terminal=false;
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
        bool resolved=field->is_resolved(bc);
        if(resolved && (field->field_holder()==nullptr ||
            field->field_holder()==vmClasses::Reference_klass()))break;
        BasicType type=resolved?as_BasicType((TosState)field->tos_state()):
            Signature::basic_type(pool->uncached_signature_ref_at(field->constant_pool_index()));
        if(type!=T_OBJECT && type!=T_ARRAY && type!=T_BOOLEAN && type!=T_BYTE && type!=T_CHAR && type!=T_SHORT && type!=T_INT)break;
        if(!resolved && bc==Bytecodes::_getfield && is_reference_type(type) &&
           emit_fragment(&masm,fragment_cold_reference,&ordinary)) {action=emitted;break;}
        if(!resolved) {
          // Reuse the interpreter's opcode-specific acquire publication. A cold
          // entry falls back without consuming operands and can work on a later
          // invocation after ordinary resolution, with no body regeneration.
          masm.load_field_entry(rcx,rdx);
          masm.cmpb(Address(rcx,in_bytes(ResolvedFieldEntry::get_code_offset())),bc);
          masm.jcc(Assembler::notEqual,ordinary);
          masm.cmpb(Address(rcx,in_bytes(ResolvedFieldEntry::type_offset())),as_TosState(type));
          masm.jcc(Assembler::notEqual,ordinary);
          masm.movptr(rbx,Address(rcx,in_bytes(ResolvedFieldEntry::field_holder_offset())));
          masm.movptr(rscratch1,(intptr_t)vmClasses::Reference_klass_addr());
          masm.cmpptr(rbx,Address(rscratch1,0));masm.jcc(Assembler::equal,ordinary);
        }
        if(bc==Bytecodes::_getfield) {
          masm.movptr(rax,Address(rsp,0));masm.testptr(rax,rax);masm.jcc(Assembler::zero,ordinary);
          masm.pop_ptr(rax);
        } else {
          if(resolved) {
            masm.load_field_entry(rcx,rdx);
            masm.movptr(rbx,Address(rcx,in_bytes(ResolvedFieldEntry::field_holder_offset())));
          }
          masm.clinit_barrier(rbx,nullptr,&ordinary);
          masm.movptr(rax,Address(rbx,in_bytes(Klass::java_mirror_offset())));
          masm.resolve_oop_handle(rax,rscratch1);
        }
        if(!resolved)
          masm.load_sized_value(rbx,Address(rcx,in_bytes(ResolvedFieldEntry::field_offset_offset())),sizeof(int),true);
        const Address field_address=resolved?Address(rax,field->field_offset()):Address(rax,rbx,Address::times_1);
        if(is_reference_type(type)) {
          masm.load_heap_oop(rax,field_address,rdx);masm.push(atos);
        } else {
          masm.access_load_at(type,IN_HEAP,rax,field_address,noreg);masm.push(itos);
        }
        action=emitted;break;
      }
      case Bytecodes::_checkcast: case Bytecodes::_instanceof: {
        int cp_index=stream.get_index_u2();
        if(cp_index<=0 || cp_index>=pool->length())break;
        Label null_value,done;
        masm.movptr(rax,Address(rsp,0));masm.testptr(rax,rax);masm.jcc(Assembler::zero,null_value);
        masm.get_cpool_and_tags(rcx,rdx);
        masm.movl(rbx,cp_index);
        masm.cmpb(Address(rdx,rbx,Address::times_1,Array<u1>::base_offset_in_bytes()),JVM_CONSTANT_Class);
        masm.jcc(Assembler::notEqual,ordinary);
        masm.load_resolved_klass_at_index(rax,rcx,rbx);
        masm.movptr(rdx,Address(rsp,0));masm.load_klass(rdx,rdx,rscratch1);
        // Pure predicate first. A failed checkcast must not advance MDP then
        // replay/profiling the original bytecode a second time.
        if(!emit_fragment(&masm,bc==Bytecodes::_instanceof?fragment_instanceof:fragment_checkcast,&ordinary))
          emit_type_predicate<false>(&masm,bc==Bytecodes::_instanceof,ordinary,nullptr);
        masm.movptr(rdx,Address(rsp,0));masm.load_klass(rdx,rdx,rscratch1);
        if(!emit_fragment(&masm,fragment_type_profile))masm.profile_typecheck(rcx,rdx);
        // profile_typecheck(rcx,rdx) preserves r8, including its CAS path.
        if(bc==Bytecodes::_instanceof) {masm.pop_ptr(rax);masm.movl(rax,r8);masm.push(itos);}
        masm.jmp(done);
        masm.bind(null_value);
        if(!emit_fragment(&masm,fragment_null_profile))masm.profile_null_seen(rcx);
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
        TosState result=vtos;
        for(SignatureStream signature(pool->uncached_signature_ref_at(cp_index));!signature.is_done();signature.next()) {
          BasicType type=signature.type();
          if(signature.at_return_type())result=as_TosState(type);
          if(type!=T_VOID && !is_reference_type(type) && !is_subword_type(type) && type!=T_INT) {supported=false;break;}
        }
        address target=call_entry(bc);
        if(!supported || target==nullptr)break;
        if(result>=btos && result<=itos)result=itos;
        int next=stream.next_bci();
        address ordinary_return=Interpreter::return_entry(result,stream.instruction_size(),bc);
        Bytecodes::Code successor=next<m->code_size()?Bytecodes::java_code_at(m,m->bcp_from(next)):Bytecodes::_illegal;
        bool tail=successor==Bytecodes::_ireturn || successor==Bytecodes::_areturn || successor==Bytecodes::_return;
        if(tail || next>max_prefix_bytes) {
          // Ordinary return bytecode, with the caller frame and its normal
          // narrowing/exit/poll semantics. No native successor is promised.
          masm.movptr(r8,(intptr_t)ordinary_return);
          masm.jump(RuntimeAddress(target));
        } else {
          int site=call_count++;
          call_bcis[site]=next;ordinary_returns[site]=ordinary_return;
          masm.lea(r8,labels.add_return());
          masm.jump(RuntimeAddress(target));
          // This island cannot be reached by ordinary body fallthrough. Bind
          // its return label only once successor classification is complete.
          return_locs[site]=masm.locator();
          emit_return_site(&masm,result,stream.instruction_size(),labels.target(next),ordinary,next_slot/slot_size,profile_oop_returns);
        }
        action=emitted;break;
      }
      case Bytecodes::_ireturn: case Bytecodes::_areturn: case Bytecodes::_return:
        if(furthest_forward_bci<=stream.bci())break;
        masm.jmp(ordinary);terminal=true;action=emitted;break;
      case Bytecodes::_ifeq: case Bytecodes::_ifne: case Bytecodes::_iflt: case Bytecodes::_ifge:
      case Bytecodes::_ifgt: case Bytecodes::_ifle:
      case Bytecodes::_if_icmpeq: case Bytecodes::_if_icmpne: case Bytecodes::_if_icmplt:
      case Bytecodes::_if_icmpge: case Bytecodes::_if_icmpgt: case Bytecodes::_if_icmple:
      case Bytecodes::_if_acmpeq: case Bytecodes::_if_acmpne:
      case Bytecodes::_ifnull: case Bytecodes::_ifnonnull: case Bytecodes::_goto: case Bytecodes::_goto_w: {
        int target=bc==Bytecodes::_goto_w?stream.dest_w():stream.dest();
        if(target<=stream.bci() || target>=m->code_size())break;
        if(target<=max_prefix_bytes)furthest_forward_bci=MAX2(furthest_forward_bci,target);
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
        if(!emit_fragment(&masm,fragment_taken))masm.profile_taken_branch(rax);
        masm.increment(rbcp,target-stream.bci());masm.save_bcp();
        masm.jmp(target<=max_prefix_bytes?labels.target(target):ordinary);
        if(bc!=Bytecodes::_goto && bc!=Bytecodes::_goto_w) {
          masm.bind(not_taken);
          if(!emit_fragment(&masm,fragment_not_taken))masm.profile_not_taken_branch(rax);
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
    if(!terminal) {
      masm.increment(rbcp,stream.instruction_size());
      masm.save_bcp();
    }
    guarantee(code.insts_size()-instruction_begin<instruction_budget,"audited bounded pilot opcode");
  }
  // Values are canonical vtos at every boundary. Shared invoke codelets
  // establish the ordinary interpreted call frame before a callee can run.
  // Unsupported opcodes resume through the active table and its poll.
  if (operations==0 || end_bci>=m->code_size()) return reject_unpublished();
  bind_exits();
  masm.dispatch_next(vtos,0,true);
  int native_sites=0,ordinary_sites=0;
  for(int i=0;i<call_count;i++) {
    int bci=call_bcis[i];
    Label& successor=labels.target(bci);
    guarantee(successor.is_bound(),"post-call BCI bound to native body or fallback");
    if(successor.loc_pos()!=ordinary.loc_pos()) {
      labels.return_at(i).bind_loc(return_locs[i]);
      labels.return_at(i).patch_instructions(&masm);
      native_sites++;
    } else {
      // A contiguous prefix can leave only its final call without a native
      // successor. Select ordinary cleanup before any generated epilogue.
      guarantee(++ordinary_sites==1,"at most one truncated final call");
      masm.bind(labels.return_at(i));
      masm.jump(RuntimeAddress(ordinary_returns[i]));
    }
  }
  emission.stop();
  CpuCut<Observe> publication(Observe?&stats[publication_cpu]:nullptr);
  masm.flush();
  int bytes=code.insts_size();
  guarantee(bytes<code_budget,"bounded pilot code including direct return sites");
  u2* header=(u2*)(arena+next_slot+code_budget);
  header[0]=native_sites;header[1]=bytes;
  header[2]=method_fragment_used;header[3]=method_fragment_built;
  int retained_bytes=0;
  for(int i=0;i<fragment_count;i++)if(fragments[i].state==1)retained_bytes+=fragments[i].size;
  header[4]=retained_bytes;
  header[5]=sizeof(fragments)+sizeof(fragment_config_storage)+sizeof(fragment_config)+sizeof(fragment_walk_flag)+
    sizeof(method_fragment_used)+sizeof(method_fragment_built);
  header[8]=0x544d; // Generation-only prototype metrics; never read by guest code.
  NOT_PRODUCT(arena_strings[next_slot/slot_size].share(code.dbg_strings());)
  // masm.flush() already invalidated all executable bytes after label fixups.
  if constexpr (Observe) { stats[3]=bytes;stats[4]=end_bci;stats[5]=operations; }
  counters->publish_interpreter_pilot(arena+next_slot);
  next_slot+=slot_size;
  if constexpr (Observe) stats[assigned_slice_bytes]=slot_size;
  publication.stop();
  if constexpr (Observe) cleanup_start=os::current_thread_cpu_time();
  return true;
}
#endif
