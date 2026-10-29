/*
 * Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 5004188
 * @run main TestSerialization
 * @summary Tests current-runtime serialization and listener preservation of VetoableChangeSupport
 * @author Sergey Malenkov
 */

import java.beans.PropertyChangeEvent;
import java.beans.VetoableChangeListener;
import java.beans.VetoableChangeListenerProxy;
import java.beans.VetoableChangeSupport;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public final class TestSerialization implements VetoableChangeListener, Serializable {
    private static final String NAME = "property";

    public static void main(String[] args) throws Exception {
        VetoableChangeSupport vcs = create();
        check(vcs);
        check(deserialize(serialize(vcs)));
    }

    private static VetoableChangeSupport create() {
        VetoableChangeSupport vcs = new VetoableChangeSupport(TestSerialization.class);
        vcs.addVetoableChangeListener(new TestSerialization(0));
        vcs.addVetoableChangeListener(NAME, new TestSerialization(1));
        return vcs;
    }

    private static void check(VetoableChangeSupport vcs) {
        VetoableChangeListener[] namedListeners = vcs.getVetoableChangeListeners(NAME);
        check(namedListeners, 1);
        check(namedListeners[0], 1);

        VetoableChangeListener[] allListeners = vcs.getVetoableChangeListeners();
        check(allListeners, 2);
        check(allListeners[0], 0);
        check(allListeners[1], 1, NAME);
    }

    private static void check(VetoableChangeListener[] array, int length) {
        if (length != array.length)
            throw new Error("Unexpected amount of listeners: " + array.length);
    }

    private static void check(VetoableChangeListener listener, int index) {
        if (!(listener instanceof TestSerialization))
            throw new Error("Unexpected listener: " + listener);

        TestSerialization object = (TestSerialization)listener;
        if (index != object.index)
            throw new Error("Unexpected index: " + index + " != " + object.index);
    }

    private static void check(VetoableChangeListener listener, int index, String name) {
        if (!(listener instanceof VetoableChangeListenerProxy))
            throw new Error("Unexpected listener: " + listener);

        VetoableChangeListenerProxy object = (VetoableChangeListenerProxy)listener;
        if (!name.equals(object.getPropertyName()))
            throw new Error("Unexpected name: " + name + " != " + object.getPropertyName());

        check((VetoableChangeListener)object.getListener(), index);
    }

    private static VetoableChangeSupport deserialize(byte[] array) throws Exception {
        try (ObjectInputStream stream = new ObjectInputStream(new ByteArrayInputStream(array))) {
            return (VetoableChangeSupport)stream.readObject();
        }
    }

    private static byte[] serialize(VetoableChangeSupport vcs) throws Exception {
        ObjectOutputStream stream = null;
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            stream = new ObjectOutputStream(out);
            stream.writeObject(vcs);
            return out.toByteArray();
        }
        finally {
            if (stream != null)
                stream.close();
        }
    }


    private int index;

    public TestSerialization(int index) {
        this.index = index;
    }

    public int getIndex() {
        return this.index;
    }

    public void vetoableChange(PropertyChangeEvent event) {
    }
}
