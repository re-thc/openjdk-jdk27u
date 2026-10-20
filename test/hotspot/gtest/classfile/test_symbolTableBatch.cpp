/*
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
 */

#include "classfile/classLoaderData.inline.hpp"
#include "classfile/symbolTable.hpp"
#include "classfile/systemDictionary.hpp"
#include "memory/metadataFactory.hpp"
#include "memory/resourceArea.hpp"
#include "oops/constantPool.inline.hpp"
#include "runtime/handles.inline.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/os.hpp"
#include "runtime/vmOperations.hpp"
#include "runtime/vmThread.hpp"
#include "unittest.hpp"

class SymbolTableTest : public AllStatic {
public:
  static bool try_rehash() {
    return SymbolTable::try_rehash_table();
  }

  static void batch(ClassLoaderData* cld, const constantPoolHandle& cp,
                    int count, const char** names, int* lengths, int* indices) {
    SymbolTable::new_symbols(cld, cp, count, names, lengths, indices);
  }

  static void check_permanent_duplicates(const constantPoolHandle& cp, const char* name) {
    const int count = 64;
    const int length = (int)strlen(name);
    const char* names[count];
    int lengths[count];
    int indices[count];
    for (int i = 0; i < count; i++) {
      names[i] = name;
      lengths[i] = length;
      indices[i] = i + 1;
    }
    const size_t before = SymbolTable::arena()->used();
    batch(ClassLoaderData::the_null_class_loader_data(), cp, count, names, lengths, indices);
    const size_t used = SymbolTable::arena()->used() - before;
    Symbol* symbol = cp->symbol_at(1);
    // Allow one symbol, its node header/alignment, and an unused chunk tail.
    EXPECT_LT(used, 4u * symbol->byte_size());
    EXPECT_TRUE(symbol->is_permanent());
    EXPECT_TRUE(symbol->equals(name, length));
    for (int i = 1; i < count; i++) {
      EXPECT_EQ(symbol, cp->symbol_at(i + 1));
    }

    // Simulate a miss whose insertion loses to an existing permanent symbol.
    unsigned int hash = 0;
    EXPECT_EQ(symbol, SymbolTable::lookup_only(name, length, hash));
    EXPECT_EQ(symbol, SymbolTable::do_add_if_needed(name, length, hash, true));
    const size_t warmed = SymbolTable::arena()->used();
    EXPECT_EQ(symbol, SymbolTable::do_add_if_needed(name, length, hash, true));
    EXPECT_EQ(warmed, SymbolTable::arena()->used());
  }

  static void check_cold_duplicates(int count, bool precomputed = false) {
    JavaThread* THREAD = JavaThread::current();
    ThreadInVMfromNative tiv(THREAD);
    HandleMark hm(THREAD);
    ResourceMark rm(THREAD);
    ClassLoaderData* cld = ClassLoaderData::class_loader_data(SystemDictionary::java_system_loader());
    ASSERT_NE(cld, nullptr);
    ConstantPool* pool = ConstantPool::allocate(cld, count + 1, THREAD);
    ASSERT_FALSE(HAS_PENDING_EXCEPTION);
    constantPoolHandle cp(THREAD, pool);
    char name[80];
    os::snprintf_checked(name, sizeof(name), "test_symbol_batch_cold_regular_%d_%d", count, precomputed);
    const char** names = NEW_RESOURCE_ARRAY(const char*, count);
    int* lengths = NEW_RESOURCE_ARRAY(int, count);
    int* indices = NEW_RESOURCE_ARRAY(int, count);
    for (int i = 0; i < count; i++) {
      names[i] = name;
      lengths[i] = (int)strlen(name);
      indices[i] = i + 1;
    }
    unsigned int* hashes = nullptr;
    if (precomputed) {
      hashes = NEW_RESOURCE_ARRAY(unsigned int, count);
      for (int i = 0; i < count; i++) {
        EXPECT_EQ(nullptr, SymbolTable::lookup_only(name, lengths[i], hashes[i]));
      }
    }
    SymbolTable::new_symbols(cld, cp, count, names, lengths, indices, hashes);
    Symbol* symbol = cp->symbol_at(1);
    EXPECT_FALSE(symbol->is_permanent());
    EXPECT_EQ(count, symbol->refcount());
    for (int i = 1; i < count; i++) {
      EXPECT_EQ(symbol, cp->symbol_at(i + 1));
    }
    TempNewSymbol anchor = SymbolTable::new_symbol(name);
    EXPECT_EQ(symbol, anchor);
    EXPECT_EQ(count + 1, symbol->refcount());
    MetadataFactory::free_metadata(cld, pool);
    EXPECT_EQ(1, anchor->refcount());
  }

  static void check(int count, int layout) {
    JavaThread* THREAD = JavaThread::current();
    ThreadInVMfromNative tiv(THREAD);
    HandleMark hm(THREAD);
    ResourceMark rm(THREAD);
    ClassLoaderData* cld = ClassLoaderData::class_loader_data(SystemDictionary::java_system_loader());
    ASSERT_NE(cld, nullptr);
    const char** original = NEW_RESOURCE_ARRAY(const char*, count);
    char duplicate[80];
    os::snprintf_checked(duplicate, sizeof(duplicate), "test_symbol_batch_duplicate_%d", count);
    TempNewSymbol anchor = SymbolTable::new_symbol(duplicate);
    const int initial_refcount = anchor->refcount();
    int duplicates = 0;
    for (int i = 0; i < count; i++) {
      if (layout == 1 || (layout == 0 && i % 3 == 1)) {
        original[i] = "java/lang/Object";
      } else if (i % 3 == 0) {
        original[i] = duplicate;
        duplicates++;
      } else {
        char* name = NEW_RESOURCE_ARRAY(char, 80);
        os::snprintf_checked(name, 80, "test_symbol_batch_unique_%d_%d", count, i);
        original[i] = name;
      }
    }

    ConstantPool* pools[2];
    for (int pass = 0; pass < 2; pass++) {
      pools[pass] = ConstantPool::allocate(cld, count + 1, THREAD);
      ASSERT_FALSE(HAS_PENDING_EXCEPTION);
      constantPoolHandle cp(THREAD, pools[pass]);
      const char** names = NEW_RESOURCE_ARRAY(const char*, count);
      int* lengths = NEW_RESOURCE_ARRAY(int, count);
      int* indices = NEW_RESOURCE_ARRAY(int, count);
      for (int i = 0; i < count; i++) {
        names[i] = original[i];
        lengths[i] = (int)strlen(names[i]);
        indices[i] = i + 1;
      }
      batch(cld, cp, count, names, lengths, indices);
      for (int i = 0; i < count; i++) {
        EXPECT_TRUE(cp->symbol_at(i + 1)->equals(original[i], (int)strlen(original[i])));
        if (pass != 0) {
          EXPECT_EQ(cp->symbol_at(i + 1), pools[0]->symbol_at(i + 1));
        }
      }
      EXPECT_EQ(anchor->refcount(), initial_refcount + (pass + 1) * duplicates);
    }
    MetadataFactory::free_metadata(cld, pools[1]);
    EXPECT_EQ(anchor->refcount(), initial_refcount + duplicates);
    MetadataFactory::free_metadata(cld, pools[0]);
    EXPECT_EQ(anchor->refcount(), initial_refcount);
  }
};

class SymbolTablePermanentDuplicates : public VM_GTestExecuteAtSafepoint {
  const constantPoolHandle& _cp;
  const char* _name;
public:
  SymbolTablePermanentDuplicates(const constantPoolHandle& cp, const char* name)
    : _cp(cp), _name(name) {}
  void doit() { SymbolTableTest::check_permanent_duplicates(_cp, _name); }
};

class SymbolTableRehash : public VM_GTestExecuteAtSafepoint {
  bool _done;
public:
  SymbolTableRehash() : _done(false) {}
  void doit() override { _done = SymbolTableTest::try_rehash(); }
  bool done() const { return _done; }
};

TEST_VM(SymbolTable, batch_permanent_duplicates) {
  JavaThread* THREAD = JavaThread::current();
  ThreadInVMfromNative tiv(THREAD);
  HandleMark hm(THREAD);
  ClassLoaderData* cld = ClassLoaderData::the_null_class_loader_data();
  ConstantPool* pool = ConstantPool::allocate(cld, 65, THREAD);
  ASSERT_FALSE(HAS_PENDING_EXCEPTION);
  constantPoolHandle cp(THREAD, pool);
  char name[512];
  memset(name, 'x', sizeof(name) - 1);
  const char* prefix = "test_symbol_batch_cold_permanent_";
  memcpy(name, prefix, strlen(prefix));
  name[sizeof(name) - 1] = '\0';
  // Exclude concurrent Symbol arena allocations from the storage checks.
  SymbolTablePermanentDuplicates op(cp, name);
  VMThread::execute(&op);
  MetadataFactory::free_metadata(cld, pool);
}

TEST_VM(SymbolTable, batch_reference_ownership) {
  const int counts[] = {0, 1, 15, 16, 17, 257};
  for (int count : counts) {
    for (int layout = 0; layout < 3; layout++) {
      SymbolTableTest::check(count, layout);
    }
  }
}

TEST_VM(SymbolTable, batch_reference_ownership_alt_hash) {
  bool rehashed = false;
  for (int attempts = 0; !rehashed && attempts < 1000; attempts++) {
    SymbolTableRehash op;
    {
      ThreadInVMfromNative tiv(JavaThread::current());
      VMThread::execute(&op);
    }
    rehashed = op.done();
    if (!rehashed) {
      os::naked_short_sleep(10);
    }
  }
  ASSERT_TRUE(rehashed) << "Timed out waiting to rehash the symbol table";
  const int counts[] = {1, 17, 257};
  for (int count : counts) {
    for (int layout = 0; layout < 3; layout++) {
      SymbolTableTest::check(count, layout);
    }
  }
}

TEST_VM(SymbolTable, batch_cold_duplicate_references) {
  const int counts[] = {1, 15, 16, 17, 257};
  for (int count : counts) {
    SymbolTableTest::check_cold_duplicates(count);
  }
  SymbolTableTest::check_cold_duplicates(20, true);
}
