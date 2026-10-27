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
#include "runtime/javaThread.hpp"
#include "runtime/os.hpp"
#include "runtime/safepoint.hpp"
#include "runtime/safepointMechanism.hpp"
#include "runtime/signature.hpp"

namespace {
address arena=nullptr;
int next_slot=0;
constexpr int slot_size=4096;
constexpr int max_operations=64;
const Register rbcp=r13;
const Register rlocals=r14;
}

void InterpreterFramePilot::reserve() {
  assert(arena==nullptr,"startup only");
  InterpreterCodelet* c=(InterpreterCodelet*)Interpreter::code()->request_committed(arena_size);
  guarantee(c!=nullptr,"bounded interpreter pilot arena");
  c->initialize("WhiteBox interpreter-frame integer prefixes",Bytecodes::_illegal);
  arena=c->code_begin();
  memset(arena,0xcc,arena_size);
}

bool InterpreterFramePilot::prepare(const methodHandle& method, jlong* stats) {
  assert(SafepointSynchronize::is_at_safepoint(),"WhiteBox VM operation");
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
  CodeBuffer code(arena+next_slot,slot_size);
  InterpreterMacroAssembler masm(&code);
  Label ordinary;
  auto reject_unpublished = [&]() { masm.bind(ordinary); return false; };
  masm.testb(Address(r15_thread,JavaThread::polling_word_offset()),SafepointMechanism::poll_bit());
  masm.jcc(Assembler::notZero,ordinary);
  masm.cmpl(Address(r15_thread,JavaThread::interp_only_mode_offset()),0);
  masm.jcc(Assembler::notEqual,ordinary);
#if INCLUDE_JVMTI
  bool* const flags[]={&JvmtiExport::_can_access_local_variables,&JvmtiExport::_can_walk_any_space,
      &JvmtiExport::_can_get_owned_monitor_info,&JvmtiExport::_can_post_interpreter_events,
      &JvmtiExport::_can_post_on_exceptions,&JvmtiExport::_should_post_single_step,
      &JvmtiExport::_can_pop_frame,&JvmtiExport::_can_force_early_return,&JvmtiExport::_can_post_breakpoint};
  for (bool* flag:flags) {
    masm.movptr(rscratch1,(intptr_t)flag);
    masm.cmpb(Address(rscratch1,0),0);masm.jcc(Assembler::notEqual,ordinary);
  }
  masm.cmpw(Address(rdx,in_bytes(MethodCounters::number_of_breakpoints_offset())),0);
  masm.jcc(Assembler::notEqual,ordinary);
#endif
#ifdef ASSERT
  bool* const debug_flags[]={&TraceBytecodes,&CountBytecodes,&PrintBytecodeHistogram,&PrintBytecodePairHistogram};
  for (bool* flag:debug_flags) {
    masm.movptr(rscratch1,(intptr_t)flag);
    masm.cmpb(Address(rscratch1,0),0);masm.jcc(Assembler::notEqual,ordinary);
  }
  masm.movptr(rscratch1,(intptr_t)&StopInterpreterAt);
  masm.cmpq(Address(rscratch1,0),0);masm.jcc(Assembler::notEqual,ordinary);
#endif
  masm.incrementl(Address(rdx,in_bytes(MethodCounters::interpreter_pilot_hits_offset())));
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
  masm.bind(ordinary);
  masm.dispatch_next(vtos,0,true);
  masm.flush();
  int bytes=code.insts_size();
  guarantee(bytes<slot_size,"bounded pilot code slice");
  ICache::invalidate_range(arena+next_slot,bytes);
  stats[3]=bytes;stats[4]=end_bci;stats[5]=operations;
  counters->publish_interpreter_pilot(arena+next_slot);
  next_slot+=slot_size;
  return true;
}
#endif
