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
 * @summary Check literal conversion registration and compare it with reflective registration
 * @library /test/lib
 * @modules jdk.incubator.vector
 * @build ConversionRegistrationWorker
 * @run main/othervm ConversionRegistrationTest
 */

import java.io.File;
import java.io.InputStream;
import java.lang.classfile.*;
import java.lang.classfile.instruction.ConstantInstruction;
import java.lang.classfile.instruction.ExceptionCatch;
import java.lang.classfile.instruction.FieldInstruction;
import java.lang.classfile.instruction.NewReferenceArrayInstruction;
import java.lang.classfile.instruction.StoreInstruction;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.AccessFlag;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import jdk.incubator.vector.VectorOperators;
import jdk.test.lib.Utils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

import static java.lang.constant.ConstantDescs.*;

public class ConversionRegistrationTest {
    private static final ClassDesc OPERATORS = ClassDesc.of("jdk.incubator.vector.VectorOperators");
    private static final ClassDesc CONVERSION = OPERATORS.nested("Conversion");
    private static final ClassDesc IMPL = OPERATORS.nested("ConversionImpl");
    private static final String REFERENCE = "testReflectiveConversions";
    private static final MethodTypeDesc ARRAY_TYPE = MethodTypeDesc.of(CONVERSION.arrayType());

    public static void main(String[] args) throws Exception {
        ClassModel outer = ClassFile.of().parse(classBytes(OPERATORS));
        ClassModel impl = ClassFile.of().parse(classBytes(IMPL));
        List<String> declared = checkLiteralList(outer, impl);

        Path direct = Files.createTempDirectory(Path.of("."), "direct-registration-");
        Path reflective = Files.createTempDirectory(Path.of("."), "reflective-registration-");
        // Copy the complete nest from the tested module. This also makes an overlay
        // qualification compare the same current-source classes in both workers.
        List<ClassDesc> nest = new ArrayList<>();
        nest.add(OPERATORS);
        outer.findAttribute(Attributes.nestMembers()).orElseThrow().nestMembers()
            .forEach(entry -> nest.add(entry.asSymbol()));
        for (ClassDesc member : nest) {
            byte[] bytes = classBytes(member);
            writeClass(direct, member, bytes);
            writeClass(reflective, member, bytes);
        }
        writeClass(reflective, IMPL, reflectiveRegistration(impl, declared));
        List<String> actual = runWorker(direct, "direct");
        List<String> reference = runWorker(reflective, "reflective");
        if (!actual.equals(reference)) {
            throw new AssertionError("direct/reflective operation or exception difference; see worker output");
        }
        System.out.println("Matched direct and reflective registration, including complete results and exceptions");
    }

    private static List<String> checkLiteralList(ClassModel outer, ClassModel impl) {
        // Class-file field order preserves javac declaration order; getFields() does not promise it.
        List<String> declared = outer.fields().stream()
            .filter(f -> f.flags().has(AccessFlag.PUBLIC) && f.flags().has(AccessFlag.STATIC)
                && f.fieldTypeSymbol().equals(CONVERSION))
            .map(f -> f.fieldName().stringValue()).toList();
        MethodModel init = impl.methods().stream()
            .filter(m -> m.methodName().equalsString("initCaches")).findFirst().orElseThrow();
        List<String> listed = init.code().orElseThrow().elementStream()
            .filter(e -> e instanceof FieldInstruction f && f.opcode() == Opcode.GETSTATIC
                && f.owner().asSymbol().equals(OPERATORS) && f.typeSymbol().equals(CONVERSION))
            .map(e -> ((FieldInstruction) e).name().stringValue()).toList();
        if (declared.isEmpty() || !declared.equals(listed)) {
            throw new AssertionError("literal registration differs from public declaration order: "
                + declared + " != " + listed);
        }
        System.out.println("Literal registration order: " + listed);
        return declared;
    }

    private static void checkArrayPrefix(ClassModel impl, List<String> declared) {
        var code = impl.methods().stream().filter(m -> m.methodName().equalsString("initCaches"))
            .findFirst().orElseThrow().code().orElseThrow();
        if (code.elementStream().anyMatch(e -> e instanceof ExceptionCatch)) {
            throw new AssertionError("unexpected registration exception handler");
        }
        List<Instruction> instructions = code.elementStream().filter(e -> e instanceof Instruction)
            .map(e -> (Instruction) e).toList();
        int end = 2 + 4 * declared.size();
        if (instructions.size() <= end
                || !(instructions.get(0) instanceof ConstantInstruction size)
                || !size.constantValue().equals(declared.size())
                || !(instructions.get(1) instanceof NewReferenceArrayInstruction array)
                || !array.componentType().asSymbol().equals(CONVERSION)
                || !(instructions.get(end) instanceof StoreInstruction store)
                || store.slot() != 0 || store.typeKind() != TypeKind.REFERENCE) {
            throw new AssertionError("unexpected registration array prefix");
        }
        for (int i = 0; i < declared.size(); i++) {
            int offset = 2 + 4 * i;
            if (instructions.get(offset).opcode() != Opcode.DUP
                    || !(instructions.get(offset + 1) instanceof ConstantInstruction index)
                    || !index.constantValue().equals(i)
                    || !(instructions.get(offset + 2) instanceof FieldInstruction field)
                    || field.opcode() != Opcode.GETSTATIC || !field.owner().asSymbol().equals(OPERATORS)
                    || !field.typeSymbol().equals(CONVERSION) || !field.name().equalsString(declared.get(i))
                    || instructions.get(offset + 3).opcode() != Opcode.AASTORE) {
                throw new AssertionError("unexpected registration array entry: " + i);
            }
        }
    }

    private static byte[] reflectiveRegistration(ClassModel impl, List<String> declared) {
        checkArrayPrefix(impl, declared);
        if (impl.methods().stream().anyMatch(m -> m.methodName().equalsString(REFERENCE))) {
            throw new AssertionError("reference helper name collision");
        }
        // Replace only the straight-line literal-array prefix, keeping the existing
        // iteration, W/N remapping, assertions, slot selection and synchronization.
        CodeTransform prefix = CodeTransform.ofStateful(() -> new CodeTransform() {
            private boolean replaced;
            @Override
            public void accept(CodeBuilder builder, CodeElement element) {
                if (!replaced) {
                    if (element instanceof StoreInstruction store && store.slot() == 0
                            && store.typeKind() == TypeKind.REFERENCE) {
                        builder.invokestatic(IMPL, REFERENCE, ARRAY_TYPE);
                        replaced = true;
                    } else if (element instanceof Instruction) {
                        return;
                    }
                }
                builder.with(element);
            }
            @Override
            public void atEnd(CodeBuilder builder) {
                if (!replaced) throw new AssertionError("registration array store not found");
            }
        });
        ClassTransform transform = ClassTransform.transformingMethodBodies(
            m -> m.methodName().equalsString("initCaches"), prefix);
        return ClassFile.of().transformClass(impl, transform.andThen(ClassTransform.endHandler(builder ->
            builder.withMethodBody(REFERENCE, ARRAY_TYPE, ClassFile.ACC_PRIVATE | ClassFile.ACC_STATIC,
                ConversionRegistrationTest::reflectiveArray))));
    }

    private static void reflectiveArray(CodeBuilder code) {
        ClassDesc list = ClassDesc.of("java.util.ArrayList");
        ClassDesc field = ClassDesc.of("java.lang.reflect.Field");
        var loop = code.newLabel();
        var next = code.newLabel();
        var done = code.newLabel();
        // The legacy getFields/type-filter/get enumeration, confined to this test-only helper.
        code.new_(list).dup().invokespecial(list, "<init>", MethodTypeDesc.of(CD_void)).astore(0)
            .ldc(OPERATORS).invokevirtual(CD_Class, "getFields", MethodTypeDesc.of(field.arrayType())).astore(1)
            .iconst_0().istore(2).labelBinding(loop)
            .iload(2).aload(1).arraylength().if_icmpge(done)
            .aload(1).iload(2).aaload().astore(3)
            .aload(3).invokevirtual(field, "getType", MethodTypeDesc.of(CD_Class))
            .ldc(CONVERSION).if_acmpne(next)
            .aload(0).aload(3).aconst_null()
            .invokevirtual(field, "get", MethodTypeDesc.of(CD_Object, CD_Object))
            .invokevirtual(list, "add", MethodTypeDesc.of(CD_boolean, CD_Object)).pop()
            .labelBinding(next).iinc(2, 1).goto_(loop).labelBinding(done)
            .aload(0).iconst_0().anewarray(CONVERSION)
            .invokevirtual(list, "toArray", MethodTypeDesc.of(CD_Object.arrayType(), CD_Object.arrayType()))
            .checkcast(CONVERSION.arrayType()).areturn();
    }

    private static List<String> runWorker(Path patch, String label) throws Exception {
        List<String> options = new ArrayList<>();
        // Prepend the tested nest to this module's patch path, preserving any
        // other patched vector classes, other module patches and harness flags.
        String vectorPatch = patch.toAbsolutePath().toString();
        String[] inherited = Utils.getTestJavaOpts();
        for (int i = 0; i < inherited.length; i++) {
            String option = inherited[i];
            if (option.equals("--patch-module") && i + 1 < inherited.length
                    && inherited[i + 1].startsWith("jdk.incubator.vector=")) {
                vectorPatch += File.pathSeparator + inherited[++i].substring("jdk.incubator.vector=".length());
            } else if (option.startsWith("--patch-module=jdk.incubator.vector=")) {
                vectorPatch += File.pathSeparator + option.substring("--patch-module=jdk.incubator.vector=".length());
            } else {
                options.add(option);
            }
        }
        options.addAll(List.of("-Xshare:off", "-ea", "-esa", "--add-modules=jdk.incubator.vector",
            "--add-opens=jdk.incubator.vector/jdk.incubator.vector=ALL-UNNAMED",
            "--patch-module=jdk.incubator.vector=" + vectorPatch,
            "ConversionRegistrationWorker"));
        // Options were preserved above; do not prepend them a second time.
        OutputAnalyzer result = ProcessTools.executeProcess(
            ProcessTools.createLimitedTestJavaProcessBuilder(options));
        Files.writeString(Path.of(label + "-worker.stdout"), result.getStdout());
        Files.writeString(Path.of(label + "-worker.stderr"), result.getStderr());
        result.shouldHaveExitValue(0);
        List<String> records = result.getStdout().lines()
            .filter(line -> line.startsWith("REGISTRATION ")).toList();
        if (records.isEmpty() || !records.getLast().equals("REGISTRATION END")) {
            throw new AssertionError("incomplete worker transcript: " + label);
        }
        System.out.println(label + " transcript records: " + records.size());
        return records;
    }

    private static byte[] classBytes(ClassDesc type) throws Exception {
        String resource = "/" + type.descriptorString().substring(1, type.descriptorString().length() - 1) + ".class";
        try (InputStream stream = VectorOperators.class.getResourceAsStream(resource)) {
            if (stream == null) throw new AssertionError("missing module class: " + resource);
            return stream.readAllBytes();
        }
    }

    private static void writeClass(Path root, ClassDesc type, byte[] bytes) throws Exception {
        Path file = root.resolve(type.descriptorString().substring(1, type.descriptorString().length() - 1) + ".class");
        Files.createDirectories(file.getParent());
        Files.write(file, bytes);
    }
}
