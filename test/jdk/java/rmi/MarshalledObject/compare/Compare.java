/*
 * Copyright (c) 1998, 2012, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 4096312
 * @summary Codebase annotations must not affect MarshalledObject.equals.
 * @author Ken Arnold
 * @run main/othervm Compare 11
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Path;
import java.rmi.MarshalledObject;
import java.rmi.server.RMIClassLoader;
import java.util.Arrays;
import java.util.Objects;

public class Compare {
    static class Node implements Serializable {
        int value;
        Node next;
    }

    private static MarshalledObject<?> made;
    private static MarshalledObject<?> read;

    public static void main(String[] args) throws Exception {
        setupObjects(Integer.parseInt(args[0]));
        if (!made.equals(read) || !read.equals(made)) {
            throw new RuntimeException("Codebase annotations affected equality");
        }
    }

    public static void compareHashCodes(String[] args) throws Exception {
        setupObjects(Integer.parseInt(args[0]));
        if (made.hashCode() != read.hashCode()) {
            throw new RuntimeException("Codebase annotations affected hashCode");
        }
    }

    static void setupObjects(int length) throws Exception {
        made = roundTrip(marshalledList(Node.class, length));
        URL classes = Path.of(System.getProperty("test.classes", ".")).toUri().toURL();
        try (URLClassLoader loader = new URLClassLoader(new URL[] {classes}, null)) {
            Class<?> annotatedNode = loader.loadClass(Node.class.getName());
            String annotation = RMIClassLoader.getClassAnnotation(annotatedNode);
            if (annotation == null || Objects.equals(annotation,
                    RMIClassLoader.getClassAnnotation(Node.class))) {
                throw new RuntimeException("Expected different class annotations");
            }
            MarshalledObject<?> annotated = marshalledList(annotatedNode, length);
            if (Arrays.equals(serialize(made), serialize(annotated))) {
                throw new RuntimeException("Expected different serialized annotations");
            }
            read = roundTrip(annotated);
        }
        checkList((Node) made.get(), length);
        checkList((Node) read.get(), length);
    }

    static MarshalledObject<?> marshalledList(Class<?> type, int length)
            throws Exception {
        Constructor<?> constructor = type.getDeclaredConstructor();
        Field value = type.getDeclaredField("value");
        Field next = type.getDeclaredField("next");
        constructor.setAccessible(true);
        value.setAccessible(true);
        next.setAccessible(true);
        Object head = null;
        for (int i = length; i > 0; i--) {
            Object node = constructor.newInstance();
            value.setInt(node, i);
            next.set(node, head);
            head = node;
        }
        return new MarshalledObject<>(head);
    }

    static MarshalledObject<?> roundTrip(MarshalledObject<?> value) throws Exception {
        try (ObjectInputStream in = new ObjectInputStream(
                new ByteArrayInputStream(serialize(value)))) {
            return (MarshalledObject<?>) in.readObject();
        }
    }

    static byte[] serialize(MarshalledObject<?> value) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(value);
        }
        return bytes.toByteArray();
    }

    static void checkList(Node node, int length) {
        for (int i = 1; i <= length; i++) {
            if (node == null || node.value != i) {
                throw new RuntimeException("Incorrect unmarshalled list at " + i);
            }
            node = node.next;
        }
        if (node != null) throw new RuntimeException("Unexpected extra node");
    }
}
