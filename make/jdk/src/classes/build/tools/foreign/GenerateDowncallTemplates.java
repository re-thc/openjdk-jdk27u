/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
package build.tools.foreign;

import java.io.*;
import java.lang.reflect.*;
import java.nio.ByteOrder;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.CRC32;

/** Generates existing downcall class bytes; never creates a native entry point. */
public final class GenerateDowncallTemplates {
    private static final String ABI = "jdk/internal/foreign/abi/";
    private static final String DATA = ABI + "GeneratedDowncallTemplateData.class";
    private static final String RESOURCE = ABI + "templates/scalar-int.bin";
    private static final List<String> PACKAGES = List.of("jdk/internal/foreign", "java/lang/foreign",
            "java/lang/classfile", "jdk/internal/classfile", "java/lang/constant", "jdk/internal/constant");
    private static final List<String> OPENS = List.of("jdk.internal.foreign.abi",
            "jdk.internal.foreign.abi.x64.sysv", "jdk.internal.foreign.abi.aarch64");
    private static String hash(byte[] bytes) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
    }
    private static String hash(Path file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (InputStream in = Files.newInputStream(file)) {
            byte[] buffer = new byte[65536];
            for (int n; (n = in.read(buffer)) >= 0;) digest.update(buffer, 0, n);
        }
        return HexFormat.of().formatHex(digest.digest());
    }
    private static byte[] encode(Map<String, String> values) {
        StringBuilder text = new StringBuilder();
        new TreeMap<>(values).forEach((k, v) -> text.append(k).append('=').append(v.replace("\\", "/")).append('\n'));
        return text.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8);
    }
    private static Map<String, String> read(Path file) throws Exception {
        Properties properties = new Properties();
        try (InputStream in = Files.newInputStream(file)) { properties.load(in); }
        Map<String, String> result = new TreeMap<>();
        properties.forEach((k, v) -> result.put((String) k, (String) v));
        return result;
    }
    private static void write(Path file, byte[] bytes) throws Exception {
        if (Files.exists(file) && Arrays.equals(Files.readAllBytes(file), bytes)) return;
        Files.createDirectories(file.getParent());
        Path temporary = file.resolveSibling(file.getFileName() + ".pending");
        Files.write(temporary, bytes);
        Files.move(temporary, file, StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
    }
    private static List<Path> files(Path root) throws Exception {
        if (!Files.exists(root)) return List.of();
        try (var stream = Files.walk(root)) { return stream.filter(Files::isRegularFile).sorted().toList(); }
    }
    private static Path executable(Path root, String name) throws IOException {
        for (String candidate : List.of(name, name + ".exe")) {
            Path file = root.resolve("bin").resolve(candidate);
            if (Files.isRegularFile(file)) return file;
        }
        throw new IOException("Missing JDK tool " + name + " under " + root);
    }
    private static Map<String, String> jdkIdentity(Path root) throws Exception {
        Map<String, String> values = new TreeMap<>();
        // Location is diagnostic only; identical JDK contents have one identity.
        for (String name : List.of("release", "bin/java", "bin/javac", "bin/java.exe", "bin/javac.exe", "lib/modules")) {
            Path path = root.resolve(name);
            if (Files.isRegularFile(path)) values.put(name, hash(path));
        }
        for (String directory : List.of("bin", "lib")) {
            for (Path file : files(root.resolve(directory))) {
                String name = root.relativize(file).toString().replace('\\', '/');
                if (name.endsWith(".so") || name.endsWith(".dll") || name.endsWith(".dylib")) values.put(name, hash(file));
            }
        }
        // An in-tree BUILD_JDK is exploded. Exclude only this tool's outputs:
        // installing them must not invalidate the identity used to produce them.
        if (!Files.exists(root.resolve("lib/modules"))) {
            for (Path file : files(root.resolve("modules"))) {
                String name = root.resolve("modules").relativize(file).toString().replace('\\', '/');
                if (!name.equals("java.base/" + DATA) && !name.equals("java.base/" + RESOURCE)) values.put("modules/" + name, hash(file));
            }
        }
        if (!values.containsKey("bin/java") && !values.containsKey("bin/java.exe")) throw new IOException("No executable build JDK: " + root);
        return values;
    }
    private static String sourceId(Path top, String config, Path compiler) throws Exception {
        Map<String, String> inputs = new TreeMap<>();
        inputs.put("format", "1"); inputs.put("target", config);
        inputs.put("compiler", hash(encode(jdkIdentity(compiler))));
        Path shared = top.resolve("src/java.base/share/classes");
        for (String directory : PACKAGES) for (Path file : files(shared.resolve(directory))) {
            if (file.toString().endsWith(".java") || file.toString().endsWith(".java.template")) inputs.put(top.relativize(file).toString(), hash(file));
        }
        inputs.put("tool", hash(top.resolve("make/jdk/src/classes/build/tools/foreign/GenerateDowncallTemplates.java")));
        return hash(encode(inputs));
    }
    private static void source(String[] args) throws Exception {
        Path top = Path.of(args[1]), output = Path.of(args[2]), compiler = Path.of(args[4]);
        System.out.println("FFM compiler JDK: " + compiler.toRealPath());
        String id = sourceId(top, args[3], compiler);
        String sourceText = "package jdk.internal.foreign.abi;\nfinal class DowncallTemplateVersion { static final String ID = \"" + id + "\"; }\n";
        write(output, sourceText.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        write(output.resolveSibling("DowncallTemplateVersion.id"), (id + "\n").getBytes());
    }
    private static Object field(Class<?> type, Object receiver, String name) throws Exception {
        Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(receiver);
    }
    private static Object call(Object receiver, String name) throws Exception {
        return receiver.getClass().getMethod(name).invoke(receiver);
    }
    private static String storage(Object value) throws Exception {
        if (value == null) return "null";
        return "new int[]{" + call(value, "type") + "," + call(value, "segmentMaskOrSize") + "," + call(value, "indexOrOffset") + "}";
    }
    private static String matrix(Object value) throws Exception {
        List<String> rows = new ArrayList<>();
        for (Object row : (Object[]) value) {
            List<String> cells = new ArrayList<>(); for (Object cell : (Object[]) row) cells.add(storage(cell));
            rows.add("new int[][]{" + String.join(",", cells) + "}");
        }
        return "new int[][][]{" + String.join(",", rows) + "}";
    }
    private static void emit(String[] args) throws Exception {
        Path patch = Path.of(args[1]), output = Path.of(args[2]); String id = args[3], config = args[4];
        int major = Integer.parseInt(config.split("\\|")[4]);
        if (Runtime.version().feature() + 44 != major) throw new IOException("Build-host JDK version mismatch");
        for (Path file : files(patch)) if (file.toString().endsWith(".class")) {
            String name = patch.relativize(file).toString().replace('\\', '/');
            try (InputStream in = Object.class.getResourceAsStream("/" + name)) {
                if (in == null || !Arrays.equals(in.readAllBytes(), Files.readAllBytes(file))) throw new IOException("Target module resource mismatch: " + name);
            }
        }
        Class<?> specializer = Class.forName("jdk.internal.foreign.abi.BindingSpecializer");
        if (!id.equals(field(specializer, null, "TEMPLATE_SOURCE_ID"))) throw new IOException("Target source/compiler binding mismatch");
        byte[] bytes = new byte[0]; List<String> entries = new ArrayList<>();
        // The descriptor below uses the producer's native-order JAVA_INT.
        // A different build-host byte order must retain normal generation,
        // rather than making an otherwise supported cross build fail.
        boolean supported = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN &&
                (config.startsWith("linux|x86_64|little|64|") || config.startsWith("linux|aarch64|little|64|"));
        if (supported) {
            Class<?> mt = java.lang.invoke.MethodType.class;
            Class<?> fd = Class.forName("java.lang.foreign.FunctionDescriptor");
            Class<?> vl = Class.forName("java.lang.foreign.ValueLayout");
            Object integer = vl.getField("JAVA_INT").get(null);
            Class<?> layout = Class.forName("java.lang.foreign.MemoryLayout");
            Object layouts = Array.newInstance(layout, 1); Array.set(layouts, 0, integer);
            Object descriptor = fd.getMethod("of", layout, layouts.getClass()).invoke(null, integer, layouts);
            Object type = fd.getMethod("toMethodType").invoke(descriptor);
            Class<?> optionsType = Class.forName("jdk.internal.foreign.abi.LinkerOptions");
            Object options = optionsType.getMethod("empty").invoke(null);
            Class<?> csType = Class.forName("jdk.internal.foreign.abi.CallingSequence");
            Class<?> abiType = Class.forName("jdk.internal.foreign.abi.ABIDescriptor");
            Method emitter = specializer.getDeclaredMethod("specializeHelper", mt, mt, csType, abiType); emitter.setAccessible(true);
            for (String platform : List.of("linux-x64-sysv", "linux-aarch64")) {
                Class<?> arrangerType; Object arranger; Object abi;
                if (platform.equals("linux-x64-sysv")) {
                    arrangerType = Class.forName("jdk.internal.foreign.abi.x64.sysv.CallArranger"); arranger = null;
                    abi = field(arrangerType, null, "CSysV");
                } else {
                    arrangerType = Class.forName("jdk.internal.foreign.abi.aarch64.CallArranger");
                    arranger = arrangerType.getField("LINUX").get(null);
                    Method abiMethod = arrangerType.getDeclaredMethod("abiDescriptor"); abiMethod.setAccessible(true); abi = abiMethod.invoke(arranger);
                }
                Object binding = arrangerType.getMethod("getBindings", mt, fd, boolean.class, optionsType).invoke(arranger, type, descriptor, false, options);
                Object sequence = call(binding, "callingSequence");
                var caller = (java.lang.invoke.MethodType) call(sequence, "callerMethodType");
                caller = caller.insertParameterTypes(0, Class.forName("java.lang.foreign.SegmentAllocator"));
                byte[] generated = (byte[]) emitter.invoke(null, call(sequence, "calleeMethodType"), caller, sequence, abi);
                if (bytes.length != 0 && !Arrays.equals(bytes, generated)) throw new IOException("Target ABI payload mismatch");
                bytes = generated;
                StringBuilder entry = new StringBuilder("new DowncallTemplates.Entry(\"").append(platform).append("\",\"")
                        .append(field(abiType, abi, "arch").getClass().getName()).append("\",");
                for (String name : List.of("inputStorage", "outputStorage", "volatileStorage")) entry.append(matrix(field(abiType, abi, name))).append(',');
                for (String name : List.of("stackAlignment", "shadowSpace")) entry.append(field(abiType, abi, name)).append(',');
                for (String name : List.of("scratch1", "scratch2", "targetAddrStorage", "retBufAddrStorage", "capturedStateStorage")) entry.append(storage(field(abiType, abi, name))).append(',');
                Object arg = ((List<?>) csType.getMethod("argumentBindings", int.class).invoke(sequence, 1)).get(0);
                Object ret = ((List<?>) call(sequence, "returnBindings")).get(0);
                entry.append(storage(call(arg, "storage"))).append(',').append(storage(call(ret, "storage"))).append(')');
                entries.add(entry.toString());
            }
        }
        Files.createDirectories(output); CRC32 crc = new CRC32(); crc.update(bytes);
        ByteArrayOutputStream encoded = new ByteArrayOutputStream();
        try (DataOutputStream data = new DataOutputStream(encoded)) {
            data.writeInt(0x46464d54); data.writeInt(1); data.writeInt(major); data.writeUTF(id); data.writeInt(bytes.length); data.write(bytes);
        }
        write(output.resolve("scalar-int.bin"), encoded.toByteArray());
        StringBuilder literal = new StringBuilder();
        for (byte value : encoded.toByteArray()) {
            int unsigned = Byte.toUnsignedInt(value);
            literal.append('\\').append((char) ('0' + (unsigned >>> 6)))
                    .append((char) ('0' + ((unsigned >>> 3) & 7)))
                    .append((char) ('0' + (unsigned & 7)));
        }
        // Keep the identical source-bound, checksummed bundle. Loading the
        // generated class avoids initializing the Java module image reader.
        String inline = "static java.io.InputStream open(){String data=\"" + literal
                + "\";byte[] bytes=new byte[data.length()];for(int i=0;i<bytes.length;i++)bytes[i]=(byte)data.charAt(i);return new java.io.ByteArrayInputStream(bytes);}\n";
        String java = "package jdk.internal.foreign.abi;\nfinal class GeneratedDowncallTemplateData {\nstatic int length(){return " + bytes.length + ";}\nstatic long crc(){return " + crc.getValue() + "L;}\n" + inline + "static final DowncallTemplates.Entry[] ENTRIES={" + String.join(",", entries) + "};\n}\n";
        write(output.resolve("GeneratedDowncallTemplateData.java"), java.getBytes());
        System.out.println("FFM payload=" + hash(bytes) + " recipes=" + entries.size());
    }
    private static Map<String, String> manifest(Path root) throws Exception {
        Map<String, String> result = new TreeMap<>();
        for (Path file : files(root)) if (!file.getFileName().toString().equals("complete.properties")) result.put(root.relativize(file).toString().replace('\\', '/'), hash(file));
        return result;
    }
    private static void execute(List<String> command, Path log) throws Exception {
        Process process = new ProcessBuilder(command).redirectErrorStream(true).redirectOutput(log.toFile()).start();
        if (process.waitFor() != 0) throw new IOException("Producer command failed; see " + log);
    }
    private static void copy(Path from, Path to) throws Exception { write(to, Files.readAllBytes(from)); }
    private static void install(Path version, Path module, Path cache) throws Exception {
        // Packaging waits for this target under the normal build-owner lock.
        Path journal = cache.resolve("install-journal");
        if (Files.exists(journal)) recover(module, journal);
        Files.createDirectories(journal);
        for (String name : List.of(DATA, RESOURCE)) {
            Path target = module.resolve(name), backup = journal.resolve(name);
            if (Files.exists(target)) copy(target, backup);
        }
        write(journal.resolve("ready"), new byte[]{1});
        copy(version.resolve("metadata/" + DATA), module.resolve(DATA));
        copy(version.resolve("bundle/scalar-int.bin"), module.resolve(RESOURCE));
        delete(journal);
        write(cache.resolve("installed.properties"), encode(Map.of("version", version.getFileName().toString(), "metadata", hash(module.resolve(DATA)), "resource", hash(module.resolve(RESOURCE)))));
    }
    private static void recover(Path module, Path journal) throws Exception {
        if (Files.exists(journal.resolve("ready"))) for (String name : List.of(DATA, RESOURCE)) {
            Path backup = journal.resolve(name);
            if (Files.exists(backup)) copy(backup, module.resolve(name)); else Files.deleteIfExists(module.resolve(name));
        }
        delete(journal);
    }
    private static void delete(Path root) throws Exception {
        if (!Files.exists(root)) return;
        try (var stream = Files.walk(root)) { for (Path path : stream.sorted(Comparator.reverseOrder()).toList()) Files.delete(path); }
    }
    private static void build(String[] args) throws Exception {
        Path top = Path.of(args[1]), module = Path.of(args[2]), cache = Path.of(args[3]); String config = args[4];
        Path compiler = Path.of(args[5]), execution = Path.of(args[6]), tools = Path.of(args[7]), spec = Path.of(args[8]);
        System.out.println("FFM compiler JDK: " + compiler.toRealPath());
        System.out.println("FFM execution JDK: " + execution.toRealPath());
        Files.createDirectories(cache);
        String id = sourceId(top, config, compiler);
        Map<String, String> inputs = new TreeMap<>(); inputs.put("source", id); inputs.put("config", config); inputs.put("spec", hash(spec));
        inputs.put("compiler", hash(encode(jdkIdentity(compiler)))); inputs.put("execution", hash(encode(jdkIdentity(execution))));
        for (Path file : files(tools.resolve("build/tools/foreign"))) inputs.put("tool/" + file.getFileName(), hash(file));
        Map<String, Path> classes = new TreeMap<>();
        for (String directory : PACKAGES) for (Path file : files(module.resolve(directory))) if (file.toString().endsWith(".class")) {
            String name = module.relativize(file).toString().replace('\\', '/');
            if (!name.equals(DATA)) { inputs.put("class/" + name, hash(file)); classes.put(name, file); }
        }
        if (classes.isEmpty()) throw new IOException("Target-produced classes are missing");
        String key = hash(encode(inputs)); Path versions = cache.resolve("versions"), version = versions.resolve(key);
        Files.createDirectories(versions);
        if (Files.exists(cache.resolve("install-journal"))) recover(module, cache.resolve("install-journal"));
        if (Files.exists(version)) {
            if (!read(version.resolve("inputs.properties")).equals(inputs) || !read(version.resolve("complete.properties")).equals(manifest(version))) throw new IOException("Invalid complete FFM version " + version);
            System.out.println("FFM reuse " + key);
        } else {
            Path stage = cache.resolve("staging/" + key); Files.createDirectories(stage.getParent());
            if (Files.exists(stage)) {
                Path abandoned = cache.resolve("abandoned"); Files.createDirectories(abandoned);
                Files.move(stage, abandoned.resolve(key + "-" + System.nanoTime()));
            }
            Files.createDirectories(stage); write(stage.resolve("inputs.properties"), encode(inputs));
            Path patch = stage.resolve("producer");
            for (var entry : classes.entrySet()) copy(entry.getValue(), patch.resolve(entry.getKey()));
            Path bundle = stage.resolve("bundle");
            List<String> command = new ArrayList<>(); command.add(executable(execution, "java").toString());
            command.add("--patch-module=java.base=" + patch);
            for (String name : OPENS) command.add("--add-opens=java.base/" + name + "=ALL-UNNAMED");
            command.addAll(List.of("-cp", tools.toString(), GenerateDowncallTemplates.class.getName(), "emit", patch.toString(), bundle.toString(), id, config));
            execute(command, stage.resolve("emit.log"));
            Path metadata = stage.resolve("metadata"); Files.createDirectories(metadata);
            command = List.of(executable(execution, "javac").toString(), "--patch-module", "java.base=" + patch + File.pathSeparator + bundle,
                    "-d", metadata.toString(), bundle.resolve("GeneratedDowncallTemplateData.java").toString());
            execute(command, stage.resolve("javac.log"));
            if (!inputs.get("compiler").equals(hash(encode(jdkIdentity(compiler)))) || !inputs.get("execution").equals(hash(encode(jdkIdentity(execution))))) throw new IOException("JDK changed during FFM generation");
            write(stage.resolve("complete.properties"), encode(manifest(stage)));
            Files.move(stage, version, StandardCopyOption.ATOMIC_MOVE);
            System.out.println("FFM generate " + key + " resources=" + classes.size());
        }
        // The key was computed from current compiler/execution identities on
        // every invocation, including validated reuse and A -> B -> A.
        install(version, module, cache);
    }
    public static void main(String[] args) throws Exception {
        switch (args[0]) { case "source" -> source(args); case "emit" -> emit(args); case "build" -> build(args);
            case "identity" -> write(Path.of(args[2]), encode(jdkIdentity(Path.of(args[1]))));
            default -> throw new IllegalArgumentException(args[0]); }
    }
}
