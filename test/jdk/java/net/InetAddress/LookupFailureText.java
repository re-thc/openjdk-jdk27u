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
 * @summary Test that the message of the UnknownHostException of a name lookup that
 *          fails in the OS follows jdk.includeInExceptions, when the lookup is the
 *          first use of InetAddress
 * @run main/othervm -Djdk.includeInExceptions=hostInfo LookupFailureText expectHost
 * @run main/othervm -Djdk.includeInExceptions=hostInfoExclSocket LookupFailureText expectHost
 * @run main/othervm -Djdk.includeInExceptions=foo,hostinfo,bar LookupFailureText expectHost
 * @run main/othervm -Djdk.includeInExceptions= LookupFailureText expectNoHost
 * @run main/othervm -Djdk.includeInExceptions=jar,userInfo LookupFailureText expectNoHost
 */

import java.net.InetAddress;
import java.net.UnknownHostException;

public class LookupFailureText {

    public static void main(String[] args) throws Exception {
        boolean expectHost = args[0].equals("expectHost");

        // Invalid for the OS resolver on all platforms: a label of more than 63
        // characters. Keep this the first use of InetAddress.
        String host = "x".repeat(64) + ".invalid";
        try {
            InetAddress.getByName(host);
            throw new RuntimeException("Resolved " + host);
        } catch (UnknownHostException e) {
            String msg = e.getMessage();
            System.out.println("Message: " + msg);
            if (msg == null) {
                throw new RuntimeException("No message");
            }
            if (msg.contains(host) != expectHost) {
                throw new RuntimeException("Host name " + (expectHost ? "missing in" : "in")
                        + " the message: " + msg);
            }
        }
    }
}
