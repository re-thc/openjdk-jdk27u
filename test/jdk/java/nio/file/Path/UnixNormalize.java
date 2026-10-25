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

/* @test
 * @summary Check Unix path normalization, identity and undecodable filename bytes
 * @requires (os.family != "windows")
 * @modules java.base/sun.nio.fs:+open
 * @run main UnixNormalize
 */

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public class UnixNormalize {
    private static Constructor<?> constructor;
    private static Field pathBytes;
    private static MessageDigest digest;
    private static int checks;

    private static final byte[][] NAMES = {
        bytes("a"), bytes("b"), bytes("."), bytes(".."), bytes("..."),
        bytes("..foo"), bytes(".git"), {(byte) 0xff, (byte) 0x80}
    };

    public static void main(String[] args) throws Exception {
        Class<?> pathClass = Class.forName("sun.nio.fs.UnixPath");
        constructor = pathClass.getDeclaredConstructor(
                Class.forName("sun.nio.fs.UnixFileSystem"), byte[].class);
        constructor.setAccessible(true);
        pathBytes = pathClass.getDeclaredField("path");
        pathBytes.setAccessible(true);
        digest = MessageDigest.getInstance("SHA-256");

        for (String input : List.of("", "/", "//", "///", ".", "..", "...",
                "..foo", ".git/config", "foo/.../bar", "foo/..foo/bar",
                "/srv/app/config.yaml", "assets/css/main.css", "./", "/.",
                "/..", "/../../a", "../a/..", "a/../../b", "a/./b/../c",
                "a/b/c/../../..", "../a/../..", "a//b///", "/a//./b/..")) {
            check(raw(Path.of(input)));
        }

        // Exhaustive short component sequences, with and without a root.
        for (int length = 0; length <= 5; length++) {
            enumerate(new ArrayList<>(), length);
        }

        // Every valid non-separator filename byte, including invalid UTF-8.
        for (int value = 1; value <= 255; value++) {
            if (value != '/') {
                byte[] name = {(byte) value};
                check(compose(false, List.of(name)));
                check(compose(true, List.of(name, bytes("."), name, bytes(".."))));
            }
        }

        Random random = new Random(0x554e495850415448L);
        for (int iteration = 0; iteration < 20_000; iteration++) {
            List<byte[]> names = new ArrayList<>();
            int count = random.nextInt(25);
            for (int i = 0; i < count; i++) {
                if (random.nextInt(3) == 0) {
                    names.add(NAMES[random.nextInt(NAMES.length)]);
                } else {
                    byte[] name = new byte[1 + random.nextInt(20)];
                    for (int j = 0; j < name.length; j++) {
                        int value;
                        do {
                            value = 1 + random.nextInt(255);
                        } while (value == '/');
                        name[j] = (byte) value;
                    }
                    names.add(name);
                }
            }
            check(compose(random.nextBoolean(), names));
        }

        for (int depth : new int[] {1, 2, 31, 128, 512}) {
            List<byte[]> names = new ArrayList<>();
            for (int i = 0; i < depth; i++)
                names.add(bytes("name"));
            check(compose(false, names));
            check(compose(true, names));
            for (int i = 0; i < depth + 2; i++)
                names.add(bytes(".."));
            check(compose(false, names));
            check(compose(true, names));
        }

        // A late dot followed by cancellations must reach back into a
        // variable-length prefix and then retain only relative excess parents.
        for (int depth : new int[] {0, 1, 31, 128}) {
            List<byte[]> names = new ArrayList<>();
            for (int i = 0; i < depth; i++) {
                names.add(i % 2 == 0 ? bytes("name" + i)
                        : new byte[] {(byte) 0xff, (byte) 0x80, (byte) (i + 1)});
            }
            names.add(bytes("."));
            for (int i = 0; i < depth + 2; i++) {
                names.add(bytes("temporary"));
                names.add(bytes(".."));
                names.add(bytes("."));
                names.add(bytes(".."));
            }
            check(compose(false, names));
            check(compose(true, names));
        }

        // Cached boundaries must distinguish dot names from long ordinary
        // names, including dot-prefixed and undecodable names. Also place
        // real dot/parent names after long names to exercise the fallback.
        for (int length : new int[] {1, 2, 3, 254, 255}) {
            for (byte value : new byte[] {'.', 'x', (byte) 0xff}) {
                byte[] name = new byte[length];
                Arrays.fill(name, value);
                for (boolean absolute : new boolean[] {false, true}) {
                    check(compose(absolute, List.of(bytes("prefix"), name, bytes("tail"))));
                    check(compose(absolute, List.of(name, bytes("."))));
                    check(compose(absolute, List.of(name, bytes(".."))));
                }
            }
        }

        // Two-byte ordinary names must not be mistaken for a parent name.
        for (byte[] name : List.of(bytes(".x"), bytes("x."), new byte[] {'.', (byte) 0xff})) {
            for (boolean absolute : new boolean[] {false, true}) {
                check(compose(absolute, List.of(name)));
                check(compose(absolute, List.of(bytes("prefix"), name, bytes("tail"))));
                check(compose(absolute, List.of(name, bytes("."))));
                check(compose(absolute, List.of(name, bytes(".."))));
            }
        }

        checkRelativize("a/./b", "a/c", "../c");
        checkRelativize("a/b/..", "a/c", "c");
        checkRelativize("/..", "/a", "a");
        checkRelativize("", "./a", "./a");
        checkRelativize("../a/..", "../b", "b");
        checkRelativize("..", "a", null);
        checkRelativize("a/../..", "b", null);
        checkRelativize("a", "/a", null);
        byte[] binary = {(byte) 0xff, (byte) 0x80};
        checkRelativize(compose(false, List.of(binary, bytes("."), bytes("dir"))),
                compose(false, List.of(binary, bytes("other"))), bytes("../other"));
        checkRelativize(compose(false, List.of(bytes(".."), binary)),
                compose(false, List.of(new byte[] {(byte) 0x80}, bytes("."), bytes("x"))), null);
        checkRelativize(compose(false, List.of(bytes(".."), binary, bytes(".."))),
                compose(false, List.of(bytes(".."), binary, bytes("leaf"))),
                compose(false, List.of(binary, bytes("leaf"))));
        checkRelativize(compose(true, List.of(binary, bytes("."), bytes("dir"), bytes(".."))),
                compose(true, List.of(binary, bytes("other"))), bytes("other"));
        checkConcurrent();
        System.out.println("Normalization checks: " + checks);
        System.out.println("Outcome SHA-256: " + HexFormat.of().formatHex(digest.digest()));
    }

    private static byte[] bytes(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }

    private static Path path(byte[] input) throws Exception {
        return (Path) constructor.newInstance(FileSystems.getDefault(), input.clone());
    }

    private static byte[] raw(Path path) throws Exception {
        return (byte[]) pathBytes.get(path);
    }

    private static byte[] compose(boolean absolute, List<byte[]> names) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        if (absolute)
            out.write('/');
        for (int i = 0; i < names.size(); i++) {
            if (i != 0)
                out.write('/');
            out.writeBytes(names.get(i));
        }
        return out.toByteArray();
    }

    // Independent stack model: retain unresolved relative parents and clip
    // absolute parents at the root. Never decode filename bytes.
    private static byte[] reference(byte[] input) {
        boolean absolute = input.length != 0 && input[0] == '/';
        List<byte[]> names = new ArrayList<>();
        int begin = absolute ? 1 : 0;
        while (begin < input.length) {
            int end = begin;
            while (end < input.length && input[end] != '/')
                end++;
            byte[] name = Arrays.copyOfRange(input, begin, end);
            if (Arrays.equals(name, bytes(".."))) {
                if (!names.isEmpty() && !Arrays.equals(names.getLast(), bytes(".."))) {
                    names.removeLast();
                } else if (!absolute) {
                    names.add(name);
                }
            } else if (!Arrays.equals(name, bytes("."))) {
                names.add(name);
            }
            begin = end + 1;
        }
        return compose(absolute, names);
    }

    private static void enumerate(List<byte[]> names, int remaining) throws Exception {
        if (remaining == 0) {
            check(compose(false, names));
            check(compose(true, names));
            return;
        }
        for (byte[] name : NAMES) {
            names.add(name);
            enumerate(names, remaining - 1);
            names.removeLast();
        }
    }

    private static void verify(Path input, byte[] expected) throws Exception {
        byte[] before = raw(input).clone();
        Path result = input.normalize();
        if (!Arrays.equals(raw(result), expected)
                || !Arrays.equals(raw(input), before)
                || (result == input) != Arrays.equals(before, expected)
                || result.normalize() != result) {
            throw new AssertionError("normalize: " + HexFormat.of().formatHex(before)
                    + ", expected " + HexFormat.of().formatHex(expected)
                    + ", actual " + HexFormat.of().formatHex(raw(result)));
        }
        int expectedCount = expected.length == 0 ? 1 : 0;
        for (int i = 0; i < expected.length; i++) {
            if (expected[i] != '/' && (i == 0 || expected[i - 1] == '/'))
                expectedCount++;
        }
        // Read names before the count so a fresh clean path exercises lazy
        // offset initialization through getName, including the empty name.
        if (expected.length == 0) {
            if (raw(result.getName(0)).length != 0)
                throw new AssertionError("Incorrect empty name");
        } else {
            int name = 0;
            int begin = expected[0] == '/' ? 1 : 0;
            while (begin < expected.length) {
                int end = begin;
                while (end < expected.length && expected[end] != '/')
                    end++;
                if (!Arrays.equals(raw(result.getName(name++)), Arrays.copyOfRange(expected, begin, end)))
                    throw new AssertionError("Incorrect normalized name bytes");
                begin = end + 1;
            }
        }
        if (result.getNameCount() != expectedCount)
            throw new AssertionError("Incorrect normalized name count");
    }

    private static void check(byte[] input) throws Exception {
        byte[] expected = reference(input);
        for (boolean warm : new boolean[] {false, true}) {
            Path path = path(input);
            if (warm)
                path.getNameCount();
            verify(path, expected);
            digest.update(input);
            digest.update((byte) 0);
            digest.update(raw(path.normalize()));
            digest.update((byte) (path.normalize() == path ? 1 : 0));
            checks++;
        }
    }

    private static void checkRelativize(String base, String other, String expected) {
        try {
            Path result = Path.of(base).relativize(Path.of(other));
            if (expected == null || !result.equals(Path.of(expected)))
                throw new AssertionError(base + " relativize " + other + ": " + result);
        } catch (IllegalArgumentException e) {
            if (expected != null)
                throw e;
        }
    }

    private static void checkRelativize(byte[] base, byte[] other, byte[] expected) throws Exception {
        try {
            Path result = path(base).relativize(path(other));
            if (expected == null || !Arrays.equals(raw(result), expected))
                throw new AssertionError("Incorrect raw-byte relativize result");
        } catch (IllegalArgumentException e) {
            if (expected != null)
                throw e;
        }
    }

    private static void checkConcurrent() throws Exception {
        List<Path> paths = new ArrayList<>();
        List<byte[]> expected = new ArrayList<>();
        for (String input : List.of("", "/", "a/b/c", ".git/config", "foo/.../bar",
                "a/./b/../c", "../../a/..", "/../../a/../b",
                "x".repeat(255), "x".repeat(255) + "/.")) {
            Path path = path(bytes(input));
            paths.add(path);
            expected.add(reference(raw(path)));
        }
        try (var pool = Executors.newFixedThreadPool(4)) {
            CyclicBarrier barrier = new CyclicBarrier(4);
            List<Future<?>> futures = new ArrayList<>();
            for (int thread = 0; thread < 4; thread++) {
                futures.add(pool.submit(() -> {
                    for (int iteration = 0; iteration < 1_000; iteration++) {
                        for (int i = 0; i < paths.size(); i++) {
                            if (iteration == 0)
                                barrier.await(10, TimeUnit.SECONDS);
                            verify(paths.get(i), expected.get(i));
                            paths.get(i).getNameCount();
                        }
                    }
                    return null;
                }));
            }
            for (Future<?> future : futures)
                future.get();
        }
    }
}
