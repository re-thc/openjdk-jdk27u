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
 * @summary Test that provider-configuration files with long comments and
 *          blank lines are parsed in bounded memory, along with normal files
 * @run main/othervm -Xmx32m LargeConfigFiles
 */

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.ServiceConfigurationError;
import java.util.ServiceLoader;

public class LargeConfigFiles {

    public interface Service { }
    public static class P1 implements Service { }
    public static class P2 implements Service { }
    public static class P3 implements Service { }

    // Twice the heap, so that a file that is kept in memory cannot be parsed
    private static final long SIZE = 64L << 20;

    private static final String P1 = P1.class.getName();
    private static final String P2 = P2.class.getName();
    private static final String P3 = P3.class.getName();

    private interface Content {
        void write(OutputStream out) throws IOException;
    }

    public static void main(String[] args) throws Exception {
        check("comments", out -> {
            line(out, P1);
            repeat(out, "# a comment that is repeated to fill the file\n");
            line(out, P2);
        }, P1, P2);

        check("long comment", out -> {
            write(out, P1 + " #");
            repeat(out, "x");
            write(out, "\n#");
            repeat(out, "y");
            write(out, "\r\n" + P2);
        }, P1, P2);

        check("blank lines", out -> {
            repeat(out, " \t\n\r\n\r");
            line(out, P1);
        }, P1);

        check("long blank line", out -> {
            repeat(out, " ");
            write(out, P1);
            repeat(out, "\t");
            write(out, "\n" + P2);
        }, P1, P2);

        Path file = write("long blank in name", out -> {
            write(out, P1);
            repeat(out, " ");
            write(out, "x\n");
        });
        expectError(file, ":1: Illegal configuration-file syntax");

        check("names", out -> {
            write(out, "# providers\n" + P1 + "\n\n  " + P2 + "  # second\r\n"
                       + P1 + "\r" + P3);
        }, P1, P2, P3);
        check("empty", out -> { });
        expectError(write("bad name", out -> write(out, "\n\n" + P1 + "-x\n")),
                    ":3: Illegal provider-class name: " + P1 + "-x");
        expectError(write("tab in name", out -> write(out, "\r\n" + P1 + "\tx")),
                    ":2: Illegal configuration-file syntax");
        // the content of a line is decoded as UTF-8, with replacement
        expectError(write("malformed", out -> {
                        write(out, P1 + "\n");
                        out.write(new byte[] { (byte) 0xe2, 'a', '\n' });
                    }),
                    ":2: Illegal provider-class name: �a");
    }

    private static void check(String name, Content content, String... expected)
            throws Exception {
        Path file = write(name, content);
        List<String> found;
        try (URLClassLoader loader = loader(file)) {
            found = ServiceLoader.load(Service.class, loader).stream()
                    .map(p -> p.type().getName())
                    .toList();
        }
        Files.delete(file);
        if (!found.equals(List.of(expected))) {
            throw new RuntimeException(name + ": found " + found + ", expected "
                                       + Arrays.toString(expected));
        }
        System.out.println(name + ": " + found);
    }

    private static void expectError(Path file, String expected) throws Exception {
        try (URLClassLoader loader = loader(file)) {
            ServiceLoader.load(Service.class, loader).stream().count();
            throw new RuntimeException(file + ": no error, expected " + expected);
        } catch (ServiceConfigurationError e) {
            if (!e.getMessage().endsWith(expected)) {
                throw new RuntimeException(file + ": unexpected error", e);
            }
            System.out.println(file + ": " + e.getMessage());
        }
        Files.delete(file);
    }

    private static URLClassLoader loader(Path file) throws IOException {
        URL dir = file.getParent().getParent().getParent().toUri().toURL();
        return new URLClassLoader(new URL[] { dir }, LargeConfigFiles.class.getClassLoader());
    }

    private static Path write(String name, Content content) throws IOException {
        Path file = Path.of(name.replace(' ', '-'), "META-INF", "services",
                            Service.class.getName());
        Files.createDirectories(file.getParent());
        try (OutputStream out = new BufferedOutputStream(Files.newOutputStream(file))) {
            content.write(out);
        }
        return file;
    }

    private static void write(OutputStream out, String s) throws IOException {
        out.write(s.getBytes(StandardCharsets.UTF_8));
    }

    private static void line(OutputStream out, String s) throws IOException {
        write(out, s + "\n");
    }

    private static void repeat(OutputStream out, String s) throws IOException {
        byte[] b = s.repeat(Math.max(1, 8192 / s.length())).getBytes(StandardCharsets.UTF_8);
        for (long n = 0; n < SIZE; n += b.length) {
            out.write(b);
        }
    }
}
