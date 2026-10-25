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
 * @summary Extension parsing honors registered class identity, including names shared with JDK classes
 * @modules java.base/sun.security.util java.base/sun.security.x509
 * @run main/othervm RegisteredExtension
 */

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import javax.tools.ToolProvider;

import sun.security.util.DerInputStream;
import sun.security.util.DerOutputStream;
import sun.security.util.DerValue;
import sun.security.util.ObjectIdentifier;
import sun.security.x509.BasicConstraintsExtension;
import sun.security.x509.CertificateExtensions;
import sun.security.x509.Extension;
import sun.security.x509.OIDMap;
import sun.security.x509.PKIXExtensions;

public class RegisteredExtension {
    private static final String NAME = "RegisteredConstraints";
    private static final String OID = "1.3.6.1.4.1.42.2.27.999.2";
    private static final byte[] VALUE = {0x30, 0};

    public static void main(String[] args) throws Exception {
        Path source = Path.of("registered-source");
        Path file = source.resolve("sun/security/x509/BasicConstraintsExtension.java");
        Files.createDirectories(file.getParent());
        Files.writeString(file, "package sun.security.x509;\n" + """
                public class BasicConstraintsExtension extends Extension {
                    public BasicConstraintsExtension(Boolean critical, Object value)
                            throws java.io.IOException {
                        this.extensionId = sun.security.util.ObjectIdentifier.of("%s");
                        this.critical = critical;
                        this.extensionValue = (byte[]) value;
                    }
                    public String getName() { return "%s"; }
                }
                """.formatted(OID, NAME));
        Path classes = Files.createDirectories(Path.of("registered-classes"));
        int status = ToolProvider.getSystemJavaCompiler().run(null, null, null,
                "--patch-module", "java.base=" + source,
                "-d", classes.toString(), file.toString());
        if (status != 0) throw new AssertionError("Fixture compilation failed: " + status);
        byte[] bytes = Files.readAllBytes(classes.resolve(
                "sun/security/x509/BasicConstraintsExtension.class"));
        Class<?> registered = new ClassLoader() {
            Class<?> define() { return defineClass(null, bytes, 0, bytes.length); }
        }.define();
        OIDMap.addAttribute(NAME, OID, registered);
        ObjectIdentifier oid = ObjectIdentifier.of(OID);
        if (OIDMap.getClass(oid) != registered) {
            throw new AssertionError("Registered class identity lost");
        }
        for (boolean critical : new boolean[] {false, true}) {
            check(parse(oid, critical).getExtension(NAME), registered, oid, critical);
        }
        // Resolving the class must not change direct construction of JDK extensions.
        Class<?> builtin = OIDMap.getClass(PKIXExtensions.BasicConstraints_Id);
        check(parse(PKIXExtensions.BasicConstraints_Id, true).getExtension(
                BasicConstraintsExtension.NAME), builtin, PKIXExtensions.BasicConstraints_Id, true);
    }

    private static CertificateExtensions parse(ObjectIdentifier oid, boolean critical)
            throws Exception {
        DerOutputStream fields = new DerOutputStream();
        fields.putOctetString(VALUE);
        Extension extension = new Extension(oid, critical, fields.toByteArray());
        DerOutputStream encoded = new DerOutputStream();
        extension.encode(encoded);
        DerOutputStream sequence = new DerOutputStream();
        sequence.write(DerValue.tag_Sequence, encoded);
        return new CertificateExtensions(new DerInputStream(sequence.toByteArray()));
    }

    private static void check(Extension extension, Class<?> expected,
            ObjectIdentifier oid, boolean critical) {
        if (extension == null || extension.getClass() != expected ||
                !extension.getExtensionId().equals(oid) ||
                extension.isCritical() != critical ||
                !Arrays.equals(extension.getExtensionValue(), VALUE)) {
            throw new AssertionError("Wrong registered extension: " + extension);
        }
    }
}
