/*
 * Copyright (c) 1996, 2022, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package sun.security.ssl;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.util.concurrent.locks.ReentrantLock;
import javax.crypto.BadPaddingException;
import sun.security.ssl.SSLCipher.SSLReadCipher;

/**
 * {@code InputRecord} takes care of the management of SSL/TLS/DTLS input
 * records, including buffering, decryption, handshake messages marshal, etc.
 *
 * @author David Brownell
 */
abstract class InputRecord implements Record, Closeable {
    SSLReadCipher       readCipher;
    // Needed for KeyUpdate, used after Handshake.Finished
    TransportContext    tc;

    final HandshakeHash handshakeHash;
    volatile boolean    isClosed;

    // fragment size
    int                 fragmentSize;

    final ReentrantLock recordLock = new ReentrantLock();

    InputRecord(HandshakeHash handshakeHash, SSLReadCipher readCipher) {
        this.readCipher = readCipher;
        this.handshakeHash = handshakeHash;
        this.isClosed = false;
        this.fragmentSize = Record.maxDataSize;
    }

    boolean seqNumIsHuge() {
        return (readCipher.authenticator != null) &&
                        readCipher.authenticator.seqNumIsHuge();
    }

    boolean isEmpty() {
        return false;
    }

    // apply to DTLS SSLEngine
    void expectingFinishFlight() {
        // blank
    }

    // apply to DTLS SSLEngine
    void finishHandshake() {
        // blank
    }

    /**
     * Prevent any more data from being read into this record,
     * and flag the record as holding no data.
     */
    @Override
    public void close() throws IOException {
        recordLock.lock();
        try {
            if (!isClosed) {
                isClosed = true;
                readCipher.dispose();
            }
        } finally {
            recordLock.unlock();
        }
    }

    boolean isClosed() {
        return isClosed;
    }

    // apply to SSLSocket and SSLEngine
    void changeReadCiphers(SSLReadCipher readCipher) {

        /*
         * Dispose of any intermediate state in the underlying cipher.
         * For PKCS11 ciphers, this will release any attached sessions,
         * and thus make finalization faster.
         *
         * Since MAC's doFinal() is called for every SSL/TLS packet, it's
         * not necessary to do the same with MAC's.
         */
        this.readCipher.dispose();

        this.readCipher = readCipher;
    }

    // change fragment size
    void changeFragmentSize(int fragmentSize) {
        this.fragmentSize = fragmentSize;
    }

    /*
     * Check if there is enough inbound data in the ByteBuffer to make
     * an inbound packet.
     *
     * @return -1 if there are not enough bytes to tell (small header),
     */
    // apply to SSLEngine only
    int bytesInCompletePacket(
        ByteBuffer[] srcs, int srcsOffset, int srcsLength) throws IOException {

        throw new UnsupportedOperationException("Not supported yet.");
    }

    // apply to SSLSocket only
    int bytesInCompletePacket() throws IOException {
        throw new UnsupportedOperationException();
    }

    // apply to SSLSocket only
    void setReceiverStream(InputStream inputStream) {
        throw new UnsupportedOperationException();
    }

    // apply to DTLS SSLEngine only
    Plaintext acquirePlaintext()
            throws IOException {
        throw new UnsupportedOperationException();
    }

    // read, decrypt and decompress the network record.
    //
    abstract Plaintext[] decode(ByteBuffer[] srcs, int srcsOffset,
            int srcsLength) throws IOException, BadPaddingException;

    // apply to SSLSocket only
    void setDeliverStream(OutputStream outputStream) {
        throw new UnsupportedOperationException();
    }

    // calculate plaintext fragment size
    //
    // apply to SSLEngine only
    int estimateFragmentSize(int packetSize) {
        throw new UnsupportedOperationException();
    }

    //
    // shared helpers
    //

    // Not apply to DTLS

    // Extract an SSL/(D)TLS record from the specified source buffers.
    static ByteBuffer extract(
            ByteBuffer[] buffers, int offset, int length, int headerSize) {

        boolean hasFullHeader = false;
        int contentLen = -1;
        for (int i = offset, j = 0;
                i < (offset + length) && j < headerSize; i++) {
            int remains = buffers[i].remaining();
            int pos = buffers[i].position();
            for (int k = 0; k < remains && j < headerSize; j++, k++) {
                byte b = buffers[i].get(pos + k);
                if (j == (headerSize - 2)) {
                    contentLen = ((b & 0xFF) << 8);
                } else if (j == (headerSize -1)) {
                    contentLen |= (b & 0xFF);
                    hasFullHeader = true;
                    break;
                }
            }
        }

        if (!hasFullHeader) {
            throw new BufferUnderflowException();
        }

        int packetLen = headerSize + contentLen;
        int remains = 0;
        for (int i = offset; i < offset + length; i++) {
            remains += buffers[i].remaining();
            if (remains >= packetLen) {
                break;
            }
        }

        if (remains < packetLen) {
            throw new BufferUnderflowException();
        }

        byte[] packet = new byte[packetLen];
        int packetOffset = 0;
        int packetSpaces = packetLen;
        for (int i = offset; i < offset + length; i++) {
            if (buffers[i].hasRemaining()) {
                int len = Math.min(packetSpaces, buffers[i].remaining());
                buffers[i].get(packet, packetOffset, len);
                packetOffset += len;
                packetSpaces -= len;
            }

            if (packetSpaces <= 0) {
                break;
            }
        }

        return ByteBuffer.wrap(packet);
    }
}
