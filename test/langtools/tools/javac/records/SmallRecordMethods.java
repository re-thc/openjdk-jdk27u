/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Small records use ordinary Object method bodies and preserve component semantics
 * @modules jdk.compiler
 * @run main SmallRecordMethods
 */

import java.lang.classfile.ClassFile;
import java.lang.classfile.instruction.InvokeDynamicInstruction;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import javax.tools.ToolProvider;

public class SmallRecordMethods {
    static final String SOURCE = """
            public class Records {
                public record Empty() {}
                public record Ints(int i, long l) {}
                public record Floating(double d, float f) {}
                public record Small(byte b, short s, char c, boolean z) {}
                public record Refs(Object a, CharSequence b) {}
                public record Arrays(char[] a, Object[] b) {}
                public record Generic<T extends CharSequence>(T a) {}
                public record Access(int x) { public int x() { return x + 100; } }
                public record Five(int a, int b, int c, int d, int e) {}
                public record Eq(int x) { public boolean equals(Object o) { return false; } }
                public record Hash(int x) { public int hashCode() { return -42; } }
                public record Text(int x) { public String toString() { return "custom"; } }
                public record All(int x) {
                    public boolean equals(Object o) { return false; }
                    public int hashCode() { return -42; }
                    public String toString() { return "custom"; }
                }
                public static Object local() { record Local(int x) {} return new Local(7); }
            }
            """;

    static final StringBuilder trace = new StringBuilder();

    public static final class Component implements CharSequence {
        final String name;
        Component(String name) { this.name = name; }
        public boolean equals(Object o) { trace.append(name); return false; }
        public int hashCode() { trace.append(name); return 5; }
        public String toString() { trace.append(name); return name; }
        public int length() { return 0; }
        public char charAt(int i) { throw new IndexOutOfBoundsException(); }
        public CharSequence subSequence(int a, int b) { return ""; }
    }

    static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }

    static Object record(ClassLoader loader, String name, Object... args) throws Exception {
        return Class.forName("Records$" + name, true, loader).getConstructors()[0].newInstance(args);
    }

    static void bytecode(Path dir, String record, String method, String bootstrap) throws Exception {
        var model = ClassFile.of().parse(dir.resolve("Records$" + record + ".class"));
        check(model.methods().size() == model.fields().size() + 4,
                "unexpected helper method in " + record);
        bootstrap(model, method, bootstrap);
    }

    static void bootstrap(java.lang.classfile.ClassModel model, String method, String bootstrap) {
        var code = model.methods().stream().filter(m -> m.methodName().equalsString(method))
                .findFirst().orElseThrow().code().orElseThrow();
        var bootstraps = code.elementStream().filter(e -> e instanceof InvokeDynamicInstruction)
                .map(e -> ((InvokeDynamicInstruction)e).invokedynamic().bootstrap().bootstrapMethod()
                        .asSymbol().owner().descriptorString()).toList();
        check(bootstraps.equals(bootstrap == null ? List.of() : List.of(bootstrap)),
                model.thisClass().asInternalName() + "." + method + ": " + bootstraps);
    }

    public static void main(String... args) throws Exception {
        var compiler = ToolProvider.getSystemJavaCompiler();
        Path source = Path.of("Records.java");
        Files.writeString(source, SOURCE);
        for (int release = 16; release <= Runtime.version().feature(); release++) {
            Path out = Path.of("records-" + release);
            Files.createDirectories(out);
            check(compiler.run(null, null, null, "--release", "" + release, "-d", out.toString(),
                    source.toString()) == 0, "compilation failed for " + release);
            String concat = "Ljava/lang/invoke/StringConcatFactory;";
            String objectMethods = "Ljava/lang/runtime/ObjectMethods;";
            boolean lower = release >= 27;
            for (String r : List.of("Empty", "Ints", "Floating", "Small", "Refs", "Arrays", "Generic", "Access")) {
                bytecode(out, r, "equals", lower ? null : objectMethods);
                bytecode(out, r, "hashCode", lower ? null : objectMethods);
                bytecode(out, r, "toString", lower ? (r.equals("Empty") ? null : concat) : objectMethods);
            }
            for (String m : List.of("equals", "hashCode", "toString")) {
                bytecode(out, "Five", m, objectMethods);
                for (String r : List.of("Eq", "Hash", "Text", "All")) {
                    boolean userDefined = r.equals("All") || r.equals("Eq") && m.equals("equals")
                            || r.equals("Hash") && m.equals("hashCode") || r.equals("Text") && m.equals("toString");
                    bytecode(out, r, m, userDefined ? null
                            : lower ? (m.equals("toString") ? concat : null) : objectMethods);
                }
            }
            try (var loader = new URLClassLoader(new java.net.URL[] {out.toUri().toURL()},
                    SmallRecordMethods.class.getClassLoader())) {
                Object empty = record(loader, "Empty");
                check(empty.toString().equals("Empty[]") && empty.hashCode() == 0, "empty");
                Object ints = record(loader, "Ints", Integer.MIN_VALUE, Long.MAX_VALUE);
                check(ints.equals(record(loader, "Ints", Integer.MIN_VALUE, Long.MAX_VALUE)), "integrals");
                check(ints.hashCode() == 31 * Integer.MIN_VALUE + Long.hashCode(Long.MAX_VALUE), "hash fold");
                check(!ints.equals(null) && !ints.equals(empty), "null/type");
                Object floating = record(loader, "Floating", Double.NaN, Float.NaN);
                check(floating.equals(record(loader, "Floating", Double.longBitsToDouble(0x7ff0000000000001L),
                        Float.intBitsToFloat(0x7f800001))), "NaNs");
                check(!record(loader, "Floating", 0d, 0f).equals(record(loader, "Floating", -0d, 0f)), "double zero");
                check(!record(loader, "Floating", 0d, 0f).equals(record(loader, "Floating", 0d, -0f)), "float zero");
                Object small = record(loader, "Small", (byte)-128, (short)-32768, '\uffff', true);
                check(small.toString().equals("Small[b=-128, s=-32768, c=\uffff, z=true]"), "small primitives");
                Object access = record(loader, "Access", 7);
                check(access.toString().equals("Access[x=7]") && access.hashCode() == 7, "field access");
                char[] chars = {'a', 'b'};
                Object[] objects = {"c"};
                Object arrays = record(loader, "Arrays", chars, objects);
                check(arrays.equals(record(loader, "Arrays", chars, objects)), "array identity");
                check(!arrays.equals(record(loader, "Arrays", chars.clone(), objects)), "array inequality");
                check(arrays.toString().equals("Arrays[a=" + chars + ", b=" + objects + "]"), "array formatting");
                Component a = new Component("a"), b = new Component("b");
                Object refs = record(loader, "Refs", a, b), refs2 = record(loader, "Refs", a, b);
                trace.setLength(0);
                check(!refs.equals(refs2) && trace.toString().equals("b"), "reverse comparison/non-reflexive component");
                trace.setLength(0);
                check(refs.equals(refs) && trace.isEmpty(), "record identity");
                trace.setLength(0);
                check(refs.hashCode() == 160 && trace.toString().equals("ab"), "hash order");
                trace.setLength(0);
                check(refs.toString().equals("Refs[a=a, b=b]") && trace.toString().equals("ab"), "string order");
                check(record(loader, "Refs", null, null).equals(record(loader, "Refs", null, null)), "reference nulls");
                check(record(loader, "Generic", "x").toString().equals("Generic[a=x]"), "generic");
                Object eq = record(loader, "Eq", 1);
                check(!eq.equals(eq), "equals override");
                check(record(loader, "Hash", 1).hashCode() == -42, "hash override");
                check(record(loader, "Text", 1).toString().equals("custom"), "string override");
                Object all = record(loader, "All", 1);
                check(!all.equals(all) && all.hashCode() == -42 && all.toString().equals("custom"), "all overrides");
                Object local = Class.forName("Records", true, loader).getMethod("local").invoke(null);
                check(local.toString().equals("Local[x=7]"), "local name");
            }
        }
        // Component count alone does not bound the size of a concat recipe.
        // This source works with ObjectMethods, whose recipe is built at runtime.
        Path longSource = Path.of("LongName.java");
        Files.writeString(longSource, "public record LongName(int " + "a".repeat(65_524) + ") {}");
        Path longOut = Path.of("long-name");
        Files.createDirectories(longOut);
        check(compiler.run(null, null, null, "-d", longOut.toString(), longSource.toString()) == 0,
                "long-name compilation");
        var longModel = ClassFile.of().parse(longOut.resolve("LongName.class"));
        for (String method : List.of("equals", "hashCode", "toString")) {
            bootstrap(longModel, method, "Ljava/lang/runtime/ObjectMethods;");
        }
        try (var loader = new URLClassLoader(new java.net.URL[] {longOut.toUri().toURL()})) {
            Object value = Class.forName("LongName", true, loader).getConstructors()[0].newInstance(1);
            check(value.hashCode() == 1 && value.toString().length() == 65_536, "long-name behavior");
        }
    }
}
