/*
 * Copyright (c) 2018, 2020, Oracle and/or its affiliates. All rights reserved.
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

import java.nio.ByteBuffer;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.SSLEngineResult;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import jdk.test.lib.security.KeyStoreUtils;
import jdk.test.lib.security.SSLContextBuilder;

/*
 * @test
 * @bug 8211339 8234728
 * @summary Verify hostname returns an exception instead of null pointer when
 * creating a new engine
 * @library /test/lib
 * @run main/othervm NullHostnameCheck TLSv1.2
 * @run main/othervm NullHostnameCheck TLSv1.3
 */

public final class NullHostnameCheck {

    public static void main(String[] args) throws Exception {
        String protocol = args[0];
        String password = "123456";

        SSLContext serverCtx = SSLContextBuilder.builder()
                .keyStore(KeyStoreUtils.loadKeyStoreBase64(
                        keystoreB64, password))
                .kmfPassphrase(password)
                .protocol(protocol)
                .build();
        SSLEngine serverEngine = serverCtx.createSSLEngine("localhost", -1);
        serverEngine.setUseClientMode(false);

        SSLContext clientCtx = SSLContext.getInstance(protocol);
        clientCtx.init(null, new TrustManager[] {
                new X509TrustManager() {
                    @Override
                    public void checkClientTrusted(
                        X509Certificate[] x509Certificates, String s) {
                    }

                    @Override
                    public void checkServerTrusted(
                        X509Certificate[] x509Certificates, String s) {
                    }

                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return new X509Certificate[0];
                    }
                }
        }, null);

        SSLEngine clientEngine = clientCtx.createSSLEngine();
        clientEngine.setUseClientMode(true);

        SSLParameters sslParameters = clientEngine.getSSLParameters();
        sslParameters.setEndpointIdentificationAlgorithm("HTTPS");
        clientEngine.setSSLParameters(sslParameters);
        try {
            handshake(clientEngine, serverEngine);
            throw new Exception("Value was not null.  Unexpected.");
        } catch (SSLHandshakeException e) {
            if (e.getCause() instanceof CertificateException) {
                System.out.println("Correct Exception class thrown:\n\t" +
                        e.getMessage());
                return;
            }
            throw e;
        }
    }

    private static void handshake(SSLEngine clientEngine,
            SSLEngine serverEngine) throws SSLException{
        ByteBuffer cTOs = ByteBuffer.allocate(
                clientEngine.getSession().getPacketBufferSize());
        ByteBuffer sTOc = ByteBuffer.allocate(
                serverEngine.getSession().getPacketBufferSize());

        ByteBuffer serverAppReadBuffer = ByteBuffer.allocate(
                serverEngine.getSession().getApplicationBufferSize());
        ByteBuffer clientAppReadBuffer = ByteBuffer.allocate(
                clientEngine.getSession().getApplicationBufferSize());

        clientEngine.beginHandshake();
        serverEngine.beginHandshake();

        ByteBuffer empty = ByteBuffer.allocate(0);

        SSLEngineResult clientResult;
        SSLEngineResult serverResult;

        boolean clientHandshakeFinished = false;
        boolean serverHandshakeFinished = false;

        do {
            if (!clientHandshakeFinished) {
                clientResult = clientEngine.wrap(empty, cTOs);
                runDelegatedTasks(clientResult, clientEngine);

                if (isHandshakeFinished(clientResult)) {
                    clientHandshakeFinished = true;
                }
            }

            if (!serverHandshakeFinished) {
                serverResult = serverEngine.wrap(empty, sTOc);
                runDelegatedTasks(serverResult, serverEngine);

                if (isHandshakeFinished(serverResult)) {
                    serverHandshakeFinished = true;
                }
            }

            cTOs.flip();
            sTOc.flip();

            if (!clientHandshakeFinished) {
                clientResult = clientEngine.unwrap(sTOc, clientAppReadBuffer);

                runDelegatedTasks(clientResult, clientEngine);

                if (isHandshakeFinished(clientResult)) {
                    clientHandshakeFinished = true;
                }
            }

            if (!serverHandshakeFinished) {
                serverResult = serverEngine.unwrap(cTOs, serverAppReadBuffer);
                runDelegatedTasks(serverResult, serverEngine);

                if (isHandshakeFinished(serverResult)) {
                    serverHandshakeFinished = true;
                }
            }

            sTOc.compact();
            cTOs.compact();
        } while (!clientHandshakeFinished || !serverHandshakeFinished);
    }

    private static boolean isHandshakeFinished(SSLEngineResult result) {
        return result.getHandshakeStatus() ==
                SSLEngineResult.HandshakeStatus.FINISHED;
    }

    private static void runDelegatedTasks(SSLEngineResult result,
            SSLEngine engine) {
        if (result.getHandshakeStatus() ==
                SSLEngineResult.HandshakeStatus.NEED_TASK) {
            for (;;) {
                Runnable task = engine.getDelegatedTask();
                if (task == null) {
                    break;
                }
                task.run();
            }
        }
    }

    // Base64 of PKCS12 Keystore
    /*
     * Certificate
     * "signature algorithm": "SHA384withRSA",
     * "issuer"             : "CN=test, OU=test, O=test, L=test, ST=test, C=test",
     * "not before"         : "2019-12-05 12:43:23.000 IST",
     * "not  after"         : "2049-11-27 12:43:23.000 IST",
     * "subject"            : "CN=test, OU=test, O=test, L=test, ST=test, C=test",
     * "subject public key" : "RSA",
     */
    static final String keystoreB64 =
        "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"
        + "y3daZV4AIDAYag";
}
