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
 *
 */

import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.TimeUnit;

// Run an ordinary image launcher: its main native thread must not need to pump
// a CFRunLoop for the production Kerberos observer to refresh Config.
public class KerberosNotifications {
    private static native int notifyChange(String key);
    private static Method getInstance;
    private static Method getDefaultRealm;

    public static void main(String[] args) throws Exception {
        if (args[0].equals("--child")) {
            runChild(args[1]);
            return;
        }
        String library = Path.of(args[1]).toAbsolutePath().toString();
        ProcessBuilder builder = new ProcessBuilder(
                Path.of(args[0], "bin", "java").toString(), "-Xcheck:jni",
                "--enable-native-access=ALL-UNNAMED",
                "--add-modules=java.security.jgss",
                "--add-exports=java.security.jgss/sun.security.krb5=ALL-UNNAMED",
                "-cp", System.getProperty("java.class.path"),
                KerberosNotifications.class.getName(), "--child", library);
        builder.environment().put("DYLD_INSERT_LIBRARIES", library);
        Path log = Files.createTempFile("kerberos-notifications", ".log");
        try {
            Process child = builder.redirectErrorStream(true).redirectOutput(log.toFile()).start();
            boolean exited = child.waitFor(60, TimeUnit.SECONDS);
            if (!exited) {
                child.destroyForcibly();
                child.waitFor();
            }
            String output = Files.readString(log);
            System.out.print(output);
            if (!exited) throw new AssertionError("Kerberos notification child did not exit");
            if (child.exitValue() != 0) {
                throw new AssertionError("Kerberos notification child exited " + child.exitValue());
            }
            if (output.contains("WARNING in native method") ||
                    output.contains("WARNING: JNI") || output.contains("Exception in thread")) {
                throw new AssertionError("JNI diagnostic from Kerberos notification callback");
            }
        } finally {
            Files.deleteIfExists(log);
        }
    }

    @SuppressWarnings("restricted")
    private static void runChild(String library) throws Exception {
        System.load(library);
        Path file = Files.createTempFile("kerberos-notifications", ".conf");
        try {
            System.setProperty("java.security.krb5.conf", file.toString());
            System.clearProperty("java.security.krb5.realm");
            System.clearProperty("java.security.krb5.kdc");
            writeConfig(file, "FIRST.TEST");
            Class<?> configClass = Class.forName("sun.security.krb5.Config");
            getInstance = configClass.getMethod("getInstance");
            getDefaultRealm = configClass.getMethod("getDefaultRealm");
            Object first = instance();
            requireRealm(first, "FIRST.TEST");
            // A controlled file bypasses OS configuration lookup. Initialize
            // the real observer explicitly, without touching system settings.
            Class.forName("sun.security.krb5.SCDynamicStoreConfig");

            writeConfig(file, "SECOND.TEST");
            deliver("Kerberos-Default-Realms");
            Object second = requireRefresh(first, "SECOND.TEST");

            writeConfig(file, "THIRD.TEST");
            deliver("Unrelated-Configuration-Key");
            if (instance() != second) throw new AssertionError("Unrelated key refreshed Config");
            requireRealm(second, "SECOND.TEST");
            deliver("Kerberos-Domain-Realm-Mappings");
            Object third = requireRefresh(second, "THIRD.TEST");

            // Config.refresh throws when only one property is set. The native
            // callback must clear that exception and permit later delivery.
            System.setProperty("java.security.krb5.realm", "INCOMPLETE.TEST");
            deliver("Kerberos-Default-Realms");
            if (instance() != third) throw new AssertionError("Failed refresh replaced Config");
            System.clearProperty("java.security.krb5.realm");
            writeConfig(file, "FOURTH.TEST");
            deliver("Kerberos-Default-Realms");
            requireRefresh(third, "FOURTH.TEST");
            System.out.println("Kerberos notifications passed: both watched keys, unrelated key, exception recovery");
        } finally {
            Files.deleteIfExists(file);
        }
    }

    private static void writeConfig(Path file, String realm) throws Exception {
        Files.writeString(file, "[libdefaults]\n default_realm = " + realm + "\n");
    }

    private static Object instance() throws Exception {
        return getInstance.invoke(null);
    }

    private static void requireRealm(Object config, String expected) throws Exception {
        Object actual = getDefaultRealm.invoke(config);
        if (!expected.equals(actual)) {
            throw new AssertionError("Expected realm " + expected + ", got " + actual);
        }
    }

    private static Object requireRefresh(Object previous, String realm) throws Exception {
        Object current = instance();
        if (current == previous) throw new AssertionError("Notification did not refresh Config");
        requireRealm(current, realm);
        return current;
    }

    private static void deliver(String key) {
        int result = notifyChange(key);
        if (result != 2) {
            throw new AssertionError("Expected worker callback for " + key
                    + ", got " + result + " (0=no delivery, 1=main thread)");
        }
    }
}
