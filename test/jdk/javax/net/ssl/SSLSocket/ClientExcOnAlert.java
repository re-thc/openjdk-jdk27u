/*
 * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
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

//
// Please run in othervm mode.  SunJSSE does not support dynamic system
// properties, no way to re-use system properties in samevm/agentvm mode.
//

/*
 * @test
 * @bug 8242294
 * @summary JSSE Client does not throw SSLException when an alert occurs during
 *          handshaking.
 * @run main/othervm ClientExcOnAlert TLSv1.2
 * @run main/othervm ClientExcOnAlert TLSv1.3
 */

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.util.Base64;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

public class ClientExcOnAlert {
    // This is a PKCS#12 keystore created with the following command:
    // keytool -genkeypair -alias testcert -keyalg rsa -keysize 2048
    //         -sigalg SHA256withRSA
    //         -dname "CN=Test TLS Self-Signed Cert, O=Test" -validity 36500
    //         -storetype pkcs12 -keystore p12ks.p12
    //
    // The resulting keystore was then converted to PEM for inclusion in this
    // file.
    private static int serverPort = -1;
    private static final String KEYSTORE_PASS = "password";
    private static final String KEYSTORE_PEM =
        "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";

    static final Lock lock = new ReentrantLock();
    static final Condition serverReady = lock.newCondition();

    public static void main(String[] args) throws Exception {
        Thread serverThread = new Thread(() -> {
                    try {
                        doServerSide();
                    }
                    catch (Exception exc) {
                        log("Caught exception: %s", exc);
                    }
                }
        );
        serverThread.start();

        try {
            doClientSide((args == null || args.length < 1) ? null : args[0]);
            throw new RuntimeException("Expected SSLException did not occur!");
        } catch (SSLException ssle) {
            log("Caught expected exception on client: " + ssle);
        } finally {
            serverThread.join();
        }

    }

    static void doServerSide() throws Exception {
        Thread.currentThread().setName("ServerThread");
        SSLContext sslc = SSLContext.getInstance("TLS");
        log("doServerSide start");
        KeyManagerFactory kmf = createKeyManagerFactory(KEYSTORE_PEM,
                KEYSTORE_PASS);
        sslc.init(kmf.getKeyManagers(), null, null);
        SSLServerSocketFactory ssf =
                (SSLServerSocketFactory)sslc.getServerSocketFactory();

        try (SSLServerSocket sslServerSocket =
                (SSLServerSocket)ssf.createServerSocket(0)) {
            sslServerSocket.setReuseAddress(true);
            // Set the server port and wake up the client thread who is waiting
            // for the port to be set.
            lock.lock();
            try {
                serverPort = sslServerSocket.getLocalPort();
                log("Server listening on port %d", serverPort);
                serverReady.signalAll();
                log("Server ready");
            } finally {
                lock.unlock();
            }

            // Go into the accept wait state until the client initiates the
            // TLS handshake.
            try (SSLSocket sslSocket = (SSLSocket)sslServerSocket.accept();
                    PrintWriter pw =
                        new PrintWriter(sslSocket.getOutputStream());
                    BufferedReader br = new BufferedReader(
                        new InputStreamReader(sslSocket.getInputStream()))) {
                log("Incoming connection from %s",
                        sslSocket.getRemoteSocketAddress());
                String data = br.readLine();
                log("Got mesage from client: ", data);
                pw.write("I am server\n");
                pw.close();
            }
        }
    }

    private static KeyManagerFactory createKeyManagerFactory(
            String ksPem, String ksAuth) throws IOException,
            GeneralSecurityException {
        KeyManagerFactory kmf = null;
        if (ksPem != null && ksAuth != null) {
            Base64.Decoder b64dec = Base64.getMimeDecoder();
            ByteArrayInputStream bais =
                    new ByteArrayInputStream(b64dec.decode(ksPem));
            KeyStore ks = KeyStore.getInstance("PKCS12");
            char[] ksPass = ksAuth.toCharArray();
            ks.load(bais, ksPass);

            kmf = KeyManagerFactory.getInstance("PKIX");
            kmf.init(ks, ksAuth.toCharArray());
        }

        return kmf;
    }

    static void doClientSide(String proto) throws Exception {
        Thread.currentThread().setName("ClientThread");
        log("doClientSide start");

        // Wait for the server to be ready and wake up this thread
        // so the client knows which port to communicate with
        lock.lock();
        try {
            serverReady.await();
            log("Client ready to contact port %d", serverPort);
        } finally {
            lock.unlock();
        }

        SSLSocketFactory sslsf =
                (SSLSocketFactory)SSLSocketFactory.getDefault();
        try (SSLSocket sslSocket = (SSLSocket)sslsf.createSocket(
                InetAddress.getLocalHost(), serverPort);
            BufferedReader br = new BufferedReader(
                new InputStreamReader(sslSocket.getInputStream()));
            PrintWriter pw = new PrintWriter(sslSocket.getOutputStream())) {

            if (proto != null) {
                sslSocket.setEnabledProtocols(new String[] { proto });
            }
            pw.write("I am client\n");
            pw.flush();

            String response = br.readLine();
            System.out.println("response is: " + response);
        }
    }

    private static void log(String msgFmt, Object ... args) {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("%d | %s | ",
                System.currentTimeMillis(), Thread.currentThread().getName()));
        sb.append(String.format(msgFmt, args));
        System.out.println(sb.toString());
    }
}
