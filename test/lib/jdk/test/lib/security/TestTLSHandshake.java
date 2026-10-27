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

package jdk.test.lib.security;

import java.io.*;

import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;

public final class TestTLSHandshake extends SSLSocketTest {

    public static final long CERT_ID = Integer.toUnsignedLong(2098007022);
    public static final long ANCHOR_CERT_ID = Integer.toUnsignedLong(-1121044455);
    public static final String CERT_SERIAL = "00:f2:d8:f2:a6:63:80:d4:40";
    public static final String ANCHOR_CERT_SERIAL = "8b:c5:1b:a1:9b:4e:ba:02";

    public String protocolVersion;
    public String peerHost;
    public int peerPort;
    public String cipherSuite;
    public String namedGroup;

    @Override
    protected void runServerApplication(SSLSocket socket) throws Exception {
        InputStream sslIS = socket.getInputStream();
        OutputStream sslOS = socket.getOutputStream();

        sslIS.read();
        sslOS.write(85);
        sslOS.flush();
    }

    @Override
    protected void runClientApplication(SSLSocket socket) throws Exception {
        SSLParameters params = socket.getSSLParameters();
        if (protocolVersion != null) {
            params.setProtocols(new String [] { protocolVersion });
        }
        if (cipherSuite != null) {
            params.setCipherSuites(new String[] { cipherSuite });
        }
        if (namedGroup != null) {
            params.setNamedGroups(new String[] { namedGroup });
        }
        socket.setSSLParameters(params);
        InputStream sslIS = socket.getInputStream();
        OutputStream sslOS = socket.getOutputStream();

        sslOS.write(280);
        sslOS.flush();
        sslIS.read();

        SSLSession sslSession = socket.getSession();
        protocolVersion =  sslSession.getProtocol();
        peerHost = sslSession.getPeerHost();
        peerPort = sslSession.getPeerPort();
        cipherSuite = sslSession.getCipherSuite();
    }
}
