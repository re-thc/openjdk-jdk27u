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
 * @bug 4511601 7054918
 * @summary BasicPermissionCollection restores and infers its permission class
 */

import java.security.*;
import java.io.*;

public class PermClass {
    public static void main(String[] args) throws Exception {
        MyPermission mp = new MyPermission("PermClass");
        PermissionCollection original = mp.newPermissionCollection();
        original.add(mp);
        for (boolean clearPermClass : new boolean[] {false, true}) {
            PermissionCollection restored = roundTrip(original, clearPermClass);
            // Check before add(), which could otherwise repair a null permClass.
            if (!restored.implies(mp)) {
                throw new Exception("Restored collection did not recover its permission class");
            }
            RuntimePermission foreign = new RuntimePermission("PermClass");
            if (restored.implies(foreign)) {
                throw new Exception("Restored collection implies a different permission type");
            }
            try {
                restored.add(foreign);
                throw new Exception("Restored collection accepted a different permission type");
            } catch (IllegalArgumentException expected) {
            }
            MyPermission next = new MyPermission("NextPermission");
            restored.add(next);
            if (!restored.implies(next)) {
                throw new Exception("Restored collection rejected its own permission type");
            }
        }
    }

    private static PermissionCollection roundTrip(PermissionCollection value,
                                                  boolean clearPermClass) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes) {
            private PutField fields;

            @Override
            public PutField putFields() throws IOException {
                return fields = super.putFields();
            }

            @Override
            public void writeFields() throws IOException {
                if (clearPermClass) fields.put("permClass", (Object) null);
                super.writeFields();
            }
        }) {
            out.writeObject(value);
        }
        try (ObjectInputStream in = new ObjectInputStream(
                new ByteArrayInputStream(bytes.toByteArray()))) {
            return (PermissionCollection) in.readObject();
        }
    }
}

class MyPermission extends BasicPermission {
    public MyPermission(String name) {
        super(name);
    }
}
