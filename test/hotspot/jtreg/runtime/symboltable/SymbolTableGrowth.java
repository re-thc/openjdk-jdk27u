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

/*
 * @test
 * @summary The SymbolTable should grow when it fills up with live symbols
 * @requires vm.flagless
 * @library /test/lib
 * @run driver SymbolTableGrowth
 */

import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.lang.invoke.MethodHandles;
import java.util.ArrayList;
import java.util.List;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class SymbolTableGrowth {

    public static void main(String[] args) throws Exception {
        ProcessBuilder pb = ProcessTools.createLimitedTestJavaProcessBuilder(
            "-Xlog:symboltable=debug",
            DefineClasses.class.getName());
        OutputAnalyzer output = new OutputAnalyzer(pb.start());
        output.shouldHaveExitValue(0);
        output.shouldMatch("\\[symboltable\\s*\\] Grown to size:\\d+");
    }

    static class DefineClasses {
        // Each class adds its name and its field names as new symbols, enough to
        // exceed two symbols per bucket of the default 32768 bucket table.
        static final int CLASSES = 1500;
        static final int FIELDS_PER_CLASS = 64;

        public static void main(String[] args) throws Exception {
            MethodHandles.Lookup lookup = MethodHandles.lookup();
            // Keep the classes alive so that their symbols are not cleaned up.
            List<Class<?>> classes = new ArrayList<>();
            for (int i = 0; i < CLASSES; i++) {
                int classId = i;
                byte[] bytes = ClassFile.of().build(ClassDesc.of("Generated" + classId), cb -> {
                    for (int f = 0; f < FIELDS_PER_CLASS; f++) {
                        cb.withField("field_" + classId + "_" + f, ConstantDescs.CD_int, 0);
                    }
                });
                classes.add(lookup.defineClass(bytes));
            }
            System.out.println("Defined " + classes.size() + " classes");
        }
    }
}
