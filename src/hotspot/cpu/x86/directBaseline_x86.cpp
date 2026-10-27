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

#if defined(AMD64) && defined(COMPILER1)
#include "baseline/directBaseline.hpp"
#include "c1/c1_MacroAssembler.hpp"
#include "c1/c1_Runtime1.hpp"
#include "ci/ciEnv.hpp"
#include "ci/ciField.hpp"
#include "ci/ciSignature.hpp"
#include "ci/ciStreams.hpp"
#include "asm/codeBuffer.hpp"
#include "code/compiledIC.hpp"
#include "code/debugInfoRec.hpp"
#include "code/dependencies.hpp"
#include "code/exceptionHandlerTable.hpp"
#include "code/debugInfo.hpp"
#include "compiler/oopMap.hpp"
#include "oops/arrayOop.hpp"
#include "runtime/javaThread.hpp"
#include "compiler/abstractCompiler.hpp"
#include "compiler/compileBroker.hpp"
#include "compiler/compiler_globals.hpp"
#include "gc/shared/barrierSet.hpp"
#include "interpreter/invocationCounter.hpp"
#include "oops/method.inline.hpp"
#include "oops/methodCounters.hpp"
#include "oops/methodData.hpp"
#include "oops/trainingData.hpp"
#include "prims/jvmtiExport.hpp"
#include "runtime/deoptimization.hpp"
#include "runtime/mutexLocker.hpp"
#include "runtime/sharedRuntime.hpp"
#include "runtime/stubRoutines.hpp"
#include "utilities/align.hpp"

// A deliberately bounded, category-1, forward-CFG subset. Every Java value has
// a canonical full-word slot. Only rax/rbx/rcx/rdx/r8/r9/r10/r11 are scratch.
// Reference identity is retained at every merge and every safepoint. No IR is
// constructed: the prepass stores types, branch labels and resolved operands.
namespace {
BasicType kind(BasicType t) {
  if (is_reference_type(t)) return T_OBJECT;
  if (is_subword_type(t)) return T_INT;
  return t;
}
bool supported_type(BasicType t) { return kind(t) == T_INT || kind(t) == T_OBJECT; }

struct State : ResourceObj {
  BasicType* locals;
  BasicType* stack;
  int sp;
  State(int nl, int ns) : sp(0) {
    locals = NEW_RESOURCE_ARRAY(BasicType, nl);
    stack = NEW_RESOURCE_ARRAY(BasicType, ns);
    for (int i = 0; i < nl; i++) locals[i] = T_ILLEGAL;
  }
};

class Emitter : StackObj {
  ciEnv* _env;
  ciMethod* _method;
  AbstractCompiler* _compiler;
  const char* _failure;
  State** _states;
  Label* _labels;
  ciField** _fields;
  ciMethod** _callees;
  int _nl, _ns, _size, _out_words, _frame_bytes, _frame_words, _last_scope_pc;
  CodeBuffer* _code;
  C1_MacroAssembler* _masm;
  CodeOffsets _offsets;
  DebugInformationRecorder* _debug;
  OopMapSet* _maps;

  bool fail(const char* message) { if (_failure == nullptr) _failure = message; return false; }
  State* copy(State* s) {
    State* r = new State(_nl, _ns); r->sp = s->sp;
    for (int i = 0; i < _nl; i++) r->locals[i] = s->locals[i];
    for (int i = 0; i < s->sp; i++) r->stack[i] = s->stack[i];
    return r;
  }
  bool merge(int bci, State* s) {
    if (bci < 0 || bci >= _size) return fail("invalid branch target");
    if (_states[bci] == nullptr) { _states[bci] = copy(s); return true; }
    State* t = _states[bci];
    if (t->sp != s->sp) return fail("stack height merge");
    for (int i = 0; i < s->sp; i++) if (s->stack[i] != t->stack[i]) return fail("stack type merge");
    // A conservative whole-method fallback is preferable to guessing verifier
    // liveness for a local that is reused with another type on one branch.
    for (int i = 0; i < _nl; i++) if (s->locals[i] != t->locals[i]) return fail("local type merge");
    return true;
  }
  bool pop(State* s, BasicType t) {
    if (s->sp == 0 || (t != T_ILLEGAL && s->stack[s->sp-1] != t)) return fail("stack type");
    s->sp--; return true;
  }
  bool push(State* s, BasicType t) {
    if (s->sp >= _ns) return fail("stack overflow");
    s->stack[s->sp++] = t; return true;
  }
  bool signature(ciSignature* sig) {
    if (sig->return_type()->basic_type() != T_VOID && !supported_type(sig->return_type()->basic_type())) return false;
    for (int i = 0; i < sig->count(); i++) if (!supported_type(sig->type_at(i)->basic_type())) return false;
    return true;
  }
  int local_index(ciBytecodeStream& bs, Bytecodes::Code bc) {
    if (bc >= Bytecodes::_iload_0 && bc <= Bytecodes::_iload_3) return bc - Bytecodes::_iload_0;
    if (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3) return bc - Bytecodes::_aload_0;
    if (bc >= Bytecodes::_istore_0 && bc <= Bytecodes::_istore_3) return bc - Bytecodes::_istore_0;
    if (bc >= Bytecodes::_astore_0 && bc <= Bytecodes::_astore_3) return bc - Bytecodes::_astore_0;
    return bs.get_index();
  }
  bool prepass() {
    if (!_method->is_static() || _method->is_native() || _method->is_synchronized() ||
        _method->has_exception_handlers() || _method->has_monitor_bytecodes() ||
        _method->is_scoped() || _method->has_reserved_stack_access() ||
        _method->intrinsic_id() != vmIntrinsics::_none ||
        !_method->can_be_compiled() || _method->needs_clinit_barrier() ||
        !signature(_method->signature()) || _nl > 64 || _ns > 32 || _size > 512 || _size == 0) {
      return fail("method shape");
    }
    _states = NEW_RESOURCE_ARRAY(State*, _size);
    _labels = NEW_RESOURCE_ARRAY(Label, _size);
    _fields = NEW_RESOURCE_ARRAY(ciField*, _size);
    _callees = NEW_RESOURCE_ARRAY(ciMethod*, _size);
    for (int i = 0; i < _size; i++) { _states[i] = nullptr; new (&_labels[i]) Label(); }
    State* start = new State(_nl, _ns);
    ciSignature* sig = _method->signature();
    for (int i = 0; i < sig->count(); i++) start->locals[i] = kind(sig->type_at(i)->basic_type());
    _states[0] = start;
    ciBytecodeStream bs(_method);
    Bytecodes::Code bc;
    while ((bc = bs.next()) != ciBytecodeStream::EOBC()) {
      int bci = bs.cur_bci();
      if (_states[bci] == nullptr) return fail("unreachable bytecode");
      State* s = copy(_states[bci]);
      bool fall = true;
      if ((bc >= Bytecodes::_iload_0 && bc <= Bytecodes::_iload_3) || bc == Bytecodes::_iload ||
          (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3) || bc == Bytecodes::_aload) {
        int l = local_index(bs, bc);
        BasicType t = (bc == Bytecodes::_aload || (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3)) ? T_OBJECT : T_INT;
        if (l >= _nl || s->locals[l] != t || !push(s, t)) return fail("local load");
      } else if ((bc >= Bytecodes::_istore_0 && bc <= Bytecodes::_istore_3) || bc == Bytecodes::_istore ||
                 (bc >= Bytecodes::_astore_0 && bc <= Bytecodes::_astore_3) || bc == Bytecodes::_astore) {
        int l = local_index(bs, bc);
        BasicType t = (bc == Bytecodes::_astore || (bc >= Bytecodes::_astore_0 && bc <= Bytecodes::_astore_3)) ? T_OBJECT : T_INT;
        if (l >= _nl || !pop(s, t)) return fail("local store");
        s->locals[l] = t;
      } else if (bc >= Bytecodes::_iconst_m1 && bc <= Bytecodes::_iconst_5) {
        if (!push(s, T_INT)) return false;
      } else switch (bc) {
        case Bytecodes::_nop: break;
        case Bytecodes::_aconst_null: if (!push(s, T_OBJECT)) return false;
          break;
        case Bytecodes::_bipush: case Bytecodes::_sipush: if (!push(s, T_INT)) return false;
          break;
        case Bytecodes::_ldc: case Bytecodes::_ldc_w:
          if (bs.get_constant().basic_type() != T_INT || !push(s, T_INT)) return fail("constant type");
          break;
        case Bytecodes::_iinc:
          if (bs.get_index() >= _nl || s->locals[bs.get_index()] != T_INT) return fail("iinc type");
          break;
        case Bytecodes::_pop: if (!pop(s, T_ILLEGAL)) return false;
          break;
        case Bytecodes::_dup:
          if (s->sp == 0 || !push(s, s->stack[s->sp-1])) return fail("dup type");
          break;
        case Bytecodes::_iadd: case Bytecodes::_isub: case Bytecodes::_imul:
        case Bytecodes::_iand: case Bytecodes::_ior: case Bytecodes::_ixor:
        case Bytecodes::_ishl: case Bytecodes::_ishr: case Bytecodes::_iushr:
          if (!pop(s, T_INT) || !pop(s, T_INT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_ineg: case Bytecodes::_i2b: case Bytecodes::_i2c: case Bytecodes::_i2s:
          if (!pop(s, T_INT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_getfield: case Bytecodes::_putfield: {
          bool link = false; ciField* f = bs.get_field(link);
          if (!link || !f->will_link(_method, bc) ||
              strcmp(f->holder()->name()->as_utf8(), "java/lang/ref/Reference") == 0 || f->is_static() || !supported_type(f->type()->basic_type())) return fail("unresolved/unsupported field");
          _fields[bci] = f;
          if (bc == Bytecodes::_putfield && !pop(s, kind(f->type()->basic_type()))) return false;
          if (!pop(s, T_OBJECT)) return false;
          if (bc == Bytecodes::_getfield && !push(s, kind(f->type()->basic_type()))) return false;
          break;
        }
        case Bytecodes::_arraylength:
          if (!pop(s, T_OBJECT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_iaload: case Bytecodes::_baload: case Bytecodes::_caload: case Bytecodes::_saload: case Bytecodes::_aaload:
          if (!pop(s, T_INT) || !pop(s, T_OBJECT) || !push(s, bc == Bytecodes::_aaload ? T_OBJECT : T_INT)) return false;
          break;
        case Bytecodes::_iastore:
          if (!pop(s, T_INT) || !pop(s, T_INT) || !pop(s, T_OBJECT)) return false;
          break;
        case Bytecodes::_invokestatic: {
          bool link = false; ciSignature* declared = nullptr;
          ciMethod* m = bs.get_method(link, &declared);
          if (!link || !m->is_loaded() || !m->is_static() || !signature(declared) ||
              m->is_method_handle_intrinsic() || m->is_scoped() ||
              strcmp(m->holder()->name()->as_utf8(), "jdk/internal/vm/Continuation") == 0 ||
              !m->holder()->is_initialized()) return fail("unresolved/unsupported call");
          _callees[bci] = m;
          int n = declared->count();
          BasicType* types = NEW_RESOURCE_ARRAY(BasicType, n);
          VMRegPair* regs = NEW_RESOURCE_ARRAY(VMRegPair, n);
          for (int i = 0; i < n; i++) types[i] = declared->type_at(i)->basic_type();
          int slots = SharedRuntime::java_calling_convention(types, regs, n);
          _out_words = MAX2(_out_words, (slots + 1) / 2);
          for (int i = n-1; i >= 0; i--) if (!pop(s, kind(types[i]))) return false;
          if (declared->return_type()->basic_type() != T_VOID && !push(s, kind(declared->return_type()->basic_type()))) return false;
          break;
        }
        case Bytecodes::_ireturn: case Bytecodes::_areturn:
          if (!pop(s, bc == Bytecodes::_ireturn ? T_INT : T_OBJECT)) return false;
          fall = false;
          break;
        case Bytecodes::_return: fall = false;
          break;
        case Bytecodes::_ifeq: case Bytecodes::_ifne: case Bytecodes::_iflt:
        case Bytecodes::_ifge: case Bytecodes::_ifgt: case Bytecodes::_ifle:
        case Bytecodes::_ifnull: case Bytecodes::_ifnonnull:
        case Bytecodes::_if_icmpeq: case Bytecodes::_if_icmpne: case Bytecodes::_if_icmplt:
        case Bytecodes::_if_icmpge: case Bytecodes::_if_icmpgt: case Bytecodes::_if_icmple:
        case Bytecodes::_if_acmpeq: case Bytecodes::_if_acmpne: case Bytecodes::_goto: {
          if (bc >= Bytecodes::_if_icmpeq && bc <= Bytecodes::_if_acmpne) {
            BasicType t = bc >= Bytecodes::_if_acmpeq ? T_OBJECT : T_INT;
            if (!pop(s, t) || !pop(s, t)) return false;
          } else if (bc != Bytecodes::_goto && !pop(s, bc >= Bytecodes::_ifnull ? T_OBJECT : T_INT)) return false;
          int target = bs.get_dest();
          if (target <= bci) return fail("loop excluded (preserve interpreter OSR)");
          if (!merge(target, s)) return false;
          fall = bc != Bytecodes::_goto;
          break;
        }
        default: return fail("unsupported bytecode");
      }
      if (fall && !merge(bs.next_bci(), s)) return false;
    }
    return true;
  }

  int local_offset(int i) { return (_out_words + i) * wordSize; }
  int stack_offset(int i) { return local_offset(_nl + i); }
  Address local(int i) { return Address(rsp, local_offset(i)); }
  Address stack(int i) { return Address(rsp, stack_offset(i)); }

  void safepoint(int bci, State* s, int expression_sp = -1, bool reexecute = false, bool return_oop = false) {
    int pc = _masm->offset();
    _last_scope_pc = pc;
    OopMap* map = new OopMap(_frame_words * VMRegImpl::slots_per_word, 0);
    GrowableArray<ScopeValue*> locals;
    GrowableArray<ScopeValue*> expressions;
    for (int i = 0; i < _nl; i++) {
      BasicType t = s->locals[i];
      if (t == T_ILLEGAL) { locals.append(new LocationValue(Location())); continue; }
      Location::Type lt = t == T_OBJECT ? Location::oop : Location::normal;
      locals.append(new LocationValue(Location::new_stk_loc(lt, local_offset(i))));
      if (t == T_OBJECT) map->set_oop(VMRegImpl::stack2reg(local_offset(i) / VMRegImpl::stack_slot_size));
    }
    for (int i = 0; i < s->sp; i++) {
      BasicType t = s->stack[i];
      if (t == T_OBJECT) map->set_oop(VMRegImpl::stack2reg(stack_offset(i) / VMRegImpl::stack_slot_size));
      if (i < (expression_sp < 0 ? s->sp : expression_sp))
        expressions.append(new LocationValue(Location::new_stk_loc(t == T_OBJECT ? Location::oop : Location::normal, stack_offset(i))));
    }
    _debug->add_safepoint(pc, map);
    _debug->describe_scope(pc, methodHandle(), _method, bci, reexecute, false, return_oop,
                           false, false, _debug->create_scope_values(&locals),
                           _debug->create_scope_values(&expressions));
    _debug->end_safepoint(pc);
  }

#define __ _masm->
  void deopt_if(Assembler::Condition ok, int bci, State* s) {
    Label good;
    __ jcc(ok, good);
    __ movl(Address(rsp, 0), Deoptimization::make_trap_request(Deoptimization::Reason_unhandled,
                                                             Deoptimization::Action_none));
    __ call(RuntimeAddress(Runtime1::entry_for(StubId::c1_deoptimize_id)));
    safepoint(bci, s, -1, true);
    __ should_not_reach_here();
    __ bind(good);
  }
  void null_check(Register obj, int bci, State* s) {
    __ testptr(obj, obj); deopt_if(Assembler::notZero, bci, s);
  }
  void increment_counter(Address count, Address mask, Label& overflow) {
    __ movl(rcx, count);
    __ incrementl(rcx, InvocationCounter::count_increment);
    __ movl(count, rcx);
    __ andl(rcx, mask);
    __ jcc(Assembler::zero, overflow);
  }
  void counter() {
    Label done, overflow;
    __ mov_metadata(rbx, _method->constant_encoding());
    // Like counting-only C1, unprofiled direct code counts in MethodCounters
    // even when an MDO exists. Do not age an MDO without collecting its
    // profiles. Interpreted/C1 profiling, including inlinees, owns those counters.
    __ movptr(r10, Address(rbx, Method::method_counters_offset()));
    increment_counter(Address(r10, in_bytes(MethodCounters::invocation_counter_offset()) + in_bytes(InvocationCounter::counter_offset())),
                               Address(r10, in_bytes(MethodCounters::invoke_mask_offset())), overflow);
    __ jmp(done);
    __ bind(overflow);
    __ movl(Address(rsp, 0), InvocationEntryBci);
    __ movptr(Address(rsp, wordSize), rbx);
    __ call(RuntimeAddress(Runtime1::entry_for(StubId::c1_counter_overflow_id)));
    safepoint(SynchronizationEntryBCI, _states[0]);
    __ bind(done);
    if (TraceDirectBaseline) {
      // Count actual Java body entries.
      __ movptr(r10, Address(rbx, Method::method_counters_offset()));
      __ incrementl(Address(r10, in_bytes(MethodCounters::direct_baseline_entries_offset())));
    }
  }
  Assembler::Condition condition(Bytecodes::Code bc) {
    switch (bc) {
      case Bytecodes::_ifeq: case Bytecodes::_if_icmpeq: case Bytecodes::_if_acmpeq: case Bytecodes::_ifnull: return Assembler::equal;
      case Bytecodes::_ifne: case Bytecodes::_if_icmpne: case Bytecodes::_if_acmpne: case Bytecodes::_ifnonnull: return Assembler::notEqual;
      case Bytecodes::_iflt: case Bytecodes::_if_icmplt: return Assembler::less;
      case Bytecodes::_ifge: case Bytecodes::_if_icmpge: return Assembler::greaterEqual;
      case Bytecodes::_ifgt: case Bytecodes::_if_icmpgt: return Assembler::greater;
      case Bytecodes::_ifle: case Bytecodes::_if_icmple: return Assembler::lessEqual;
      default: ShouldNotReachHere(); return Assembler::equal;
    }
  }
  void java_call(int bci, State* s) {
    ciMethod* callee = _callees[bci];
    ciSignature* sig = callee->signature();
    int n = sig->count();
    BasicType* types = NEW_RESOURCE_ARRAY(BasicType, n);
    VMRegPair* regs = NEW_RESOURCE_ARRAY(VMRegPair, n);
    for (int i = 0; i < n; i++) types[i] = sig->type_at(i)->basic_type();
    SharedRuntime::java_calling_convention(types, regs, n);
    for (int i = 0; i < n; i++) {
      bool oop = kind(types[i]) == T_OBJECT;
      // Integer arguments occupy one 32-bit VMReg slot. Loading full words
      // propagates uninitialized upper bits which optimized callees may use
      // as an unsigned, already-extended array index.
      if (oop) __ movptr(rax, stack(s->sp - n + i));
      else __ movl(rax, stack(s->sp - n + i));
      if (regs[i].first()->is_reg()) {
        if (oop) __ movptr(regs[i].first()->as_Register(), rax);
        else __ movl(regs[i].first()->as_Register(), rax);
      } else {
        Address arg(rsp, regs[i].first()->reg2stack() * VMRegImpl::stack_slot_size);
        if (oop) __ movptr(arg, rax); else __ movl(arg, rax);
      }
    }
    __ align(wordSize, __ offset() + NativeCall::displacement_offset);
    if (CompiledDirectCall::emit_to_interp_stub(_masm, _masm->pc()) == nullptr) { fail("call stub space"); return; }
    __ call(AddressLiteral(SharedRuntime::get_resolve_static_call_stub(), relocInfo::static_call_type));
    safepoint(bci, s, s->sp - n, false, kind(sig->return_type()->basic_type()) == T_OBJECT);
    __ post_call_nop();
    if (kind(sig->return_type()->basic_type()) == T_OBJECT) __ movptr(stack(s->sp - n), rax);
    else if (sig->return_type()->basic_type() != T_VOID) __ movl(stack(s->sp - n), rax);
  }
  void field(Bytecodes::Code bc, int bci, State* s) {
    ciField* f = _fields[bci];
    BasicType t = f->type()->basic_type();
    bool load = bc == Bytecodes::_getfield;
    int obj = s->sp - (load ? 1 : 2);
    __ movptr(rbx, stack(obj)); null_check(rbx, bci, s);
    Address address(rbx, f->offset_in_bytes());
    if (load) {
      __ access_load_at(t, IN_HEAP, rax, address, r10);
      __ movptr(stack(obj), rax);
    } else {
      __ movptr(rax, stack(s->sp-1));
      __ access_store_at(t, IN_HEAP, address, rax, r8, r9, r10);
      if (f->is_volatile()) __ membar(Assembler::StoreLoad);
    }
  }
  void array(Bytecodes::Code bc, int bci, State* s) {
    bool store = bc == Bytecodes::_iastore;
    int base = s->sp - (store ? 3 : 2);
    if (bc == Bytecodes::_arraylength) base = s->sp - 1;
    __ movptr(rbx, stack(base)); null_check(rbx, bci, s);
    __ movl(rdx, Address(rbx, arrayOopDesc::length_offset_in_bytes()));
    if (bc == Bytecodes::_arraylength) { __ movl(stack(base), rdx); return; }
    __ movl(rcx, stack(base+1));
    __ cmpl(rcx, rdx); deopt_if(Assembler::below, bci, s);
    BasicType t = bc == Bytecodes::_aaload ? T_OBJECT :
                  bc == Bytecodes::_baload ? T_BYTE : bc == Bytecodes::_caload ? T_CHAR :
                  bc == Bytecodes::_saload ? T_SHORT : T_INT;
    Address address(rbx, rcx, Address::times( type2aelembytes(t) ), arrayOopDesc::base_offset_in_bytes(t));
    if (store) {
      __ movl(rax, stack(base+2));
      __ access_store_at(t, IN_HEAP | IS_ARRAY, address, rax, r8, r9, r10);
    } else {
      __ access_load_at(t, IN_HEAP | IS_ARRAY, rax, address, r10);
      __ movptr(stack(base), rax);
    }
  }
  void epilog() {
    // A bounded loop-free body still needs a return poll for safepoint progress.
    __ remove_frame(_frame_bytes);
    Label poll;
    int pc = __ offset();
    __ relocate(relocInfo::poll_return_type);
    __ safepoint_poll(poll, true, true);
    __ ret(0);
    __ bind(poll);
    __ lea(rscratch1, InternalAddress(_code->insts_begin() + pc));
    __ movptr(Address(r15_thread, JavaThread::saved_exception_pc_offset()), rscratch1);
    __ jump(RuntimeAddress(SharedRuntime::polling_page_return_handler_blob()->entry_point()));
  }
  void emit() {
    _frame_bytes = align_up((_out_words + _nl + _ns + 1) * wordSize, StackAlignmentInBytes);
    _frame_words = _frame_bytes / wordSize + 2; // saved rbp and return address
    _code->initialize_consts_size(128);
    _code->initialize_stubs_size(8192);
    _code->initialize_oop_recorder(_env->oop_recorder());
    _masm = new C1_MacroAssembler(_code);
    __ set_oop_recorder(_env->oop_recorder());
    _offsets.set_value(CodeOffsets::Verified_Entry, __ offset());
    _offsets.set_value(CodeOffsets::Entry, __ offset());
    // The bounded subset's interpreter activation is less than one page
    // larger than this frame. Reserve that space for a possible deopt.
    __ build_frame(_frame_bytes, _frame_bytes + os::vm_page_size() + os::extra_bang_size_in_bytes());
    _offsets.set_value(CodeOffsets::Frame_Complete, __ offset());
    ciSignature* sig = _method->signature();
    int n = sig->count();
    BasicType* types = NEW_RESOURCE_ARRAY(BasicType, n);
    VMRegPair* regs = NEW_RESOURCE_ARRAY(VMRegPair, n);
    for (int i = 0; i < n; i++) types[i] = sig->type_at(i)->basic_type();
    SharedRuntime::java_calling_convention(types, regs, n);
    for (int i = 0; i < n; i++) {
      bool oop = kind(types[i]) == T_OBJECT;
      if (regs[i].first()->is_reg()) {
        if (oop) __ movptr(local(i), regs[i].first()->as_Register());
        else __ movl(local(i), regs[i].first()->as_Register());
      } else {
        Address arg(rsp, _frame_bytes + 2*wordSize + regs[i].first()->reg2stack()*VMRegImpl::stack_slot_size);
        if (oop) { __ movptr(rax, arg); __ movptr(local(i), rax); }
        else { __ movl(rax, arg); __ movl(local(i), rax); }
      }
    }
    counter();
    ciBytecodeStream bs(_method);
    Bytecodes::Code bc;
    while ((bc = bs.next()) != ciBytecodeStream::EOBC()) {
      int bci = bs.cur_bci(); State* s = _states[bci]; int sp = s->sp;
      __ bind(_labels[bci]);
      if (_debug->recording_non_safepoints() && __ offset() > _last_scope_pc) {
        _last_scope_pc = __ offset();
        _debug->add_non_safepoint(_last_scope_pc);
        _debug->describe_scope(_last_scope_pc, methodHandle(), _method, bci, false);
        _debug->end_non_safepoint(_last_scope_pc);
      }
      if ((bc >= Bytecodes::_iload_0 && bc <= Bytecodes::_iload_3) || bc == Bytecodes::_iload ||
          (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3) || bc == Bytecodes::_aload) {
        __ movptr(rax, local(local_index(bs, bc))); __ movptr(stack(sp), rax);
      } else if ((bc >= Bytecodes::_istore_0 && bc <= Bytecodes::_istore_3) || bc == Bytecodes::_istore ||
                 (bc >= Bytecodes::_astore_0 && bc <= Bytecodes::_astore_3) || bc == Bytecodes::_astore) {
        __ movptr(rax, stack(sp-1)); __ movptr(local(local_index(bs, bc)), rax);
      } else if (bc >= Bytecodes::_iconst_m1 && bc <= Bytecodes::_iconst_5) {
        __ movl(stack(sp), bc - Bytecodes::_iconst_0);
      } else switch (bc) {
        case Bytecodes::_nop: case Bytecodes::_pop: break;
        case Bytecodes::_aconst_null: __ movptr(stack(sp), NULL_WORD);
          break;
        case Bytecodes::_bipush: __ movl(stack(sp), (jbyte)bs.get_constant_u1());
          break;
        case Bytecodes::_sipush: __ movl(stack(sp), (jshort)bs.get_constant_u2());
          break;
        case Bytecodes::_ldc: case Bytecodes::_ldc_w: __ movl(stack(sp), bs.get_constant().as_int());
          break;
        case Bytecodes::_iinc: __ addl(local(bs.get_index()), bs.get_iinc_con());
          break;
        case Bytecodes::_dup: __ movptr(rax, stack(sp-1)); __ movptr(stack(sp), rax);
          break;
        case Bytecodes::_iadd: case Bytecodes::_isub: case Bytecodes::_imul:
        case Bytecodes::_iand: case Bytecodes::_ior: case Bytecodes::_ixor:
        case Bytecodes::_ishl: case Bytecodes::_ishr: case Bytecodes::_iushr:
          __ movl(rax, stack(sp-2)); __ movl(rcx, stack(sp-1));
          switch (bc) {
            case Bytecodes::_iadd: __ addl(rax, rcx);
          break;
            case Bytecodes::_isub: __ subl(rax, rcx);
          break;
            case Bytecodes::_imul: __ imull(rax, rcx);
          break;
            case Bytecodes::_iand: __ andl(rax, rcx);
          break;
            case Bytecodes::_ior: __ orl(rax, rcx);
          break;
            case Bytecodes::_ixor: __ xorl(rax, rcx);
          break;
            case Bytecodes::_ishl: __ shll(rax);
          break;
            case Bytecodes::_ishr: __ sarl(rax);
          break;
            case Bytecodes::_iushr: __ shrl(rax);
          break;
            default: ShouldNotReachHere();
          }
          __ movl(stack(sp-2), rax);
          break;
        case Bytecodes::_ineg: case Bytecodes::_i2b: case Bytecodes::_i2c: case Bytecodes::_i2s:
          __ movl(rax, stack(sp-1));
          if (bc == Bytecodes::_ineg) __ negl(rax);
          else if (bc == Bytecodes::_i2b) __ movsbl(rax, rax);
          else if (bc == Bytecodes::_i2c) __ movzwl(rax, rax);
          else __ movswl(rax, rax);
          __ movl(stack(sp-1), rax);
          break;
        case Bytecodes::_getfield: case Bytecodes::_putfield: field(bc, bci, s);
          break;
        case Bytecodes::_arraylength: case Bytecodes::_iaload: case Bytecodes::_iastore:
        case Bytecodes::_baload: case Bytecodes::_caload: case Bytecodes::_saload: case Bytecodes::_aaload:
          array(bc, bci, s);
          break;
        case Bytecodes::_invokestatic: java_call(bci, s);
          break;
        case Bytecodes::_ireturn: case Bytecodes::_areturn:
          if (bc == Bytecodes::_areturn) __ movptr(rax, stack(sp-1));
          else __ movl(rax, stack(sp-1));
          if (bc == Bytecodes::_ireturn) {
            switch (_method->signature()->return_type()->basic_type()) {
              case T_BOOLEAN: __ andl(rax, 1); break;
              case T_BYTE: __ movsbl(rax, rax); break;
              case T_CHAR: __ movzwl(rax, rax); break;
              case T_SHORT: __ movswl(rax, rax); break;
              default: break;
            }
          }
          epilog();
          break;
        case Bytecodes::_return: epilog();
          break;
        case Bytecodes::_goto: __ jmp(_labels[bs.get_dest()]);
          break;
        default:
          if (bc >= Bytecodes::_if_icmpeq && bc <= Bytecodes::_if_acmpne) {
            __ movptr(rax, stack(sp-2)); __ movptr(rcx, stack(sp-1));
            if (bc >= Bytecodes::_if_acmpeq) __ cmpptr(rax, rcx); else __ cmpl(rax, rcx);
          } else {
            __ movptr(rax, stack(sp-1));
            if (bc == Bytecodes::_ifnull || bc == Bytecodes::_ifnonnull) __ testptr(rax, rax);
            else __ testl(rax, rax);
          }
          __ jcc(condition(bc), _labels[bs.get_dest()]);
          break;
      }
      if (_failure != nullptr) return;
    }
    // CodeOffsets::Exceptions and Deopt are relative to the stub section,
    // whereas UnwindHandler is relative to the instruction section.
    if (__ start_a_stub(256) == nullptr) { fail("direct exception stub space"); return; }
    _offsets.set_value(CodeOffsets::Exceptions, __ offset());
    __ call(RuntimeAddress(Runtime1::entry_for(StubId::c1_handle_exception_from_callee_id)));
    __ should_not_reach_here();
    __ end_a_stub();
    _offsets.set_value(CodeOffsets::UnwindHandler, __ offset());
    __ movptr(rax, Address(r15_thread, JavaThread::exception_oop_offset()));
    __ movptr(Address(r15_thread, JavaThread::exception_oop_offset()), NULL_WORD);
    __ movptr(Address(r15_thread, JavaThread::exception_pc_offset()), NULL_WORD);
    __ remove_frame(_frame_bytes);
    __ jump(RuntimeAddress(Runtime1::entry_for(StubId::c1_unwind_exception_id)));
    if (__ start_a_stub(64) == nullptr) { fail("direct deopt stub space"); return; }
    Label deopt;
    __ bind(deopt);
    __ call(RuntimeAddress(SharedRuntime::deopt_blob()->unpack()));
    _offsets.set_value(CodeOffsets::Deopt, __ offset());
    __ jmp(deopt);
    __ end_a_stub();
    __ flush();
    if (!_code->finalize_stubs()) fail("direct stub finalization");
  }
#undef __
 public:
  Emitter(ciEnv* env, ciMethod* method, AbstractCompiler* compiler) :
    _env(env), _method(method), _compiler(compiler), _failure(nullptr),
    _nl(method->max_locals()), _ns(method->max_stack()), _size(method->code_size()),
    _out_words(2), _frame_bytes(0), _frame_words(0), _last_scope_pc(-1), _code(nullptr), _masm(nullptr), _debug(nullptr), _maps(nullptr) {
  }
  void compile(bool install) {
    if (!prepass()) { _env->record_failure(_failure); return; }
    OopRecorder* recorder = new OopRecorder(_env->arena());
    _env->set_oop_recorder(recorder);
    _debug = new DebugInformationRecorder(recorder);
    _maps = new OopMapSet(); _debug->set_oopmaps(_maps);
    _env->set_debug_info(_debug);
    _env->set_dependencies(new Dependencies(_env));
    if (_env->jvmti_can_hotswap_or_post_breakpoint()) _env->dependencies()->assert_evol_method(_method);
    CodeBuffer code("direct baseline", 65536, 16384);
    _code = &code;
    if (code.blob() == nullptr) { _env->record_failure("direct code buffer allocation"); return; }
    emit();
    if (_failure != nullptr) { _env->record_failure(_failure); _code->free_blob(); return; }
    ExceptionHandlerTable handlers;
    ImplicitExceptionTable implicit;
    if (install) {
      _env->register_method(_method, InvocationEntryBci, &_offsets, _frame_bytes-wordSize,
                            _code, _frame_words, _maps, &handlers, &implicit, _compiler,
                            false, false, false, false, 0);
    } else _code->free_blob();
  }
};

class DirectCompiler : public AbstractCompiler {
 public:
  DirectCompiler() : AbstractCompiler(compiler_direct_baseline) {}
  const char* name() override { return "direct"; }
  void initialize() override {
    // Runtime1 stubs are initialized once by the ordinary C1 worker. Wait
    // for that contract without allocating a C1 buffer or running its setup.
    AbstractCompiler* c1 = CompileBroker::compiler(CompLevel_simple);
    bool ready = false;
    if (c1 != nullptr) {
      MonitorLocker locker(CompileThread_lock);
      while (!c1->is_initialized() && !c1->is_failed() && !CompileBroker::is_compilation_disabled_forever()) {
        locker.wait();
      }
      ready = c1->is_initialized();
    }
    set_state(ready ? initialized : failed);
  }
  void compile_method(ciEnv* env, ciMethod* target, int bci, bool install, DirectiveSet* directive) override {
    jlong begin = TraceDirectBaseline ? os::javaTimeNanos() : 0;
    jlong cpu = TraceDirectBaseline ? os::current_thread_cpu_time() : 0;
    if (bci != InvocationEntryBci || directive->ExcludeOption || env->dtrace_method_probes() ||
        env->jvmti_can_post_on_exceptions() || env->jvmti_can_get_owned_monitor_info() || env->jvmti_can_walk_any_space() ||
        TrainingData::have_data() || TrainingData::need_data() || ReplayCompiles) {
      env->record_failure("direct baseline excluded"); return;
    }
    Emitter emitter(env, target, this); emitter.compile(install);
    if (TraceDirectBaseline) {
      ttyLocker ttyl;
      tty->print_cr("direct compile %s %s%s bytes=%d elapsed_ns=" JLONG_FORMAT " cpu_ns=" JLONG_FORMAT " outcome=%s",
                    target->holder()->name()->as_utf8(), target->name()->as_utf8(), target->signature()->as_symbol()->as_utf8(),
                    target->code_size(), os::javaTimeNanos() - begin, os::current_thread_cpu_time() - cpu,
                    env->failing() ? env->failure_reason() : "installed");
    }
  }
};
} // anonymous namespace

AbstractCompiler* DirectBaseline::compiler() { static DirectCompiler* c = new DirectCompiler(); return c; }
void DirectBaseline::request(const methodHandle& method, JavaThread* thread) {
  if (!UseDirectBaseline || !UseCompiler || !TieredCompilation || !ProfileInterpreter || TieredStopAtLevel < 3 ||
      !CompilationModeFlag::normal() || ReplayCompiles || TrainingData::have_data() || TrainingData::need_data() ||
      (!UseSerialGC && !UseG1GC) || JvmtiExport::can_post_interpreter_events() || method->method_data() != nullptr || method->is_native() ||
      !method->is_static() || method->is_synchronized() || method->is_method_handle_intrinsic() ||
      method->number_of_breakpoints() != 0 || (method->is_old() || method->is_not_compilable(CompLevel_simple))) {
    // Remember permanent exclusions too: the masked early notification recurs.
    MethodCounters* mc = method->method_counters();
    if (mc != nullptr) {
      MutexLocker locker(thread, MethodCompileQueue_lock);
      mc->set_direct_baseline_attempted();
    }
    return;
  }
  CompileBroker::request_direct_baseline(method, thread);
}
#endif // AMD64 && COMPILER1
