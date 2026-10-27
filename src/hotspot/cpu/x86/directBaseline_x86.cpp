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
#include "ci/ciKlass.hpp"
#include "ci/ciInstance.hpp"
#include "ci/ciInstanceKlass.hpp"
#include "ci/ciObjArrayKlass.hpp"
#include "ci/ciTypeArrayKlass.hpp"
#include "ci/ciSignature.hpp"
#include "ci/ciStreams.hpp"
#include "ci/ciUtilities.inline.hpp"
#include "asm/codeBuffer.hpp"
#include "code/compiledIC.hpp"
#include "code/codeBlob.hpp"
#include "code/debugInfoRec.hpp"
#include "code/dependencies.hpp"
#include "code/exceptionHandlerTable.hpp"
#include "code/debugInfo.hpp"
#include "compiler/oopMap.hpp"
#include "oops/arrayOop.hpp"
#include "oops/constantPool.inline.hpp"
#include "oops/objArrayKlass.hpp"
#include "runtime/javaThread.inline.hpp"
#include "compiler/abstractCompiler.hpp"
#include "compiler/compileBroker.hpp"
#include "compiler/compilerThread.hpp"
#include "compiler/compiler_globals.hpp"
#include "gc/shared/barrierSet.hpp"
#include "interpreter/invocationCounter.hpp"
#include "interpreter/bytecodeStream.hpp"
#include "runtime/signature.hpp"
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

// A deliberately bounded int/long/reference subset with verified block states. Every Java value has
// a canonical full-word slot. Only rax/rbx/rcx/rdx/r8/r9/r10/r11 are scratch.
// Reference identity is retained at every merge and every safepoint. No IR is
// constructed: the worker pass stores categories and branch states. Operands are
// resolved only while emitting a structurally eligible body.
namespace {
BasicType kind(BasicType t) {
  if (is_reference_type(t)) return T_OBJECT;
  if (is_subword_type(t)) return T_INT;
  return t;
}
bool supported_type(BasicType t) { return kind(t) == T_INT || kind(t) == T_LONG || kind(t) == T_OBJECT; }
int value_slots(BasicType t) { return t == T_LONG ? 2 : 1; }
bool ordinary_bytecode_root(vmIntrinsics::ID id) {
  // The VM distinguishes bytecode intrinsics from library replacements whose
  // semantics may differ from their Java bodies. Object.<init> additionally
  // needs finalizer registration; MH/lambda markers have special entry rules.
  return id == vmIntrinsics::_none ||
      (id > vmIntrinsics::LAST_COMPILER_INLINE && id != vmIntrinsics::_Object_init &&
       !(id >= vmIntrinsics::FIRST_MH_SIG_POLY && id <= vmIntrinsics::LAST_MH_SIG_POLY) &&
       id != vmIntrinsics::_compiledLambdaForm);
}

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

// Return source-slot order for the JVMS stack operations. Long payloads
// occupy the first Java slot, with a VOID companion; a category-2 value is
// never split at a group boundary. This builds no intermediate instruction IR.
bool stack_shuffle(Bytecodes::Code bc, State* s, int& inputs, int& outputs, int order[6]) {
  auto width = [&](int end) -> int {
    if (end<=0) return 0;
    BasicType t=s->stack[end-1];
    if (t==T_VOID) return end>=2 && s->stack[end-2]==T_LONG ? 2 : 0;
    return t==T_INT || t==T_OBJECT ? 1 : 0;
  };
  auto group = [&](int end, int slots) -> bool {
    while (slots>0) { int n=width(end); if (n==0 || n>slots) return false;end-=n;slots-=n; }
    return true;
  };
  int top=width(s->sp);inputs=outputs=0;
  switch (bc) {
    case Bytecodes::_pop: if (top!=1) return false;inputs=1;break;
    case Bytecodes::_pop2: if (!group(s->sp,2)) return false;inputs=2;break;
    case Bytecodes::_dup: if (top!=1) return false;inputs=1;outputs=2;order[0]=order[1]=0;break;
    case Bytecodes::_dup_x1:
      if (top!=1 || width(s->sp-1)!=1) return false;
      inputs=2;outputs=3;order[0]=1;order[1]=0;order[2]=1;break;
    case Bytecodes::_dup_x2:
      if (top!=1 || !group(s->sp-1,2)) return false;
      inputs=3;outputs=4;order[0]=2;order[1]=0;order[2]=1;order[3]=2;break;
    case Bytecodes::_dup2:
      if (!group(s->sp,2)) return false;
      inputs=2;outputs=4;order[0]=0;order[1]=1;order[2]=0;order[3]=1;break;
    case Bytecodes::_dup2_x1:
      if (!group(s->sp,2) || width(s->sp-2)!=1) return false;
      inputs=3;outputs=5;order[0]=1;order[1]=2;order[2]=0;order[3]=1;order[4]=2;break;
    case Bytecodes::_dup2_x2:
      if (!group(s->sp,2) || !group(s->sp-2,2)) return false;
      inputs=4;outputs=6;order[0]=2;order[1]=3;order[2]=0;order[3]=1;order[4]=2;order[5]=3;break;
    case Bytecodes::_swap:
      if (top!=1 || width(s->sp-1)!=1) return false;
      inputs=2;outputs=2;order[0]=1;order[1]=0;break;
    default: return false;
  }
  return true;
}

class BasicSignature : public ResourceObj {
  Symbol* _symbol;
  GrowableArray<BasicType> _types;
  BasicType _return_type;
  bool _valid;
  BasicType* _argument_types;
  VMRegPair* _argument_regs;
  void parameter(BasicType type) {
    _types.append(type);
    if (type==T_LONG) _types.append(T_VOID);
    if (!supported_type(type)) _valid=false;
  }
 public:
  explicit BasicSignature(Symbol* symbol, uint64_t fingerprint = 0) : _symbol(symbol), _types(8), _return_type(T_ILLEGAL), _valid(true),
    _argument_types(nullptr), _argument_regs(nullptr) {
    if (SignatureIterator::fp_is_valid(fingerprint)) {
      uint64_t parameters=SignatureIterator::fp_start_parameters(fingerprint);
      for (BasicType type; (type=SignatureIterator::fp_next_parameter(parameters))!=0;) parameter(type);
      _return_type=SignatureIterator::fp_return_type(fingerprint);
#ifdef ASSERT
      int slot=0;
      for (SignatureStream ss(symbol); !ss.is_done(); ss.next()) {
        if (ss.at_return_type()) {
          assert(_return_type==ss.type() || (is_reference_type(_return_type) && is_reference_type(ss.type())), "fingerprint result");
        } else {
          assert(slot<_types.length() && kind(_types.at(slot))==kind(ss.type()), "fingerprint parameter");
          slot+=ss.type()==T_LONG?2:1;
        }
      }
      assert(slot==_types.length(), "fingerprint parameter slots");
#endif
    } else {
      // Unavailable and overflow fingerprints retain the descriptor path.
      for (SignatureStream ss(symbol); !ss.is_done(); ss.next()) {
        if (ss.at_return_type()) _return_type=ss.type();
        else parameter(ss.type());
      }
    }
    if (_return_type!=T_VOID && !supported_type(_return_type)) _valid=false;
  }
  Symbol* symbol() const { return _symbol; }
  int count() const { return _types.length(); }
  BasicType type_at(int i) const { return _types.at(i); }
  BasicType return_type() const { return _return_type; }
  bool valid() const { return _valid; }
  void set_call_arguments(BasicType* types, VMRegPair* regs) {
    _argument_types=types; _argument_regs=regs;
  }
  BasicType* argument_types() const { return _argument_types; }
  VMRegPair* argument_regs() const { return _argument_regs; }
};
BasicType argument_type(BasicSignature* sig, bool is_static, int i) {
  return !is_static && i==0 ? T_OBJECT : sig->type_at(i-(is_static?0:1));
}

// Only categories, branch states and outgoing argument space are prepared here.
// No CI object, class lookup, field linking or Java call resolution is needed.
class Prepared : public ResourceObj {
 public:
  Method* _method;
  const char* _failure;
  State** _states;
  State** _frames;
  BasicType* _field_types;
  BasicSignature* _signature;
  BasicSignature** _call_signatures;
  struct Handler { int start, end, bci; bool catch_all; };
  Handler* _handlers;
  int _handler_count;
  int _nl, _ns, _size, _out_words;
  explicit Prepared(Method* method) : _method(method), _failure(nullptr),
    _states(nullptr), _frames(nullptr), _field_types(nullptr), _signature(nullptr), _call_signatures(nullptr),
    _handlers(nullptr), _handler_count(method->exception_table_length()),
    _nl(method->max_locals()), _ns(method->max_stack()), _size(method->code_size()), _out_words(2) {}
  bool fail(const char* reason) { if (_failure==nullptr) _failure=reason; return false; }
  State* copy(State* s) {
    State* r = new State(_nl, _ns); r->sp = s->sp;
    for (int i = 0; i < _nl; i++) r->locals[i] = s->locals[i];
    for (int i = 0; i < s->sp; i++) r->stack[i] = s->stack[i];
    return r;
  }
  bool merge(int bci, State* s) {
    if (bci < 0 || bci >= _size) return fail("invalid branch target");
    State* frame = _frames[bci];
    if (frame != nullptr) {
      if (frame->sp != s->sp) return fail("verified stack height");
      for (int i=0;i<s->sp;i++) if (frame->stack[i]!=s->stack[i]) return fail("verified stack type");
      // TOP locals are verifier-dead on entry to this block. They need no
      // scope value or oop root, even if a predecessor used the slot.
      for (int i=0;i<_nl;i++)
        if (frame->locals[i]!=T_ILLEGAL && frame->locals[i]!=s->locals[i]) return fail("verified local type");
      _states[bci]=frame;
      return true;
    }
    // Every instruction mutates a fresh copy. Published successor states are
    // immutable, including a conditional's shared branch/fallthrough result.
    if (_states[bci] == nullptr) { _states[bci] = s; return true; }
    State* t = _states[bci];
    if (t->sp != s->sp) return fail("stack height merge");
    for (int i = 0; i < s->sp; i++) if (s->stack[i] != t->stack[i]) return fail("stack type merge");
    // A conservative whole-method fallback is preferable to guessing verifier
    // liveness for a local that is reused with another type on one branch.
    for (int i = 0; i < _nl; i++) if (s->locals[i] != t->locals[i]) return fail("local type merge");
    return true;
  }
  bool pop(State* s, BasicType t) {
    int n=value_slots(t);
    if (s->sp<n) return fail("stack type");
    if (t==T_LONG) {
      if (s->stack[s->sp-2]!=T_LONG || s->stack[s->sp-1]!=T_VOID) return fail("long stack type");
    } else if (s->stack[s->sp-1]==T_VOID || s->stack[s->sp-1]==T_LONG ||
               (t!=T_ILLEGAL && s->stack[s->sp-1]!=t)) return fail("stack type");
    s->sp-=n;return true;
  }
  bool push(State* s, BasicType t) {
    if (s->sp+value_slots(t)>_ns) return fail("stack overflow");
    s->stack[s->sp++]=t;
    if (t==T_LONG) s->stack[s->sp++]=T_VOID;
    return true;
  }
  bool store_local(State* s, int l, BasicType t) {
    int n=value_slots(t);
    if (l<0 || l+n>_nl || !pop(s,t)) return fail("local store");
    for (int i=l;i<l+n;i++) {
      if (s->locals[i]==T_VOID && i>0 && s->locals[i-1]==T_LONG) s->locals[i-1]=T_ILLEGAL;
      if (s->locals[i]==T_LONG && i+1<_nl) s->locals[i+1]=T_ILLEGAL;
      s->locals[i]=T_ILLEGAL;
    }
    s->locals[l]=t;
    if (t==T_LONG) s->locals[l+1]=T_VOID;
    return true;
  }
  int local_index(BytecodeStream& bs, Bytecodes::Code bc) {
    if (bc >= Bytecodes::_iload_0 && bc <= Bytecodes::_iload_3) return bc - Bytecodes::_iload_0;
    if (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3) return bc - Bytecodes::_aload_0;
    if (bc >= Bytecodes::_lload_0 && bc <= Bytecodes::_lload_3) return bc - Bytecodes::_lload_0;
    if (bc >= Bytecodes::_istore_0 && bc <= Bytecodes::_istore_3) return bc - Bytecodes::_istore_0;
    if (bc >= Bytecodes::_astore_0 && bc <= Bytecodes::_astore_3) return bc - Bytecodes::_astore_0;
    if (bc >= Bytecodes::_lstore_0 && bc <= Bytecodes::_lstore_3) return bc - Bytecodes::_lstore_0;
    return bs.get_index();
  }
  bool read_frames(State* initial, int initial_locals) {
    Array<u1>* data=_method->stackmap_data();
    if (data==nullptr) return true; // Old class files keep exact conservative merges.
    int pos=0; bool valid=true;
    auto u1 = [&]() -> int {
      if (pos>=data->length()) { valid=false; return 0; }
      return data->at(pos++);
    };
    auto u2 = [&]() -> int { int high=u1(); return (high<<8)|u1(); };
    auto type = [&]() -> BasicType {
      switch (u1()) {
        case 0: return T_ILLEGAL; // TOP
        case 1: return T_INT;
        case 4: return T_LONG;
        case 5: case 6: return T_OBJECT; // null / uninitialized this
        case 7: case 8: u2(); return T_OBJECT; // class / uninitialized new
        default: valid=false; return T_ILLEGAL; // FP not yet supported
      }
    };
    int count=u2(), previous=-1, locals=initial_locals;
    State* current=copy(initial);
    for (int i=0;i<count && valid;i++) {
      int tag=u1(), delta=0;
      current->sp=0;
      if (tag<=63) delta=tag;
      else if (tag<=127) { delta=tag-64; BasicType t=type(); if (!push(current,t)) return false; }
      else if (tag==247) { delta=u2(); BasicType t=type(); if (!push(current,t)) return false; }
      else if (tag>=248 && tag<=250) {
        delta=u2();
        for (int j=0;j<251-tag;j++) {
          if (locals<=0) return fail("verified local chop");
          locals-=current->locals[locals-1]==T_VOID ? 2 : 1;
          if (locals<0) return fail("verified local chop");
        }
        for (int j=locals;j<_nl;j++) current->locals[j]=T_ILLEGAL;
      } else if (tag==251) delta=u2();
      else if (tag>=252 && tag<=254) {
        delta=u2();
        for (int j=0;j<tag-251;j++) {
          BasicType t=type();
          if (locals+value_slots(t)>_nl) return fail("verified local append");
          current->locals[locals++]=t;
          if (t==T_LONG) current->locals[locals++]=T_VOID;
        }
      } else if (tag==255) {
        delta=u2(); int entries=u2();locals=0;
        for (int j=0;j<entries;j++) {
          BasicType t=type();
          if (locals+value_slots(t)>_nl) return fail("verified locals size");
          current->locals[locals++]=t;
          if (t==T_LONG) current->locals[locals++]=T_VOID;
        }
        for (int j=locals;j<_nl;j++) current->locals[j]=T_ILLEGAL;
        int stack=u2();
        if (stack>_ns) return fail("verified stack size");
        for (int j=0;j<stack;j++) { BasicType t=type(); if (!push(current,t)) return false; }
      } else return fail("verified frame tag");
      int bci=previous+delta+1;
      if (bci<0 || bci>=_size || _frames[bci]!=nullptr) return fail("verified frame offset");
      _frames[bci]=copy(current);previous=bci;
    }
    if (!valid || pos!=data->length()) return fail("unsupported/invalid verified frame");
    return true;
  }
  bool prepare_handlers() {
    if (_handler_count==0) return true;
    // Verified frames provide exact dead/live local categories at catch entry.
    // Keep old/no-map methods and unusually large tables as explicit fallbacks.
    if (!_method->has_stackmap_table()) return fail("handler without verified frames");
    if (_handler_count>64) return fail("handler table bound");
    _handlers=NEW_RESOURCE_ARRAY(Handler,_handler_count);
    ExceptionTable table(_method);
    for (int i=0;i<_handler_count;i++) {
      Handler& h=_handlers[i];
      h.start=table.start_pc(i);h.end=table.end_pc(i);h.bci=table.handler_pc(i);
      h.catch_all=table.catch_type_index(i)==0;
      if (h.start<0 || h.start>=h.end || h.end>_size || h.bci<0 || h.bci>=_size)
        return fail("invalid handler range");
      State* frame=_frames[h.bci];
      if (frame==nullptr || frame->sp!=1 || frame->stack[0]!=T_OBJECT) return fail("handler frame shape");
    }
    return true;
  }
  bool prepass(const methodHandle& handle) {
    if (_method->is_native() || _method->is_synchronized() ||
        _method->has_monitor_bytecodes() ||
        _method->is_scoped() || _method->has_reserved_stack_access() ||
        !ordinary_bytecode_root(_method->intrinsic_id()) ||
        _nl > DirectBaseline::max_locals || _ns > DirectBaseline::max_stack ||
        _size > DirectBaseline::max_code_size || _size == 0) {
      return fail("method shape");
    }
    _states = NEW_RESOURCE_ARRAY(State*, _size);
    _frames = NEW_RESOURCE_ARRAY(State*, _size);
    _signature = new BasicSignature(_method->signature(), _method->constMethod()->fingerprint());
    if (!_signature->valid()) return fail("method shape");
    _field_types = NEW_RESOURCE_ARRAY(BasicType, _size);
    _call_signatures = NEW_RESOURCE_ARRAY(BasicSignature*, _size);
    for (int i = 0; i < _size; i++) { _states[i] = nullptr; _frames[i] = nullptr; }
    State* start = new State(_nl, _ns);
    BasicSignature* sig = _signature;
    int nargs = sig->count() + (_method->is_static() ? 0 : 1);
    for (int i = 0; i < nargs; i++) start->locals[i] = kind(argument_type(sig, _method->is_static(), i));
    if (!read_frames(start,nargs) || !prepare_handlers() || !merge(0,start)) return false;
    // Verified block entries can be decoded before their first predecessor
    // in bytecode order. Backward predecessors must match these same states.
    for (int i=1;i<_size;i++) if (_frames[i]!=nullptr) _states[i]=_frames[i];
    BytecodeStream bs(handle);
    Bytecodes::Code bc;
    while ((bc = bs.next()) != Bytecodes::_illegal) {
      int bci = bs.bci();
      if (_states[bci] == nullptr) return fail("unreachable bytecode");
      if (!merge(bci,_states[bci])) return false;
      State* s = copy(_states[bci]);
      bool fall = true;
      if ((bc >= Bytecodes::_iload_0 && bc <= Bytecodes::_iload_3) || bc == Bytecodes::_iload ||
          (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3) || bc == Bytecodes::_aload ||
          (bc >= Bytecodes::_lload_0 && bc <= Bytecodes::_lload_3) || bc == Bytecodes::_lload) {
        int l=local_index(bs,bc);
        BasicType t=(bc==Bytecodes::_aload || (bc>=Bytecodes::_aload_0 && bc<=Bytecodes::_aload_3)) ? T_OBJECT :
                    (bc==Bytecodes::_lload || (bc>=Bytecodes::_lload_0 && bc<=Bytecodes::_lload_3)) ? T_LONG : T_INT;
        if (l+value_slots(t)>_nl || s->locals[l]!=t ||
            (t==T_LONG && s->locals[l+1]!=T_VOID) || !push(s,t)) return fail("local load");
      } else if ((bc>=Bytecodes::_istore_0 && bc<=Bytecodes::_istore_3) || bc==Bytecodes::_istore ||
                 (bc>=Bytecodes::_astore_0 && bc<=Bytecodes::_astore_3) || bc==Bytecodes::_astore ||
                 (bc>=Bytecodes::_lstore_0 && bc<=Bytecodes::_lstore_3) || bc==Bytecodes::_lstore) {
        BasicType t=(bc==Bytecodes::_astore || (bc>=Bytecodes::_astore_0 && bc<=Bytecodes::_astore_3)) ? T_OBJECT :
                    (bc==Bytecodes::_lstore || (bc>=Bytecodes::_lstore_0 && bc<=Bytecodes::_lstore_3)) ? T_LONG : T_INT;
        if (!store_local(s,local_index(bs,bc),t)) return false;
      } else if (bc >= Bytecodes::_iconst_m1 && bc <= Bytecodes::_iconst_5) {
        if (!push(s, T_INT)) return false;
      } else switch (bc) {
        case Bytecodes::_nop: break;
        case Bytecodes::_new:
          if (!push(s, T_OBJECT)) return false;
          break;
        case Bytecodes::_newarray: case Bytecodes::_anewarray:
          if (!pop(s, T_INT) || !push(s, T_OBJECT)) return false;
          break;
        case Bytecodes::_aconst_null: if (!push(s, T_OBJECT)) return false;
          break;
        case Bytecodes::_bipush: case Bytecodes::_sipush: if (!push(s, T_INT)) return false;
          break;
        case Bytecodes::_ldc: case Bytecodes::_ldc_w: case Bytecodes::_ldc2_w: {
          BasicType t = kind(Bytecode_loadconstant(handle,bci).result_type());
          if (!supported_type(t) || !push(s, t)) return fail("constant type");
          break;
        }
        case Bytecodes::_iinc:
          if (bs.get_index() >= _nl || s->locals[bs.get_index()] != T_INT) return fail("iinc type");
          break;
        case Bytecodes::_pop: case Bytecodes::_pop2: case Bytecodes::_dup: case Bytecodes::_dup_x1:
        case Bytecodes::_dup_x2: case Bytecodes::_dup2: case Bytecodes::_dup2_x1: case Bytecodes::_dup2_x2: case Bytecodes::_swap: {
          int inputs,outputs,order[6];BasicType old[4];
          if (!stack_shuffle(bc,s,inputs,outputs,order)) return fail("stack permutation");
          for (int i=0;i<inputs;i++) old[i]=s->stack[s->sp-inputs+i];
          s->sp-=inputs;
          if (s->sp+outputs>_ns) return fail("stack permutation overflow");
          for (int i=0;i<outputs;i++) s->stack[s->sp++]=old[order[i]];
          break;
        }
        case Bytecodes::_lconst_0: case Bytecodes::_lconst_1:
          if (!push(s,T_LONG)) return false;
          break;
        case Bytecodes::_ladd: case Bytecodes::_lsub: case Bytecodes::_lmul: case Bytecodes::_ldiv: case Bytecodes::_lrem:
        case Bytecodes::_land: case Bytecodes::_lor: case Bytecodes::_lxor:
          if (!pop(s,T_LONG) || !pop(s,T_LONG) || !push(s,T_LONG)) return false;
          break;
        case Bytecodes::_lshl: case Bytecodes::_lshr: case Bytecodes::_lushr:
          if (!pop(s,T_INT) || !pop(s,T_LONG) || !push(s,T_LONG)) return false;
          break;
        case Bytecodes::_lneg:
          if (!pop(s,T_LONG) || !push(s,T_LONG)) return false;
          break;
        case Bytecodes::_lcmp:
          if (!pop(s,T_LONG) || !pop(s,T_LONG) || !push(s,T_INT)) return false;
          break;
        case Bytecodes::_i2l:
          if (!pop(s,T_INT) || !push(s,T_LONG)) return false;
          break;
        case Bytecodes::_l2i:
          if (!pop(s,T_LONG) || !push(s,T_INT)) return false;
          break;
        case Bytecodes::_idiv: case Bytecodes::_irem:
        case Bytecodes::_iadd: case Bytecodes::_isub: case Bytecodes::_imul:
        case Bytecodes::_iand: case Bytecodes::_ior: case Bytecodes::_ixor:
        case Bytecodes::_ishl: case Bytecodes::_ishr: case Bytecodes::_iushr:
          if (!pop(s, T_INT) || !pop(s, T_INT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_ineg: case Bytecodes::_i2b: case Bytecodes::_i2c: case Bytecodes::_i2s:
          if (!pop(s, T_INT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_getfield: case Bytecodes::_putfield: case Bytecodes::_getstatic: {
          BasicType type = Signature::basic_type(_method->constants()->signature_ref_at(bs.get_index_u2(), bc));
          if (!supported_type(type)) return fail("unresolved/unsupported field");
          bool is_static = bc == Bytecodes::_getstatic;
          _field_types[bci] = kind(type);
          if (bc == Bytecodes::_putfield && !pop(s, kind(type))) return false;
          if (!is_static && !pop(s, T_OBJECT)) return false;
          if (bc != Bytecodes::_putfield && !push(s, kind(type))) return false;
          break;
        }
        case Bytecodes::_checkcast:
          if (s->sp == 0 || s->stack[s->sp-1] != T_OBJECT) return fail("cast type");
          break;
        case Bytecodes::_instanceof:
          if (!pop(s, T_OBJECT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_arraylength:
          if (!pop(s, T_OBJECT) || !push(s, T_INT)) return false;
          break;
        case Bytecodes::_iaload: case Bytecodes::_laload: case Bytecodes::_baload: case Bytecodes::_caload: case Bytecodes::_saload: case Bytecodes::_aaload:
          if (!pop(s,T_INT) || !pop(s,T_OBJECT) || !push(s,bc==Bytecodes::_aaload ? T_OBJECT : bc==Bytecodes::_laload ? T_LONG : T_INT)) return false;
          break;
        case Bytecodes::_iastore: case Bytecodes::_lastore: case Bytecodes::_bastore: case Bytecodes::_castore: case Bytecodes::_sastore:
        case Bytecodes::_aastore:
          if (!pop(s,bc==Bytecodes::_aastore ? T_OBJECT : bc==Bytecodes::_lastore ? T_LONG : T_INT) || !pop(s,T_INT) || !pop(s,T_OBJECT)) return false;
          break;
        case Bytecodes::_invokestatic: case Bytecodes::_invokevirtual: case Bytecodes::_invokespecial: case Bytecodes::_invokeinterface: {
          ConstantPool* pool=_method->constants();
          int index=bs.get_index_u2();
          Symbol* signature=pool->signature_ref_at(index,bc);
          // The declared descriptor supplies call-site types without a
          // resolved-target lookup. Emission checks linkage separately.
          BasicSignature* declared = new BasicSignature(signature);
          if (!declared->valid()) return fail("unresolved/unsupported call");
          bool is_static = bc == Bytecodes::_invokestatic;
          _call_signatures[bci] = declared;
          int n = declared->count() + (is_static ? 0 : 1);
          BasicType* types = NEW_RESOURCE_ARRAY(BasicType, n);
          VMRegPair* regs = NEW_RESOURCE_ARRAY(VMRegPair, n);
          for (int i = 0; i < n; i++) types[i] = argument_type(declared, is_static, i);
          int slots = SharedRuntime::java_calling_convention(types, regs, n);
          // The outer worker ResourceMark keeps this layout alive through CI
          // and emission. The accepted call retains the declared descriptor.
          declared->set_call_arguments(types, regs);
          _out_words = MAX2(_out_words, (slots + 1) / 2);
          for (int i=n-1;i>=0;i--) if (types[i]!=T_VOID && !pop(s,kind(types[i]))) return false;
          if (declared->return_type() != T_VOID && !push(s, kind(declared->return_type()))) return false;
          break;
        }
        case Bytecodes::_ireturn: case Bytecodes::_lreturn: case Bytecodes::_areturn:
          if (!pop(s,bc==Bytecodes::_ireturn ? T_INT : bc==Bytecodes::_lreturn ? T_LONG : T_OBJECT)) return false;
          fall = false;
          break;
        case Bytecodes::_athrow:
          if (!pop(s,T_OBJECT)) return false;
          fall = false;
          break;
        case Bytecodes::_return: fall = false;
          break;
        case Bytecodes::_tableswitch: case Bytecodes::_lookupswitch: {
          if (!pop(s,T_INT)) return false;
          if (bc == Bytecodes::_tableswitch) {
            Bytecode_tableswitch sw(_method,_method->bcp_from(bci));
            if (sw.default_offset() <= 0 || !merge(bci+sw.default_offset(),s)) return fail("backward/invalid switch");
            for (int i=0;i<sw.length();i++)
              if (sw.dest_offset_at(i) <= 0 || !merge(bci+sw.dest_offset_at(i),s)) return fail("backward/invalid switch");
          } else {
            Bytecode_lookupswitch sw(_method,_method->bcp_from(bci));
            if (sw.default_offset() <= 0 || !merge(bci+sw.default_offset(),s)) return fail("backward/invalid switch");
            for (int i=0;i<sw.number_of_pairs();i++)
              if (sw.pair_at(i).offset() <= 0 || !merge(bci+sw.pair_at(i).offset(),s)) return fail("backward/invalid switch");
          }
          fall = false;
          break;
        }
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
          int target = bci + bs.get_offset_s2();
          if (target<0 || target>=_size) return fail("invalid branch target");
          if (target <= bci && _states[target]==nullptr) return fail("loop without known entry state");
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

};
static thread_local Prepared* prepared_data=nullptr;

class Emitter : StackObj {
  ciEnv* _env;
  ciMethod* _method;
  AbstractCompiler* _compiler;
  const char* _failure;
  State** _states;
  Label* _labels;
  struct FieldAccess { ciField* linked; BasicType type; int offset; bool is_volatile; };
  BasicSignature** _call_signatures;
  int _nl, _ns, _size, _out_words, _frame_bytes, _frame_words, _last_scope_pc;
  CodeBuffer* _code;
  C1_MacroAssembler* _masm;
  CodeOffsets _offsets;
  DebugInformationRecorder* _debug;
  OopMapSet* _maps;
  GrowableArray<int>* _exception_pcs;
  GrowableArray<int>* _exception_bcis;
  int* _handler_pcos;

  bool fail(const char* message) { if (_failure == nullptr) _failure = message; return false; }
  int local_index(ciBytecodeStream& bs, Bytecodes::Code bc) {
    if (bc >= Bytecodes::_iload_0 && bc <= Bytecodes::_iload_3) return bc - Bytecodes::_iload_0;
    if (bc >= Bytecodes::_aload_0 && bc <= Bytecodes::_aload_3) return bc - Bytecodes::_aload_0;
    if (bc >= Bytecodes::_lload_0 && bc <= Bytecodes::_lload_3) return bc - Bytecodes::_lload_0;
    if (bc >= Bytecodes::_istore_0 && bc <= Bytecodes::_istore_3) return bc - Bytecodes::_istore_0;
    if (bc >= Bytecodes::_astore_0 && bc <= Bytecodes::_astore_3) return bc - Bytecodes::_astore_0;
    if (bc >= Bytecodes::_lstore_0 && bc <= Bytecodes::_lstore_3) return bc - Bytecodes::_lstore_0;
    return bs.get_index();
  }

  int local_offset(int i) { return (_out_words + i) * wordSize; }
  int stack_offset(int i) { return local_offset(_nl + i); }
  Address local(int i) { return Address(rsp, local_offset(i)); }
  Address stack(int i) { return Address(rsp, stack_offset(i)); }

  void safepoint(int bci, State* s, int expression_sp = -1, bool reexecute = false, bool return_oop = false, bool exception_oop = false) {
    int pc = _masm->offset();
    _last_scope_pc = pc;
    OopMap* map = new OopMap(_frame_words * VMRegImpl::slots_per_word, 0);
    GrowableArray<ScopeValue*> locals;
    GrowableArray<ScopeValue*> expressions;
    for (int i=0;i<_nl;i++) {
      BasicType t=s->locals[i];
      if (t==T_LONG) {
        assert(i+1<_nl && s->locals[i+1]==T_VOID,"long local pair");
        locals.append(new ConstantIntValue(0));
        locals.append(new LocationValue(Location::new_stk_loc(Location::lng,local_offset(i))));
        i++;continue;
      }
      assert(t!=T_VOID,"orphan local companion");
      if (t==T_ILLEGAL) { locals.append(new LocationValue(Location()));continue; }
      locals.append(new LocationValue(Location::new_stk_loc(t==T_OBJECT ? Location::oop : Location::normal,local_offset(i))));
      if (t==T_OBJECT) map->set_oop(VMRegImpl::stack2reg(local_offset(i)/VMRegImpl::stack_slot_size));
    }
    int limit=expression_sp<0 ? s->sp : expression_sp;
    for (int i=0;i<s->sp;i++) {
      BasicType t=s->stack[i];
      if (t==T_LONG) {
        assert(i+1<s->sp && s->stack[i+1]==T_VOID,"long expression pair");
        if (i<limit) {
          assert(i+1<limit,"expression scope splits long");
          expressions.append(new ConstantIntValue(0));
          expressions.append(new LocationValue(Location::new_stk_loc(Location::lng,stack_offset(i))));
        }
        i++;continue;
      }
      assert(t!=T_VOID,"orphan expression companion");
      if (t==T_OBJECT) map->set_oop(VMRegImpl::stack2reg(stack_offset(i)/VMRegImpl::stack_slot_size));
      if (i<limit) expressions.append(new LocationValue(Location::new_stk_loc(t==T_OBJECT ? Location::oop : Location::normal,stack_offset(i))));
    }
    if (exception_oop) map->set_oop(rax->as_VMReg());
    _debug->add_safepoint(pc, map);
    _debug->describe_scope(pc, methodHandle(), _method, bci, reexecute, false, return_oop,
                           false, false, _debug->create_scope_values(&locals),
                           _debug->create_scope_values(&expressions));
    _debug->end_safepoint(pc);
    if (_exception_pcs!=nullptr && bci>=0) {
      _exception_pcs->append(pc);_exception_bcis->append(bci);
    }
  }

#define __ _masm->
  void deopt_at(int bci, State* s) {
    __ movl(Address(rsp, 0), Deoptimization::make_trap_request(Deoptimization::Reason_unhandled,
                                                             Deoptimization::Action_none));
    __ call(RuntimeAddress(Runtime1::entry_for(StubId::c1_deoptimize_id)));
    safepoint(bci, s, -1, true);
    __ should_not_reach_here();
  }
  void deopt_if(Assembler::Condition ok, int bci, State* s) {
    Label good;
    __ jcc(ok, good);
    deopt_at(bci, s);
    __ bind(good);
  }
  bool type_check(ciBytecodeStream& bs, Bytecodes::Code bc, int bci, State* s) {
    // A saved CP resolution error must not be bypassed by a loaded class
    // found separately by name. Ordinary unresolved loaded casts match C1.
    if (bs.get_constant_pool_tag(bs.get_klass_index()).is_unresolved_klass_in_error())
      return fail("cast resolution error");
    bool will_link = false;
    ciKlass* klass = bs.get_klass(will_link);
    if (!will_link || !klass->is_loaded()) return fail("unresolved/inaccessible cast class");
    // checkcast/instanceof resolve a type but do not initialize it. All values
    // remain in canonical slots; only the normal subtype helper uses scratch.
    Label success, done;
    __ movptr(rax, stack(s->sp-1));
    if (bc == Bytecodes::_instanceof) __ movl(stack(s->sp-1), 0);
    __ testptr(rax, rax);
    __ jcc(Assembler::zero, done);
    __ load_klass(rbx, rax, rscratch1);
    __ mov_metadata(r8, klass->constant_encoding());
    // The secondary-supers table helper reserves rcx as a shift-count temp.
    __ check_klass_subtype(rbx, r8, rdx, success);
    if (bc == Bytecodes::_checkcast) deopt_at(bci, s);
    else __ jmp(done);
    __ bind(success);
    if (bc == Bytecodes::_instanceof) __ movl(stack(s->sp-1), 1);
    __ bind(done);
    return true;
  }
  bool allocate(ciBytecodeStream& bs, Bytecodes::Code bc, int bci, State* s) {
    ciKlass* klass = nullptr;
    bool lazy = false;
    StubId stub = StubId::c1_new_instance_id;
    if (bc == Bytecodes::_newarray) {
      BasicType type = (BasicType)bs.get_index();
      if (type < T_BOOLEAN || type > T_LONG) return fail("invalid primitive array type");
      klass = ciTypeArrayKlass::make(type);
      stub = StubId::c1_new_type_array_id;
    } else {
      lazy=bs.is_unresolved_klass();
      if (!lazy) {
        bool will_link = false;
        ciKlass* element = bs.get_klass(will_link);
        if (!will_link || !element->is_loaded()) return fail("inaccessible allocation class");
        if (bc == Bytecodes::_new) {
          if (!element->is_instance_klass()) return fail("instance allocation class");
          lazy=!element->as_instance_klass()->is_initialized();
          klass=element;
        } else {
          klass=ciObjArrayKlass::make(element);
          stub=StubId::c1_new_object_array_id;
        }
      }
    }
    if (_env->failing() || (!lazy && !klass->is_loaded())) return fail("array klass allocation");
    if (lazy) {
      __ mov_metadata(rdx,_method->constant_encoding());
      __ movl(rcx,bci);
      if (bc==Bytecodes::_new) __ xorl(rbx,rbx);
      else __ movl(rbx,stack(s->sp-1));
      stub=StubId::c1_direct_allocate_id;
    } else {
      __ mov_metadata(rdx,klass->constant_encoding());
      if (bc!=Bytecodes::_new) __ movl(rbx,stack(s->sp-1));
    }
    __ call(RuntimeAddress(Runtime1::entry_for(stub)));
    // The runtime has produced a parsable oop. Deoptimization at this return
    // PC continues after the allocation and supplies rax as interpreter TOS.
    // The result slot is still unwritten and consumed lengths are not in scope.
    safepoint(bci, s, bc == Bytecodes::_new ? s->sp : s->sp-1, false, true);
    __ movptr(stack(bc == Bytecodes::_new ? s->sp : s->sp-1), rax);
    return true;
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
  void backedge(int bci, State* s) {
    // Match the normal in-method poll instruction and its exact fault-PC map.
    // Branch operands remain canonical so a deopt can reexecute this branch.
    __ movptr(rscratch1,Address(r15_thread,JavaThread::polling_page_offset()));
    safepoint(bci,s,-1,true);
    __ relocate(relocInfo::poll_type);
    __ testl(rax,Address(rscratch1,0));
    Label done, overflow;
    __ mov_metadata(rbx,_method->constant_encoding());
    __ movptr(r10,Address(rbx,Method::method_counters_offset()));
    increment_counter(Address(r10,in_bytes(MethodCounters::backedge_counter_offset())+in_bytes(InvocationCounter::counter_offset())),
                      Address(r10,in_bytes(MethodCounters::backedge_mask_offset())),overflow);
    __ jmp(done);
    __ bind(overflow);
    __ movl(Address(rsp,0),bci); __ movptr(Address(rsp,wordSize),rbx);
    // The existing helper treats direct code as level none and deoptimizes
    // this frame when an ordinary OSR nmethod becomes available. Interpreter
    // reconstruction then supplies the standard OSR migration frame.
    __ call(RuntimeAddress(Runtime1::entry_for(StubId::c1_counter_overflow_id)));
    safepoint(bci,s,-1,true);
    __ bind(done);
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
  bool cached_instance_field(ciBytecodeStream& bs, Bytecodes::Code bc, int bci, FieldAccess& access) {
    if (bc==Bytecodes::_getstatic) return false;
    VM_ENTRY_MARK;
    NoSafepointVerifier nsv;
    ConstantPool* pool=_method->get_Method()->constants();
    int index=bs.get_field_index();
    if (pool->cache()==nullptr || index<0 || index>=pool->resolved_field_entries_length()) return false;
    ResolvedFieldEntry* entry=pool->resolved_field_entry_at(index);
    if (!entry->is_resolved(bc) || (bc==Bytecodes::_putfield && entry->is_final())) return false;
    InstanceKlass* holder=entry->field_holder();
    BasicType type=as_BasicType((TosState)entry->tos_state());
    if (holder==nullptr || holder->name()->equals("java/lang/ref/Reference") ||
        kind(type)!=prepared_data->_field_types[bci]) return false;
    // Resolution is opcode-specific. Final stores retain the CI current-
    // method check; no klass/entry/oop pointer escapes this snapshot.
    access={nullptr,type,entry->field_offset(),entry->is_volatile()};
    return true;
  }
  bool resolve_field(ciBytecodeStream& bs, Bytecodes::Code bc, int bci, FieldAccess& access) {
    if (cached_instance_field(bs,bc,bci,access)) return true;
    bool link=false; ciField* f=bs.get_field(link);
    bool is_static=bc==Bytecodes::_getstatic;
    if (!link || strcmp(f->holder()->name()->as_utf8(),"java/lang/ref/Reference")==0 ||
        f->is_static()!=is_static || kind(f->layout_type())!=prepared_data->_field_types[bci])
      return fail("unresolved/unsupported field");
    if (is_static && (!f->holder()->is_loaded() || !f->holder()->is_initialized()))
      return fail("uninitialized static field");
    access={f,f->layout_type(),f->offset_in_bytes(),f->is_volatile()};
    return true;
  }
  bool cached_call(ciBytecodeStream& bs, Bytecodes::Code bc, int bci, bool& dynamic) {
    // Consume only resolution published for this invocation bytecode. A shared
    // CP entry can describe both invokespecial and invokevirtual. Keep no
    // callee metadata: the emitted call still links through the original CP,
    // and ciEnv validates redefinition/JVMTI state again before installation.
    VM_ENTRY_MARK;
    NoSafepointVerifier nsv;
    ConstantPool* pool = _method->get_Method()->constants();
    int index = bs.get_method_index();
    if (pool->cache() == nullptr || index < 0 || index >= pool->resolved_method_entries_length()) return false;
    ResolvedMethodEntry* entry = pool->resolved_method_entry_at(index);
    if (!entry->is_resolved(bc) || entry->has_local_signature() || entry->has_appendix()) return false;
    int holder_index = pool->klass_ref_index_at(index, bc);
    if (!pool->tag_at(holder_index).is_klass()) return false;
    Klass* declared = pool->resolved_klass_at(holder_index);
    Method* method = bc == Bytecodes::_invokevirtual && !entry->is_vfinal() ?
        declared->method_at_vtable(entry->table_index()) : entry->method();
    bool is_static = bc == Bytecodes::_invokestatic;
    bool virtual_call = bc == Bytecodes::_invokevirtual || bc == Bytecodes::_invokeinterface;
    if (method == nullptr || method->is_old() || method->is_obsolete() ||
        method->is_static() != is_static || (method->is_abstract() && !virtual_call) ||
        (method->is_object_initializer() && bc != Bytecodes::_invokespecial) ||
        method->is_method_handle_intrinsic() || method->is_scoped() ||
        method->method_holder()->name()->equals("jdk/internal/vm/Continuation") ||
        method->signature() != _call_signatures[bci]->symbol() ||
        (is_static && !method->method_holder()->is_initialized()) ||
        (bc == Bytecodes::_invokespecial && (declared->is_interface() ||
         method->method_holder()->is_interface() || pool->pool_holder()->is_interface()))) return false;
    // Match ciMethod's conservative linked-holder, private and abstract rules.
    bool bound = ((method->method_holder()->is_linked() && method->can_be_statically_bound()) ||
                  method->is_private()) && !method->is_abstract();
    dynamic = bc == Bytecodes::_invokeinterface || (bc == Bytecodes::_invokevirtual && !bound);
    return true;
  }
  bool resolve_call(ciBytecodeStream& bs, Bytecodes::Code bc, int bci, bool& dynamic) {
    if (cached_call(bs, bc, bci, dynamic)) return true;
    bool link=false;
    ciMethod* m=bs.get_method(link,nullptr);
    bool is_static=bc==Bytecodes::_invokestatic;
    BasicSignature* sig=_call_signatures[bci];
    bool virtual_call = bc == Bytecodes::_invokeinterface || bc == Bytecodes::_invokevirtual;
    if (!link || !m->is_loaded() || m->is_static()!=is_static || (m->is_abstract() && !virtual_call) ||
        (m->is_object_initializer() && bc != Bytecodes::_invokespecial) || m->is_method_handle_intrinsic() || m->is_scoped() ||
        strcmp(m->holder()->name()->as_utf8(),"jdk/internal/vm/Continuation")==0 ||
        (is_static && !m->holder()->is_initialized())) return fail("unresolved/unsupported call");
    // Ordinary linked methods have the declared descriptor. Signature-
    // polymorphic/appendix forms were rejected above. The Method metadata is
    // held by CI for this compilation; reading its immutable symbol needs no
    // parameter-class queries.
    if (m->get_Method()->signature() != sig->symbol()) return fail("call signature changed");
    if (!is_static) {
      ciKlass* holder=bs.get_declared_method_holder();
      if (!holder->is_loaded() ||
          (bc==Bytecodes::_invokespecial &&
           (holder->is_interface() || m->holder()->is_interface() || _method->holder()->is_interface())))
        return fail("unsupported interface special call");
    }
    dynamic = bc == Bytecodes::_invokeinterface || (bc == Bytecodes::_invokevirtual && !m->can_be_statically_bound());
    return true;
  }
  void java_call(Bytecodes::Code bc, int bci, State* s, bool dynamic) {
    BasicSignature* sig = _call_signatures[bci];
    bool is_static = bc == Bytecodes::_invokestatic;
    int n = sig->count() + (is_static ? 0 : 1);
    if (!is_static) {
      __ movptr(rax, stack(s->sp - n));
      null_check(rax, bci, s);
    }
    BasicType* types = sig->argument_types();
    VMRegPair* regs = sig->argument_regs();
    assert(n == 0 || (types != nullptr && regs != nullptr), "prepared call layout");
    for (int i = 0; i < n; i++) {
      if (types[i]==T_VOID) continue;
      bool wide=kind(types[i])==T_OBJECT || types[i]==T_LONG;
      // Integer arguments occupy one 32-bit VMReg slot. Loading full words
      // propagates uninitialized upper bits which optimized callees may use
      // as an unsigned, already-extended array index.
      if (wide) __ movptr(rax, stack(s->sp - n + i));
      else __ movl(rax, stack(s->sp - n + i));
      if (regs[i].first()->is_reg()) {
        if (wide) __ movptr(regs[i].first()->as_Register(), rax);
        else __ movl(regs[i].first()->as_Register(), rax);
      } else {
        Address arg(rsp, regs[i].first()->reg2stack() * VMRegImpl::stack_slot_size);
        if (wide) __ movptr(arg, rax); else __ movl(arg, rax);
      }
    }
    if (dynamic) {
      __ align(wordSize, __ offset() + NativeMovConstReg::instruction_size_rex + NativeCall::displacement_offset);
      __ ic_call(SharedRuntime::get_resolve_virtual_call_stub());
    } else {
      __ align(wordSize, __ offset() + NativeCall::displacement_offset);
      if (CompiledDirectCall::emit_to_interp_stub(_masm, _masm->pc()) == nullptr) { fail("call stub space"); return; }
      __ call(AddressLiteral(is_static ? SharedRuntime::get_resolve_static_call_stub() :
                                       SharedRuntime::get_resolve_opt_virtual_call_stub(),
                             is_static ? relocInfo::static_call_type : relocInfo::opt_virtual_call_type));
    }
    safepoint(bci, s, s->sp - n, false, kind(sig->return_type()) == T_OBJECT);
    __ post_call_nop();
    if (kind(sig->return_type())==T_OBJECT || sig->return_type()==T_LONG) __ movptr(stack(s->sp-n),rax);
    else if (sig->return_type() != T_VOID) __ movl(stack(s->sp - n), rax);
  }
  void field(Bytecodes::Code bc, int bci, State* s, const FieldAccess& access) {
    BasicType t = access.type;
    bool is_static = bc == Bytecodes::_getstatic;
    bool load = bc != Bytecodes::_putfield;
    int obj=is_static ? s->sp : s->sp-(load ? 1 : 1+value_slots(kind(t)));
    if (is_static) {
      assert(access.linked!=nullptr,"static mirror retains CI rooting");
      __ movoop(rbx, access.linked->holder()->java_mirror()->constant_encoding());
    } else {
      __ movptr(rbx, stack(obj)); null_check(rbx, bci, s);
    }
    Address address(rbx, access.offset);
    if (load) {
      __ access_load_at(t,IN_HEAP | (access.is_volatile ? MO_SEQ_CST : MO_UNORDERED),t==T_LONG ? noreg : rax,address,r10);
      __ movptr(stack(obj), rax);
    } else {
      __ movptr(rax,stack(s->sp-value_slots(kind(t))));
      __ access_store_at(t,IN_HEAP,address,t==T_LONG ? noreg : rax,r8,r9,r10);
      if (access.is_volatile) __ membar(Assembler::StoreLoad);
    }
  }
  void array(Bytecodes::Code bc, int bci, State* s) {
    bool store = bc >= Bytecodes::_iastore && bc <= Bytecodes::_sastore;
    int base=s->sp-(store ? (bc==Bytecodes::_lastore ? 4 : 3) : 2);
    if (bc == Bytecodes::_arraylength) base = s->sp - 1;
    __ movptr(rbx, stack(base)); null_check(rbx, bci, s);
    __ movl(rdx, Address(rbx, arrayOopDesc::length_offset_in_bytes()));
    if (bc == Bytecodes::_arraylength) { __ movl(stack(base), rdx); return; }
    __ movl(rcx, stack(base+1));
    __ cmpl(rcx, rdx); deopt_if(Assembler::below, bci, s);
    BasicType t = bc == Bytecodes::_aaload || bc == Bytecodes::_aastore ? T_OBJECT :
                  bc == Bytecodes::_laload || bc == Bytecodes::_lastore ? T_LONG :
                  bc == Bytecodes::_baload || bc == Bytecodes::_bastore ? T_BYTE :
                  bc == Bytecodes::_caload || bc == Bytecodes::_castore ? T_CHAR :
                  bc == Bytecodes::_saload || bc == Bytecodes::_sastore ? T_SHORT : T_INT;
    if (store) {
      __ movptr(rax, stack(base+2));
      if (t == T_OBJECT) {
        Label good;
        __ testptr(rax,rax); __ jcc(Assembler::zero,good);
        __ load_klass(rdx,rax,rscratch1);
        __ load_klass(r8,rbx,rscratch1);
        __ movptr(r8,Address(r8,ObjArrayKlass::element_klass_offset()));
        // rcx is reserved by the secondary-super helper. Reload all store
        // operands from canonical slots after the subtype check.
        __ check_klass_subtype(rdx,r8,r9,good);
        deopt_at(bci,s);
        __ bind(good);
        __ movptr(rbx,stack(base)); __ movl(rcx,stack(base+1)); __ movptr(rax,stack(base+2));
      } else if (t == T_BYTE) {
        Label byte_array;
        __ load_klass(rdx,rbx,rscratch1);
        __ testl(Address(rdx,Klass::layout_helper_offset()),Klass::layout_helper_boolean_diffbit());
        __ jcc(Assembler::zero,byte_array);
        __ andl(rax,1);
        __ bind(byte_array);
      }
      Address address(rbx,rcx,Address::times(type2aelembytes(t)),arrayOopDesc::base_offset_in_bytes(t));
      __ access_store_at(t,IN_HEAP | IS_ARRAY,address,t==T_LONG ? noreg : rax,r8,r9,r10);
    } else {
      Address address(rbx,rcx,Address::times(type2aelembytes(t)),arrayOopDesc::base_offset_in_bytes(t));
      __ access_load_at(t,IN_HEAP | IS_ARRAY,t==T_LONG ? noreg : rax,address,r10);
      __ movptr(stack(base), rax);
    }
  }
  void epilog() {
    // Return polls complement backedge polls for short/loop-free activations.
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
    _offsets.set_value(CodeOffsets::Entry, _method->is_static() ? __ offset() : __ ic_check(CodeEntryAlignment));
    _offsets.set_value(CodeOffsets::Verified_Entry, __ offset());
    // The bounded subset's interpreter activation is less than one page
    // larger than this frame. Reserve that space for a possible deopt.
    __ build_frame(_frame_bytes, _frame_bytes + os::vm_page_size() + os::extra_bang_size_in_bytes());
    _offsets.set_value(CodeOffsets::Frame_Complete, __ offset());
    BasicSignature* sig = prepared_data->_signature;
    int n = sig->count() + (_method->is_static() ? 0 : 1);
    BasicType* types = NEW_RESOURCE_ARRAY(BasicType, n);
    VMRegPair* regs = NEW_RESOURCE_ARRAY(VMRegPair, n);
    for (int i = 0; i < n; i++) types[i] = argument_type(sig, _method->is_static(), i);
    SharedRuntime::java_calling_convention(types, regs, n);
    for (int i = 0; i < n; i++) {
      if (types[i]==T_VOID) continue;
      bool wide=kind(types[i])==T_OBJECT || types[i]==T_LONG;
      if (regs[i].first()->is_reg()) {
        if (wide) __ movptr(local(i), regs[i].first()->as_Register());
        else __ movl(local(i), regs[i].first()->as_Register());
      } else {
        Address arg(rsp, _frame_bytes + 2*wordSize + regs[i].first()->reg2stack()*VMRegImpl::stack_slot_size);
        if (wide) { __ movptr(rax, arg); __ movptr(local(i), rax); }
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
      if ((bc>=Bytecodes::_iload_0 && bc<=Bytecodes::_iload_3) || bc==Bytecodes::_iload ||
          (bc>=Bytecodes::_aload_0 && bc<=Bytecodes::_aload_3) || bc==Bytecodes::_aload ||
          (bc>=Bytecodes::_lload_0 && bc<=Bytecodes::_lload_3) || bc==Bytecodes::_lload) {
        __ movptr(rax,local(local_index(bs,bc)));__ movptr(stack(sp),rax);
      } else if ((bc>=Bytecodes::_istore_0 && bc<=Bytecodes::_istore_3) || bc==Bytecodes::_istore ||
                 (bc>=Bytecodes::_astore_0 && bc<=Bytecodes::_astore_3) || bc==Bytecodes::_astore ||
                 (bc>=Bytecodes::_lstore_0 && bc<=Bytecodes::_lstore_3) || bc==Bytecodes::_lstore) {
        bool wide=bc==Bytecodes::_lstore || (bc>=Bytecodes::_lstore_0 && bc<=Bytecodes::_lstore_3);
        __ movptr(rax,stack(sp-(wide?2:1)));__ movptr(local(local_index(bs,bc)),rax);
      } else if (bc >= Bytecodes::_iconst_m1 && bc <= Bytecodes::_iconst_5) {
        __ movl(stack(sp), bc - Bytecodes::_iconst_0);
      } else switch (bc) {
        case Bytecodes::_nop: break;
        case Bytecodes::_aconst_null: __ movptr(stack(sp), NULL_WORD);
          break;
        case Bytecodes::_bipush: __ movl(stack(sp), (jbyte)bs.get_constant_u1());
          break;
        case Bytecodes::_sipush: __ movl(stack(sp), (jshort)bs.get_constant_u2());
          break;
        case Bytecodes::_ldc: case Bytecodes::_ldc_w: case Bytecodes::_ldc2_w: {
          ciConstant value=bs.get_constant();
          if (_env->failing() || !value.is_valid() || kind(value.basic_type()) != _states[bs.next_bci()]->stack[sp]) {
            fail("unresolved constant"); return;
          }
          if (kind(value.basic_type()) == T_INT) __ movl(stack(sp),value.as_int());
          else if (value.basic_type()==T_LONG) { __ movptr(rax,(intptr_t)value.as_long());__ movptr(stack(sp),rax); }
          else {
            ciObject* object=value.as_object();
            if (!object->is_loaded()) { fail("unresolved object constant"); return; }
            if (object->is_null_object()) __ movptr(stack(sp),NULL_WORD);
            else { __ movoop(rax,object->constant_encoding()); __ movptr(stack(sp),rax); }
          }
          break;
        }
        case Bytecodes::_iinc: __ addl(local(bs.get_index()), bs.get_iinc_con());
          break;
        case Bytecodes::_pop: case Bytecodes::_pop2: case Bytecodes::_dup: case Bytecodes::_dup_x1:
        case Bytecodes::_dup_x2: case Bytecodes::_dup2: case Bytecodes::_dup2_x1: case Bytecodes::_dup2_x2: case Bytecodes::_swap: {
          int inputs,outputs,order[6];
          if (!stack_shuffle(bc,s,inputs,outputs,order)) { fail("stack permutation");return; }
          if (outputs==0) break;
          Register temps[]={rax,rbx,rcx,rdx};
          for (int i=0;i<inputs;i++) {
            if (s->stack[sp-inputs+i]==T_VOID) __ xorl(temps[i],temps[i]);
            else __ movptr(temps[i],stack(sp-inputs+i));
          }
          for (int i=0;i<outputs;i++) __ movptr(stack(sp-inputs+i),temps[order[i]]);
          break;
        }
        case Bytecodes::_lconst_0: case Bytecodes::_lconst_1:
          __ movptr(stack(sp),bc-Bytecodes::_lconst_0);
          break;
        case Bytecodes::_ladd: case Bytecodes::_lsub: case Bytecodes::_lmul:
        case Bytecodes::_land: case Bytecodes::_lor: case Bytecodes::_lxor:
          __ movptr(rax,stack(sp-4));__ movptr(rcx,stack(sp-2));
          switch (bc) {
            case Bytecodes::_ladd: __ addq(rax,rcx);break;
            case Bytecodes::_lsub: __ subq(rax,rcx);break;
            case Bytecodes::_lmul: __ imulq(rax,rcx);break;
            case Bytecodes::_land: __ andq(rax,rcx);break;
            case Bytecodes::_lor: __ orq(rax,rcx);break;
            case Bytecodes::_lxor: __ xorq(rax,rcx);break;
            default: ShouldNotReachHere();
          }
          __ movptr(stack(sp-4),rax);
          break;
        case Bytecodes::_lshl: case Bytecodes::_lshr: case Bytecodes::_lushr:
          __ movptr(rax,stack(sp-3));__ movl(rcx,stack(sp-1));
          if (bc==Bytecodes::_lshl) __ shlq(rax);
          else if (bc==Bytecodes::_lshr) __ sarq(rax);
          else __ shrq(rax);
          __ movptr(stack(sp-3),rax);
          break;
        case Bytecodes::_ldiv: case Bytecodes::_lrem:
          __ movptr(rcx,stack(sp-2));__ testptr(rcx,rcx);deopt_if(Assembler::notZero,bci,s);
          __ movptr(rax,stack(sp-4));__ corrected_idivq(rcx);
          __ movptr(stack(sp-4),bc==Bytecodes::_ldiv ? rax : rdx);
          break;
        case Bytecodes::_lneg:
          __ movptr(rax,stack(sp-2));__ negq(rax);__ movptr(stack(sp-2),rax);
          break;
        case Bytecodes::_i2l:
          __ movslq(rax,stack(sp-1));__ movptr(stack(sp-1),rax);
          break;
        case Bytecodes::_l2i:
          __ movl(rax,stack(sp-2));__ movl(stack(sp-2),rax);
          break;
        case Bytecodes::_lcmp: {
          Label done;
          __ movptr(rax,stack(sp-4));__ cmpptr(rax,stack(sp-2));
          __ movl(rax,0);__ jcc(Assembler::equal,done);
          __ movl(rax,1);__ jcc(Assembler::greater,done);__ movl(rax,-1);
          __ bind(done);__ movl(stack(sp-4),rax);
          break;
        }
        case Bytecodes::_idiv: case Bytecodes::_irem:
          __ movl(rcx,stack(sp-1)); __ testl(rcx,rcx); deopt_if(Assembler::notZero,bci,s);
          __ movl(rax,stack(sp-2)); __ corrected_idivl(rcx);
          __ movl(stack(sp-2),bc == Bytecodes::_idiv ? rax : rdx);
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
        case Bytecodes::_getfield: case Bytecodes::_putfield: case Bytecodes::_getstatic: {
          FieldAccess access;
          if (!resolve_field(bs,bc,bci,access)) return;
          field(bc, bci, s, access);
          break;
        }
        case Bytecodes::_new: case Bytecodes::_newarray: case Bytecodes::_anewarray:
          if (!allocate(bs, bc, bci, s)) return;
          break;
        case Bytecodes::_checkcast: case Bytecodes::_instanceof:
          if (!type_check(bs, bc, bci, s)) return;
          break;
        case Bytecodes::_bastore: case Bytecodes::_castore: case Bytecodes::_sastore: case Bytecodes::_aastore:
        case Bytecodes::_laload: case Bytecodes::_lastore:
        case Bytecodes::_arraylength: case Bytecodes::_iaload: case Bytecodes::_iastore:
        case Bytecodes::_baload: case Bytecodes::_caload: case Bytecodes::_saload: case Bytecodes::_aaload:
          array(bc, bci, s);
          break;
        case Bytecodes::_invokestatic: case Bytecodes::_invokevirtual: case Bytecodes::_invokespecial: case Bytecodes::_invokeinterface: {
          bool dynamic;
          if (!resolve_call(bs,bc,bci,dynamic)) return;
          java_call(bc, bci, s, dynamic);
          break;
        }
        case Bytecodes::_ireturn: case Bytecodes::_lreturn: case Bytecodes::_areturn:
          if (bc==Bytecodes::_lreturn) __ movptr(rax,stack(sp-2));
          else if (bc == Bytecodes::_areturn) __ movptr(rax, stack(sp-1));
          else __ movl(rax, stack(sp-1));
          if (bc == Bytecodes::_ireturn) {
            switch (prepared_data->_signature->return_type()) {
              case T_BOOLEAN: __ andl(rax, 1); break;
              case T_BYTE: __ movsbl(rax, rax); break;
              case T_CHAR: __ movzwl(rax, rax); break;
              case T_SHORT: __ movswl(rax, rax); break;
              default: break;
            }
          }
          epilog();
          break;
        case Bytecodes::_return:
          // A direct constructor performs stores in bytecode order. Preserve
          // the normal constructor release, including final reference fields.
          if (_method->is_object_initializer()) __ membar(Assembler::Membar_mask_bits(Assembler::StoreStore | Assembler::LoadStore));
          epilog();
          break;
        case Bytecodes::_athrow: {
          __ movptr(rax,stack(sp-1)); null_check(rax,bci,s);
          // The standard exception stub installs rdx as the throwing PC and
          // saves live registers before entering the VM, as for C1 athrow.
          int pc=__ offset();
          safepoint(bci,s,-1,true,false,true);
          __ lea(rdx,InternalAddress(_code->insts_begin()+pc));
          __ call(RuntimeAddress(Runtime1::entry_for(StubId::c1_handle_exception_nofpu_id)));
          __ should_not_reach_here();
          break;
        }
        case Bytecodes::_tableswitch: case Bytecodes::_lookupswitch:
          __ movl(rax,stack(sp-1));
          if (bc == Bytecodes::_tableswitch) {
            Bytecode_tableswitch sw(&bs);
            for (int i=0;i<sw.length();i++) {
              __ cmpl(rax,sw.low_key()+i); __ jcc(Assembler::equal,_labels[bci+sw.dest_offset_at(i)]);
            }
            __ jmp(_labels[bci+sw.default_offset()]);
          } else {
            Bytecode_lookupswitch sw(&bs);
            for (int i=0;i<sw.number_of_pairs();i++) {
              __ cmpl(rax,sw.pair_at(i).match()); __ jcc(Assembler::equal,_labels[bci+sw.pair_at(i).offset()]);
            }
            __ jmp(_labels[bci+sw.default_offset()]);
          }
          break;
        case Bytecodes::_goto:
          if (bs.get_dest()<=bci) backedge(bci,s);
          __ jmp(_labels[bs.get_dest()]);
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
          if (bs.get_dest()<=bci) {
            Label fallthrough;
            __ jcc(Assembler::Condition(condition(bc)^1),fallthrough);
            backedge(bci,s);
            __ jmp(_labels[bs.get_dest()]);
            __ bind(fallthrough);
          } else __ jcc(condition(bc), _labels[bs.get_dest()]);
          break;
      }
      if (_failure != nullptr) return;
    }
    // Runtime exception dispatch enters distinct pads, never ordinary CFG
    // labels. Catch lookup can replace the exception while resolving a type,
    // so extract the current TLS oop rather than trust a restored register.
    for (int i=0;i<prepared_data->_handler_count;i++) {
      int bci=prepared_data->_handlers[i].bci;
      if (_handler_pcos[bci]>=0) continue;
      _handler_pcos[bci]=__ offset();
      __ movptr(rax,Address(r15_thread,JavaThread::exception_oop_offset()));
      __ movptr(Address(r15_thread,JavaThread::exception_oop_offset()),NULL_WORD);
      __ movptr(Address(r15_thread,JavaThread::exception_pc_offset()),NULL_WORD);
      __ movptr(stack(0),rax);
      __ jmp(_labels[bci]);
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
  bool build_handlers(ExceptionHandlerTable* table) {
    if (_exception_pcs==nullptr) return true;
    GrowableArray<intptr_t> bcis(8),pcos(8);
    int entries=0;
    for (int p=0;p<_exception_pcs->length();p++) {
      int bci=_exception_bcis->at(p);
      State* source=_states[bci];
      bcis.trunc_to(0);pcos.trunc_to(0);
      for (int i=0;i<prepared_data->_handler_count;i++) {
        Prepared::Handler& h=prepared_data->_handlers[i];
        if (bci<h.start || bci>=h.end) continue;
        State* target=_states[h.bci];
        // Handler operands replace the old expression stack. Only verifier-live
        // locals are retained, including both slots of each long value.
        for (int l=0;l<_nl;l++)
          if (target->locals[l]!=T_ILLEGAL && target->locals[l]!=source->locals[l]) return fail("handler local state");
        if (bcis.find(h.bci)<0) { bcis.append(h.bci);pcos.append(_handler_pcos[h.bci]); }
        if (h.catch_all) break;
      }
      if (bcis.length()!=0) {
        entries+=1+bcis.length();
        if (entries>4096) return fail("handler metadata bound");
        table->add_subtable(_exception_pcs->at(p),&bcis,nullptr,&pcos);
      }
    }
    return true;
  }
 public:
  Emitter(ciEnv* env, ciMethod* method, AbstractCompiler* compiler) :
    _env(env), _method(method), _compiler(compiler), _failure(nullptr),
    _nl(method->max_locals()), _ns(method->max_stack()), _size(method->code_size()),
    _out_words(prepared_data->_out_words), _frame_bytes(0), _frame_words(0), _last_scope_pc(-1), _code(nullptr), _masm(nullptr), _debug(nullptr), _maps(nullptr),
    _exception_pcs(nullptr), _exception_bcis(nullptr), _handler_pcos(nullptr) {
  }
  void compile(bool install) {
    assert(prepared_data!=nullptr,"worker preparation required");
    if (!_method->can_be_compiled() || _method->needs_clinit_barrier() ||
        !ordinary_bytecode_root(_method->intrinsic_id())) {
      _env->record_failure("method shape"); return;
    }
    _states=prepared_data->_states;
    _call_signatures=prepared_data->_call_signatures;
    _labels=NEW_RESOURCE_ARRAY(Label,_size);
    for (int i=0;i<_size;i++) new (&_labels[i]) Label();
    if (prepared_data->_handler_count!=0) {
      _exception_pcs=new GrowableArray<int>(8);_exception_bcis=new GrowableArray<int>(8);
      _handler_pcos=NEW_RESOURCE_ARRAY(int,_size);
      for (int i=0;i<_size;i++) _handler_pcos[i]=-1;
    }
    OopRecorder* recorder = new OopRecorder(_env->arena());
    _env->set_oop_recorder(recorder);
    _debug = new DebugInformationRecorder(recorder);
    _maps = new OopMapSet(); _debug->set_oopmaps(_maps);
    _env->set_debug_info(_debug);
    _env->set_dependencies(new Dependencies(_env));
    if (_env->jvmti_can_hotswap_or_post_breakpoint()) _env->dependencies()->assert_evol_method(_method);
    CompilerThread* thread = CompilerThread::current();
    BufferBlob* buffer = thread->get_buffer_blob();
    int capacity = 65536 + sizeof(jdouble) + CodeEntryAlignment + HeapWordSize +
                   3 * CodeSection::end_slop();
    if (buffer == nullptr) {
      buffer = BufferBlob::create("direct baseline temporary CodeBuffer", capacity);
      if (buffer != nullptr) thread->set_buffer_blob(buffer);
    }
    if (buffer == nullptr || buffer->content_size() < capacity) {
      _env->record_failure("direct code buffer allocation/capacity"); return;
    }
    // Borrow only code storage, as C1 does. Relocations and metadata remain
    // per-task; register_method/free_blob must not release the owner's buffer.
    CodeBuffer code(buffer);
    int relocations = 16384 / sizeof(relocInfo);
    code.insts()->initialize_shared_locs(NEW_RESOURCE_ARRAY(relocInfo, relocations), relocations);
    _code = &code;
    emit();
    if (_failure != nullptr) { _env->record_failure(_failure); _code->free_blob(); return; }
    ExceptionHandlerTable handlers;
    if (!build_handlers(&handlers)) { _env->record_failure(_failure);_code->free_blob();return; }
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
                    target->holder()->name()->as_utf8(), target->name()->as_utf8(), prepared_data->_signature->symbol()->as_C_string(),
                    target->code_size(), os::javaTimeNanos() - begin, os::current_thread_cpu_time() - cpu,
                    env->failing() ? env->failure_reason() : "installed");
    }
  }
};
} // anonymous namespace

const char* DirectBaseline::prepare(const methodHandle& method) {
  assert(CompilerThread::current()->thread_state() == _thread_in_vm, "prepare in VM state");
  assert(prepared_data == nullptr, "previous preparation must be cleared");
  prepared_data=new Prepared(method());
  bool accepted=prepared_data->prepass(method);
  const char* reason=accepted?nullptr:prepared_data->_failure;
  if (TraceDirectBaseline) {
    ttyLocker lock;
    tty->print_cr("direct prepare %s %s%s outcome=%s",
      method->method_holder()->name()->as_C_string(),method->name()->as_C_string(),
      method->signature()->as_C_string(),accepted?"accepted":reason);
  }
  if (!accepted) prepared_data=nullptr;
  return reason;
}
void DirectBaseline::clear_prepared() { prepared_data=nullptr; }
AbstractCompiler* DirectBaseline::compiler() { static DirectCompiler* c = new DirectCompiler(); return c; }
const char* DirectBaseline::preflight_failure(Method* method) {
  // Called on the requesting Java thread under MethodCompileQueue_lock.
  // Leave the bytecode/signature pass to the worker, before CI construction.
  if (method->has_monitor_bytecodes() ||
      method->is_scoped() || method->has_reserved_stack_access() ||
      !ordinary_bytecode_root(method->intrinsic_id()) ||
      method->max_locals() > max_locals || method->max_stack() > max_stack ||
      method->code_size() > max_code_size || method->code_size() == 0) return "method shape";
  if (method->result_type() != T_VOID && !supported_type(method->result_type())) return "result type";
  return nullptr;
}
void DirectBaseline::request(const methodHandle& method, JavaThread* thread) {
  if (!UseDirectBaseline || !UseCompiler || !TieredCompilation || !ProfileInterpreter || TieredStopAtLevel < 3 ||
      !CompilationModeFlag::normal() || ReplayCompiles || TrainingData::have_data() || TrainingData::need_data() ||
      (!UseSerialGC && !UseG1GC) || JvmtiExport::can_post_interpreter_events() || method->method_data() != nullptr || method->is_native() ||
      method->is_synchronized() || method->is_method_handle_intrinsic() ||
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
