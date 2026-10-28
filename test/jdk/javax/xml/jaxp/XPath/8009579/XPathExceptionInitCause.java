/*
 * Copyright (c) 2013, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8009579
 * @summary The initCause() incorrectly initialise the cause in
 * XPathException class when used with XPathException(String)
 * constructor.
 * @run main XPathExceptionInitCause
 * @author aleksej.efimov@oracle.com
 */

import javax.xml.xpath.XPathException;
import java.io.ByteArrayOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.IOException;
import java.io.InvalidClassException;


public class XPathExceptionInitCause {

    // Write a current descriptor and inject only the legacy cause field.
    static byte[] injectCause(XPathException exception) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes) {
            private PutField fields;

            @Override
            public PutField putFields() throws IOException {
                return fields = super.putFields();
            }

            @Override
            public void writeFields() throws IOException {
                fields.put("cause", new Throwable("extra cause"));
                super.writeFields();
            }
        }) {
            out.writeObject(exception);
        }
        return bytes.toByteArray();
    }

    //Serialize XPathException
    static byte [] pickleXPE(XPathException xpe) throws IOException {
        ByteArrayOutputStream bos =  new ByteArrayOutputStream();
        ObjectOutputStream xpeos = new ObjectOutputStream(bos);
        xpeos.writeObject(xpe);
        xpeos.close();
        return bos.toByteArray();
    }

    //Deserialize XPathException with byte array as serial data source
    static XPathException unpickleXPE(byte [] ser)
            throws IOException, ClassNotFoundException {
        XPathException xpe;
        ByteArrayInputStream bis = new ByteArrayInputStream(ser);
        ObjectInputStream xpeis = new ObjectInputStream(bis);
        xpe = (XPathException) xpeis.readObject();
        xpeis.close();
        return xpe;
    }

    public static void main(String[] args) throws Exception {
        Throwable cause = new Throwable("message 1");
        XPathException xpathexcep = new XPathException("message 2");

        //Test XPE initCause() method
        xpathexcep.initCause(cause);
        System.out.println("getCause() result: '" + xpathexcep.getCause()
                + "' Cause itself: '" + cause + "'");
        if (!xpathexcep.getCause().toString().equals(cause.toString())) {
            throw new Exception("Incorrect cause is set by initCause()");
        }

        //Test serialization/deserialization of initialized XPE
        byte [] xpeserial;
        XPathException xpedeser;
        xpeserial = pickleXPE(xpathexcep);
        xpedeser = unpickleXPE(xpeserial);
        System.out.println("Serialized XPE: message='" + xpathexcep.getMessage()
                + "' cause='" + xpathexcep.getCause().toString() + "'");
        System.out.println("Deserialized XPE: message='" + xpedeser.getMessage()
                + "' cause='" + xpedeser.getCause().toString()+"'");
        if(xpedeser.getCause() == null ||
                !xpedeser.getCause().toString().equals(cause.toString()) ||
                !xpedeser.getMessage().toString().equals("message 2") )
            throw new Exception("XPathException incorrectly serialized/deserialized");

        //Test serialization/deserialization of uninitialized cause in XPE
        XPathException xpeuninit = new XPathException("uninitialized cause");
        xpeserial = pickleXPE(xpeuninit);
        xpedeser = unpickleXPE(xpeserial);
        System.out.println("Serialized XPE: message='" + xpeuninit.getMessage()
                + "' cause='" + xpeuninit.getCause()+"'");
        System.out.println("Deserialized XPE: message='" + xpedeser.getMessage()
                + "' cause='" + xpedeser.getCause()+"'");
        if(xpedeser.getCause() != null ||
                !xpedeser.getMessage().toString().equals("uninitialized cause") )
            throw new Exception("XPathException incorrectly serialized/deserialized");

        // An uninitialized superclass cause is normalized from the legacy field.
        XPathException normalized = unpickleXPE(
                injectCause(new XPathException("field cause")));
        if (normalized.getCause() == null
                || !"extra cause".equals(normalized.getCause().getMessage())
                || !"field cause".equals(normalized.getMessage())) {
            throw new Exception("XPathException cause field was not normalized");
        }

        // An existing superclass cause takes precedence over the legacy field.
        XPathException initialized = new XPathException("field cause");
        initialized.initCause(new Throwable("superclass cause"));
        normalized = unpickleXPE(injectCause(initialized));
        if (normalized.getCause() == null
                || !"superclass cause".equals(normalized.getCause().getMessage())) {
            throw new Exception("XPathException replaced an initialized cause");
        }

        // A null superclass cause cannot be reinitialized from a conflicting field.
        XPathException conflicting = new XPathException("conflicting causes");
        conflicting.initCause(null);
        try {
            unpickleXPE(injectCause(conflicting));
            throw new Exception("Expected InvalidClassException but it wasn't"
                    + " observed");
        } catch(InvalidClassException e) {
            if (!"Inconsistent state: two causes".equals(e.getMessage())) {
                throw new Exception("Unexpected rejection", e);
            }
            System.out.println("Conflicting causes rejected as expected.");
        }

    }
}
