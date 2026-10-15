/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only.
 * This code is distributed without any warranty; see the LICENSE file.
 */
// A structural adapter for the extracted production C++ classifier. It does
// not model C2 compilation, native instruction selection or runtime speed.
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <functional>
#include <iostream>
#include <memory>
#include <random>
#include <stdexcept>
#include <unordered_set>
#include <vector>

using uint = unsigned int;
struct Metrics {
  uint64_t helper = 0, slots = 0, reads = 0, uses = 0, bits = 0;
} metrics;
#define assert(condition, ...) do { if (!(condition)) throw std::runtime_error(#condition); } while (false)
struct StackObj {};
struct ResourceMark { ResourceMark() {} ~ResourceMark() {} };
class Node_Array;
struct Arena {
  std::unordered_set<const void*> nodes;
  std::vector<Node_Array*> objects;
  bool contains(const void* p) const { return nodes.count(p) != 0; }
  ~Arena();
};
void* operator new(size_t size, Arena*) { return ::operator new(size); }
void operator delete(void* p, Arena*) { ::operator delete(p); }
enum { Op_AddF, Op_AddReductionVF, Op_VectorCastI2X, Op_VectorCastF2X, Op_Phi, Op_CountedLoop, Op_Other };
enum { T_FLOAT, T_INT, T_DOUBLE };
struct Type {
  int basic = T_FLOAT, lanes = 0;
  bool constant = false;
  uint32_t value = 0;
  const Type* isa_float_constant() const { return constant ? this : nullptr; }
  const Type* isa_vect() const { return lanes != 0 ? this : nullptr; }
  int basic_type() const { return basic; }
  int element_basic_type() const { return basic; }
  uint length() const { return lanes; }
  float getf() const { float result; std::memcpy(&result, &value, 4); return result; }
};
using TypeF = Type;
using TypeVect = Type;
int32_t jint_cast(float value) { int32_t result; std::memcpy(&result, &value, 4); return result; }
using DUIterator_Fast = uint;
struct Node {
  uint _idx;
  int opcode;
  Type type;
  bool strict = false;
  std::vector<Node*> inputs, outputs;
  Node(uint id, int op, uint req) : _idx(id), opcode(op), inputs(req, nullptr) {}
  int Opcode() const { ++metrics.reads; return opcode; }
  Node* in(uint i) const { ++metrics.reads; return inputs.at(i); }
  uint req() const { ++metrics.reads; return static_cast<uint>(inputs.size()); }
  uint outcnt() const { ++metrics.reads; return static_cast<uint>(outputs.size()); }
  bool is_Phi() const { return Opcode() == Op_Phi; }
  bool is_CountedLoop() const { return Opcode() == Op_CountedLoop; }
  const Node* as_Reduction() const { return this; }
  bool requires_strict_order() const { ++metrics.reads; return strict; }
  const Type* bottom_type() const { ++metrics.reads; return &type; }
  uint fast_outs(uint& size) const { size = static_cast<uint>(outputs.size()); return 0; }
  Node* fast_out(uint i) const { ++metrics.uses; return outputs.at(i); }
};
class Node_Array {
protected:
  std::vector<Node*> nodes;
public:
  explicit Node_Array(Arena* a = nullptr) : nodes(32, nullptr) {
    metrics.slots += 32;
    if (a != nullptr) a->objects.push_back(this);
  }
  virtual ~Node_Array() = default;
  Node* operator[](uint id) const { return id < nodes.size() ? nodes[id] : nullptr; }
  void map(uint id, Node* value) {
    if (id >= nodes.size()) {
      size_t old = nodes.size();
      nodes.resize(std::max<size_t>(id + 1, old * 2), nullptr);
      metrics.slots += nodes.size() - old;
    }
    nodes[id] = value;
    ++metrics.slots;
  }
};
Arena::~Arena() { for (Node_Array* p : objects) delete p; }
class Node_List : public Node_Array {
  uint count = 0;
public:
  explicit Node_List(Arena* a = nullptr) : Node_Array(a) {}
  void push(Node* n) { map(count++, n); }
  Node* pop() { return nodes[--count]; }
  Node* at(uint i) const { return nodes.at(i); }
  uint size() const { return count; }
  // Like HotSpot Node_List::clear: clearing retained capacity is real work.
  void clear() { count = 0; metrics.slots += nodes.size(); std::fill(nodes.begin(), nodes.end(), nullptr); }
};
class VectorSet {
  std::vector<uint8_t> bits;
public:
  bool test(uint id) const { ++metrics.bits; return id < bits.size() && bits[id]; }
  void set(uint id) {
    if (id >= bits.size()) {
      size_t old = bits.size();
      bits.resize(std::max<size_t>(id + 1, std::max<size_t>(32, old * 2)), 0);
      metrics.slots += bits.size() - old;
    }
    bits[id] = 1;
    ++metrics.bits;
  }
  bool test_set(uint id) { bool value = test(id); set(id); return value; }
};
class Matcher;
struct Compile {
  Arena compiler, first, second;
  bool swapped = false, osr = false;
  uint current_nodes = 0, count_reads = 0;
  Matcher* owner = nullptr;
  static thread_local Compile* active;
  Compile() { active = this; }
  static Compile* current() { return active; }
  bool is_osr_compilation() const { return osr; }
  Arena* comp_arena() { return &compiler; }
  Arena* old_arena() { return swapped ? &first : &second; }
  Arena* node_arena() { return swapped ? &second : &first; }
  uint live_nodes() { ++count_reads; return current_nodes; }
  Matcher* matcher() { return owner; }
};
thread_local Compile* Compile::active = nullptr;
int UseSVE = 0, MaxVectorSize = 16;
bool neon = true;
struct VM_Version { static bool use_neon_for_vector(int size) { return neon && size == 16; } };
class Matcher {
public:
  Compile* C;
#include "roundtrip-declarations.inc"
public:
  explicit Matcher(Compile* compile) : C(compile) { C->owner = this; }
  void record(Node* n) { collect_float_roundtrip_add(n); }
  void prepare() { prepare_float_roundtrip_accumulations(); }
  void clear() { clear_float_roundtrip_accumulations(); }
  void early_return(const std::function<void()>& body) {
    FloatRoundTripClassificationMark cleanup(this);
    body();
    return;
  }
};
#include "roundtrip-classifier.inc"

struct Graph {
  Compile compile;
  Matcher matcher{&compile};
  std::vector<std::unique_ptr<Node>> nodes;
  std::vector<Node*> adds, reductions, to_ints, to_floats;
  Node* loop;
  Node* seed;
  Node* source;
  Graph() {
    UseSVE = 0; MaxVectorSize = 16; neon = true;
    loop = node(Op_CountedLoop, 0);
    seed = node(Op_Other, 0); seed->type.constant = true;
    source = node(Op_Other, 0); source->type.lanes = 4;
  }
  Node* node(int opcode, uint req) {
    auto n = std::make_unique<Node>(static_cast<uint>(nodes.size()), opcode, req);
    Node* result = n.get(); nodes.push_back(std::move(n));
    compile.first.nodes.insert(result);
    return result;
  }
  void edge(Node* n, uint i, Node* input) {
    if (n->inputs.at(i) != nullptr) {
      auto& old = n->inputs[i]->outputs;
      old.erase(std::find(old.begin(), old.end(), n));
    }
    n->inputs[i] = input;
    if (input != nullptr) input->outputs.push_back(n);
  }
  Node* phi(Node* control = nullptr) {
    Node* p = node(Op_Phi, 3); edge(p, 0, control == nullptr ? loop : control); edge(p, 1, seed); return p;
  }
  Node* add(Node* acc, bool reversed = false) {
    Node* ti = node(Op_VectorCastF2X, 2); ti->type.basic = T_INT; ti->type.lanes = 4; edge(ti, 1, source);
    Node* tf = node(Op_VectorCastI2X, 2); tf->type.lanes = 4; edge(tf, 1, ti);
    Node* r = node(Op_AddReductionVF, 3); edge(r, 1, seed); edge(r, 2, tf);
    Node* a = node(Op_AddF, 3); edge(a, reversed ? 2 : 1, acc); edge(a, reversed ? 1 : 2, r);
    adds.push_back(a); reductions.push_back(r); to_ints.push_back(ti); to_floats.push_back(tf); return a;
  }
  Node* cycle(uint length, bool reversed = false, Node* control = nullptr) {
    Node* p = phi(control); Node* tail = p;
    for (uint i = 0; i < length; ++i) tail = add(tail, reversed);
    edge(p, 2, tail); return p;
  }
  void classify(uint shuffle = 0) {
    auto order = adds;
    std::mt19937 rng(shuffle); std::shuffle(order.begin(), order.end(), rng);
    metrics = {};
    for (Node* n : order) matcher.record(n);
    matcher.prepare();
    compile.swapped = true;
    compile.current_nodes = 0; // The real matcher resets these counters here.
  }
  uint admitted() {
    uint result = 0;
    for (Node* a : adds) result += is_float_roundtrip_reduction_accumulation(a);
    return result;
  }
};

int main() {
  uint cases = 0;
  for (uint length : {1u, 8u, 32u, 64u, 256u, 1024u, 4096u, 16384u}) {
    Graph g; g.cycle(length); g.classify();
    assert(g.admitted() == length);
    assert(metrics.helper <= 2 * length);
    assert(metrics.slots < 100 * g.nodes.size());
    uint64_t before = metrics.helper;
    for (uint repeat = 0; repeat < 8; ++repeat) {
      g.compile.current_nodes = repeat;
      assert(g.admitted() == length);
    }
    assert(metrics.helper == before && g.compile.count_reads == 0);
    std::cout << "COST length=" << length << " helper_visits=" << metrics.helper
              << " slot_work=" << metrics.slots << " graph_nodes=" << g.nodes.size() << '\n';
    g.matcher.clear(); assert(g.admitted() == 0); ++cases;
    Graph rejected; Node* tail = rejected.node(Op_Other, 0);
    for (uint i = 0; i < length; ++i) tail = rejected.add(tail);
    rejected.classify(); assert(rejected.admitted() == 0);
    assert(metrics.helper == length && metrics.slots < 100 * rejected.nodes.size());
    std::cout << "REJECTED_COST length=" << length << " helper_visits=" << metrics.helper << '\n';
    ++cases;
  }
  for (uint order = 0; order < 40; ++order) {
    Graph g; g.cycle(32, order % 2); Node* branch = g.add(g.adds[7]); g.classify(order);
    assert(g.admitted() == 32 && !g.matcher.is_float_roundtrip_reduction_accumulation(branch));
    assert(metrics.helper <= 2 * g.adds.size()); ++cases;
  }
  for (uint variant = 0; variant < 20; ++variant) {
    Graph g; Node* p = g.cycle(8); Node* extra = nullptr;
    switch (variant) {
      case 0: g.reductions[3]->strict = true; break;
      case 1: g.seed->type.value = 0x80000000; break; // negative zero
      case 2: g.seed->type.value = 0x3f800000; break;
      case 3: g.seed->type.constant = false; break;
      case 4: g.to_floats[3]->type.lanes = 2; break;
      case 5: g.to_floats[3]->type.lanes = 8; break;
      case 6: g.to_floats[3]->type.basic = T_INT; break;
      case 7: g.to_ints[3]->type.basic = T_FLOAT; break;
      case 8: g.source->type.lanes = 8; break;
      case 9: g.source->type.basic = T_INT; break;
      case 10: g.to_ints[3]->opcode = Op_Other; break;
      case 11: g.to_floats[3]->opcode = Op_Other; break;
      case 12: g.reductions[3]->inputs.resize(4); break;
      case 13: p->inputs.resize(4); break;
      case 14: g.loop->opcode = Op_Other; break;
      case 15: g.phi(); break; // independent floating accumulator
      case 16: extra = g.reductions[3]; break;
      case 17: extra = g.to_ints[3]; break;
      case 18: extra = g.to_floats[3]; break;
      case 19: g.edge(g.adds.front(), 1, g.adds.back()); break; // no-Phi cycle
    }
    if (extra != nullptr) g.edge(g.node(Op_Other, 1), 0, extra);
    g.classify(variant); assert(g.admitted() == 0);
    assert(metrics.helper <= 2 * g.adds.size()); ++cases;
  }
  for (uint variant = 0; variant < 5; ++variant) {
    Graph g; g.cycle(8);
    if (variant == 0) g.compile.osr = true;
    if (variant == 1) { UseSVE = 1; MaxVectorSize = 32; }
    if (variant == 2) neon = false;
    if (variant == 3) { UseSVE = 0; MaxVectorSize = 32; }
    if (variant == 4) { UseSVE = 1; MaxVectorSize = 16; }
    g.classify(); assert(g.admitted() == (variant >= 3 ? 8u : 0u)); ++cases;
  }
  { // Many rejected Phis share one valid tail: never rescan that tail per Phi.
    Graph g; Node* p = g.cycle(256); Node* shared = p->in(2);
    for (uint i = 0; i < 256; ++i) {
      Node* q = g.phi(g.node(Op_CountedLoop, 0)); g.add(q); g.edge(q, 2, shared);
    }
    g.classify(); assert(g.admitted() == 256);
    assert(metrics.helper <= 2 * g.adds.size()); ++cases;
  }
  { // Scan one loop's Phi uses once, even with many independent recurrences.
    Graph g;
    for (uint i = 0; i < 512; ++i) g.cycle(1);
    g.classify(); assert(g.admitted() == 0);
    assert(metrics.uses == g.loop->outputs.size()); ++cases;
  }
  { // The exclusion counts floating Phis, not every Phi on the loop.
    Graph g; g.cycle(8); g.phi()->type.basic = T_DOUBLE;
    g.classify(); assert(g.admitted() == 8); ++cases;
  }
  { // Separate loops may each have their own single floating recurrence.
    Graph g; g.cycle(4); g.cycle(4, true, g.node(Op_CountedLoop, 0));
    g.classify(); assert(g.admitted() == 8); ++cases;
  }
  { // Exact old identity, not just an index, and cleanup on an early return.
    Graph g; g.cycle(8); Node* old = g.adds.front(); g.classify();
    Node foreign(old->_idx, Op_AddF, 3); g.compile.old_arena()->nodes.insert(&foreign);
    assert(!g.matcher.is_float_roundtrip_reduction_accumulation(&foreign));
    assert(g.admitted() == 8);
    { // Per-tree scratch destruction must not destroy compilation-owned data.
      Arena tree_states;
      auto* scratch = new (&tree_states) Node_Array(&tree_states);
      scratch->map(old->_idx, &foreign);
    }
    assert(g.admitted() == 8);
    g.matcher.early_return([&]() { assert(g.admitted() == 8); });
    assert(g.admitted() == 0); g.compile.first.nodes.clear();
    assert(!g.matcher.is_float_roundtrip_reduction_accumulation(&foreign)); ++cases;
    uint id = old->_idx;
    old->~Node(); new (old) Node(id, Op_AddF, 3);
    g.compile.second.nodes.insert(old); // Reuse both address and index after cleanup.
    assert(!g.matcher.is_float_roundtrip_reduction_accumulation(old));
    assert(!g.matcher.is_float_roundtrip_reduction_accumulation(nullptr)); ++cases;
  }
  { // New/standalone nodes and another compilation cannot inherit membership.
    Graph g; g.cycle(8); g.classify(); Node foreign(g.adds.front()->_idx, Op_AddF, 3);
    g.compile.node_arena()->nodes.insert(&foreign);
    assert(!g.matcher.is_float_roundtrip_reduction_accumulation(&foreign));
    Graph next; next.cycle(8); assert(next.admitted() == 0); ++cases;
  }
  std::cout << "STRUCTURAL_PASS cases=" << cases
            << " metric=production_helper_and_container_operations native_JVMs=0\n";
}
