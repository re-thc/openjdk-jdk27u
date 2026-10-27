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

package xdhagent;

import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.Opcode;
import java.lang.classfile.instruction.ReturnInstruction;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.instrument.ClassFileTransformer;
import java.lang.instrument.Instrumentation;
import java.security.ProtectionDomain;
import java.util.Map;
import java.util.Set;
import java.util.jar.JarFile;

public class Agent {
    private static JarFile helpers;

    public static void premain(String helperJar, Instrumentation instrumentation)
            throws Exception {
        helpers = new JarFile(helperJar);
        instrumentation.appendToBootstrapClassLoaderSearch(helpers);
        Class<?> bridge = Class.forName("xdhagent.Bridge", false, null);
        Module sasl = ModuleLayer.boot().findModule("java.security.sasl").orElseThrow();
        instrumentation.redefineModule(sasl, Set.of(bridge.getModule()),
                Map.of(), Map.of(), Set.of(), Map.of());
        ClassFile classFile = ClassFile.of();
        instrumentation.addTransformer(new ClassFileTransformer() {
            @Override
            public byte[] transform(Module module, ClassLoader loader,
                    String name, Class<?> redefining, ProtectionDomain domain,
                    byte[] bytes) {
                if (!"com/sun/security/sasl/Provider".equals(name)) return null;
                if (module != sasl || redefining != null) {
                    throw new AssertionError("Not initial SunSASL definition");
                }
                byte[] transformed = classFile.transformClass(classFile.parse(bytes),
                        ClassTransform.transformingMethodBodies(
                                method -> method.methodName().equalsString("<init>"),
                                (builder, element) -> {
                                    if (element instanceof ReturnInstruction ret &&
                                            ret.opcode() == Opcode.RETURN) {
                                        builder.aload(0).invokestatic(
                                                ClassDesc.of("xdhagent.Bridge"), "install",
                                                MethodTypeDesc.of(ClassDesc.ofDescriptor("V"),
                                                        ClassDesc.of("java.security.Provider")));
                                    }
                                    builder.accept(element);
                                }));
                System.setProperty("xdh.fixture.transformed", "true");
                return transformed;
            }
        });
        System.setProperty("xdh.fixture.agent", "true");
    }
}
