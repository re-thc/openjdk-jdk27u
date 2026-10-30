/*
 * Copyright (c) 2001, 2011, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 4502729 7054918
 * @summary Current empty BasicPermissionCollection roundtrip preserves its type
 */

import java.security.*;
import java.io.*;

public class SerialVersion {
    public static void main(String[] args) throws Exception {
        MyPermission mp = new MyPermission("SerialVersionTest");
        PermissionCollection original = mp.newPermissionCollection();
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(original);
        }
        PermissionCollection restored;
        try (ObjectInputStream in = new ObjectInputStream(
                new ByteArrayInputStream(bytes.toByteArray()))) {
            restored = (PermissionCollection) in.readObject();
        }
        if (restored.elements().hasMoreElements() || restored.implies(mp)) {
            throw new Exception("Restored collection is not empty");
        }
        try {
            restored.add(new RuntimePermission("SerialVersionTest"));
            throw new Exception("Restored collection accepted a different permission type");
        } catch (IllegalArgumentException expected) {
        }
        restored.add(mp);
        if (!restored.implies(mp)) {
            throw new Exception("Restored collection lost its permission type");
        }
    }
}

class MyPermission extends BasicPermission {
    public MyPermission(String name) {
        super(name);
    }
}
