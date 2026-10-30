/*
 * Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 6857903
 * @summary The initCause() incorrectly initialize the cause in
 * SAXException class when used with SAXException(String)
 * constructor.
 * @run junit/othervm sax.SAXExceptionInitCause
 * @author aleksej.efimov@oracle.com
 */

package sax;

import org.junit.jupiter.api.Test;
import org.xml.sax.SAXException;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InvalidClassException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class SAXExceptionInitCause {

    @Test
    public void testOwnSerializationNoCause() throws Exception {
        SAXException noCauseException = new SAXException(SAX_MESSAGE);
        SAXException deserializedException;
        byte[] serialSAX;

        serialSAX = pickleException(noCauseException);
        deserializedException = unpickleException(serialSAX);

        assertNull(deserializedException.getCause());
        assertNull(deserializedException.getException());
        assertEquals(SAX_MESSAGE, deserializedException.getMessage());
    }

    @Test
    public void testSerializationWithCause() throws Exception {
        SAXException withCauseException = new SAXException(SAX_MESSAGE);
        withCauseException.initCause(new Exception(SAX_CAUSE_MESSAGE));
        SAXException deserializedException;
        byte[] serialSAX;

        serialSAX = pickleException(withCauseException);
        deserializedException = unpickleException(serialSAX);

        assertNotNull(deserializedException.getCause());
        assertEquals(SAX_MESSAGE, deserializedException.getMessage());
        assertEquals(SAX_CAUSE_MESSAGE, deserializedException.getCause().getMessage());
    }

    @Test
    public void testCauseInitByCtor() {
        // Check that constructor properly initializes cause
        Exception cause = new Exception(SAX_CAUSE_MESSAGE);
        SAXException exception = new SAXException(cause);
        assertSame(cause, exception.getCause());
        assertSame(cause, exception.getException());
    }

    @Test
    public void testCauseInitWithException() {
        // Check that initCause properly initializes cause
        SAXException exception = new SAXException();
        Exception cause = new Exception(SAX_CAUSE_MESSAGE);
        exception.initCause(cause);
        assertSame(cause, exception.getCause());
        assertSame(cause, exception.getException());
    }

    @Test
    public void testCauseInitWithThrowable() {
        // Check that if cause is initialized with Throwable instead of Exception
        // then getException returns 'null'
        SAXException exception = new SAXException();
        Throwable cause = new Throwable(SAX_CAUSE_MESSAGE);
        exception.initCause(cause);
        assertSame(cause, exception.getCause());
        assertNull(exception.getException());
    }

    @Test
    public void testInitCauseTwice() {
        SAXException exception = new SAXException(new Exception(SAX_CAUSE_MESSAGE));
        assertThrows(
                IllegalStateException.class,
                () -> exception.initCause(new Exception(SAX_CAUSE_MESSAGE)));
    }

    @Test
    public void testReadObjectLegacyException() throws Exception {
        SAXException restored = unpickleException(
                injectException(new SAXException(SAX_MESSAGE)));
        assertNotNull(restored.getCause());
        assertSame(restored.getCause(), restored.getException());
        assertEquals(SAX_CAUSE_MESSAGE, restored.getCause().getMessage());
        assertEquals(SAX_MESSAGE, restored.getMessage());
    }

    @Test
    public void testReadObjectPrefersSuperCause() throws Exception {
        SAXException original = new SAXException(SAX_MESSAGE);
        original.initCause(new Exception("superclass cause"));
        SAXException restored = unpickleException(injectException(original));
        assertSame(restored.getCause(), restored.getException());
        assertEquals("superclass cause", restored.getCause().getMessage());
        assertEquals(SAX_MESSAGE, restored.getMessage());
    }

    @Test
    public void testReadObjectIllegalStateException() {
        SAXException original = new SAXException(SAX_MESSAGE);
        original.initCause(null);
        InvalidClassException exception = assertThrows(
                InvalidClassException.class,
                () -> unpickleException(injectException(original)));
        assertEquals("Inconsistent state: two causes", exception.getMessage());
    }

    // Preserve current descriptors and inject only the legacy exception field.
    private static byte[] injectException(SAXException exception) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes) {
            private PutField fields;

            @Override
            public PutField putFields() throws IOException {
                return fields = super.putFields();
            }

            @Override
            public void writeFields() throws IOException {
                fields.put("exception", new Exception(SAX_CAUSE_MESSAGE));
                super.writeFields();
            }
        }) {
            out.writeObject(exception);
        }
        return bytes.toByteArray();
    }

    // Serialize SAXException to byte array
    private static byte[] pickleException(SAXException saxException) throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try (ObjectOutputStream saxExceptionOOS = new ObjectOutputStream(bos)) {
            saxExceptionOOS.writeObject(saxException);
        }
        return bos.toByteArray();
    }

    //Deserialize SAXException with byte array as serial data source
    private static SAXException unpickleException(byte[] ser)
            throws IOException, ClassNotFoundException {
        SAXException saxException;
        ByteArrayInputStream bis = new ByteArrayInputStream(ser);
        try (ObjectInputStream saxExceptionOIS = new ObjectInputStream(bis)) {
            saxException = (SAXException) saxExceptionOIS.readObject();
        }
        return saxException;
    }

    private static final String SAX_MESSAGE = "SAXException message";
    private static final String SAX_CAUSE_MESSAGE = "SAXException cause message";

}
