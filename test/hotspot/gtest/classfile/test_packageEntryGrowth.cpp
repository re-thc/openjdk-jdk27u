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


#include "cds/cdsConfig.hpp"
#include "classfile/classLoaderData.hpp"
#include "classfile/moduleEntry.hpp"
#include "classfile/packageEntry.hpp"
#include "classfile/symbolTable.hpp"
#include "memory/metadataFactory.hpp"
#include "memory/resourceArea.hpp"
#include "runtime/mutexLocker.hpp"
#include "runtime/os.hpp"
#include "utilities/ostream.hpp"
#include "threadHelper.inline.hpp"
#include "unittest.hpp"

static void package_table_growth(Thread* current, bool archived) {
  JavaThread* THREAD = JavaThread::cast(current);
  ResourceMark rm(THREAD);
  const int count = 400;
  Symbol* names[count];
  PackageEntry* entries[count];
  ClassLoaderData* cld = ClassLoaderData::the_null_class_loader_data();
  ModuleEntry* module = cld->unnamed_module();
  for (int i = 0; i < count; i++) {
    char name[64];
    os::snprintf_checked(name, sizeof(name), "package_table_growth/p%d", i);
    names[i] = SymbolTable::new_symbol(name);
  }

#if INCLUDE_CDS_JAVA_HEAP
  Array<PackageEntry*>* packages = nullptr;
  if (archived) {
    packages = MetadataFactory::new_array<PackageEntry*>(cld, count, THREAD);
    ASSERT_FALSE(HAS_PENDING_EXCEPTION);
  }
#endif
  PackageEntryTable* table = new PackageEntryTable();
  {
    MutexLocker ml(Module_lock);
#if INCLUDE_CDS_JAVA_HEAP
    if (archived) {
      for (int i = 0; i < count; i++) {
        entries[i] = new PackageEntry(names[i], module);
        packages->at_put(i, entries[i]);
      }
      table->load_archived_entries(packages);
    } else
#endif
    {
      for (int i = 0; i < count; i++) {
        if (i % 2 == 0) {
          table->locked_create_entry(names[i], module);
          entries[i] = table->locked_lookup_only(names[i]);
        } else {
          entries[i] = table->locked_create_entry_if_absent(names[i], module);
        }
      }
    }
    for (int i = 0; i < count; i++) {
      EXPECT_EQ(table->locked_lookup_only(names[i]), entries[i]);
      EXPECT_EQ(table->locked_create_entry_if_absent(names[i], module), entries[i]);
    }
    stringStream ss;
    table->print(&ss);
    int buckets = 0;
    int entry_count = 0;
    EXPECT_EQ(sscanf(ss.base(), "Package Entry Table (table_size=%d, entries=%d)", &buckets, &entry_count), 2);
    EXPECT_GT(buckets, 109);
    EXPECT_EQ(entry_count, count);
    delete table;
  }
#if INCLUDE_CDS_JAVA_HEAP
  MetadataFactory::free_array(cld, packages);
#endif
  for (int i = 0; i < count; i++) {
    names[i]->decrement_refcount();
  }
}

TEST_VM(PackageEntryTable, growth) {
  auto test = [](Thread* current) { package_table_growth(current, false); };
  nomt_test_doer(test);
}

#if INCLUDE_CDS_JAVA_HEAP
TEST_VM(PackageEntryTable, archived_growth) {
  if (!CDSConfig::is_using_archive()) {
    GTEST_SKIP() << "requires a mapped CDS archive";
  }
  auto test = [](Thread* current) { package_table_growth(current, true); };
  nomt_test_doer(test);
}
#endif
