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
  static void batch(ClassLoaderData* cld, const constantPoolHandle& cp,
                    int count, const char** names, int* lengths, int* indices) {
    SymbolTable::new_symbols(cld, cp, count, names, lengths, indices);
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

TEST_VM(SymbolTable, batch_reference_ownership) {
  const int counts[] = {0, 1, 15, 16, 17, 257};
  for (int count : counts) {
    for (int layout = 0; layout < 3; layout++) {
      SymbolTableTest::check(count, layout);
    }
  }
}

class VM_RehashSymbolsForBatchTest : public VM_Operation {
public:
  VMOp_Type type() const { return VMOp_Dummy; }
  void doit() { SymbolTable::rehash_table(); }
};

TEST_VM(SymbolTable, batch_reference_ownership_alt_hash) {
  {
    ThreadInVMfromNative tiv(JavaThread::current());
    VM_RehashSymbolsForBatchTest op;
    VMThread::execute(&op);
  }
  const int counts[] = {1, 17, 257};
  for (int count : counts) {
    for (int layout = 0; layout < 3; layout++) {
      SymbolTableTest::check(count, layout);
    }
  }
}
