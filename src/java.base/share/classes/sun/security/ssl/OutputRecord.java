/*
 * Copyright (c) 1996, 2025, Oracle and/or its affiliates. All rights reserved.
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

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.concurrent.locks.ReentrantLock;

import jdk.internal.net.quic.QuicTLSEngine;
import sun.security.ssl.SSLCipher.SSLWriteCipher;

/**
 * {@code OutputRecord} takes care of the management of SSL/(D)TLS
 * output records, including buffering, encryption, handshake
 * messages marshal, etc.
 *
 * @author David Brownell
 */
abstract class OutputRecord
        extends ByteArrayOutputStream implements Record, Closeable {
    SSLWriteCipher              writeCipher;
    // Needed for KeyUpdate, used after Handshake.Finished
    TransportContext            tc;

    final HandshakeHash         handshakeHash;
    boolean                     firstMessage;

    // current protocol version, sent as record version
    ProtocolVersion             protocolVersion;

    // packet size
    int                         packetSize;

    // fragment size
    private int                 fragmentSize;

    // closed or not?
    volatile boolean            isClosed;

    final ReentrantLock recordLock = new ReentrantLock();

    private static final byte[] HANDSHAKE_MESSAGE_KEY_UPDATE =
        {SSLHandshake.KEY_UPDATE.id, 0x00, 0x00, 0x01, 0x00};

    OutputRecord(HandshakeHash handshakeHash, SSLWriteCipher writeCipher) {
        this.writeCipher = writeCipher;
        this.firstMessage = true;
        this.fragmentSize = Record.maxDataSize;

        this.handshakeHash = handshakeHash;

        // Please set packetSize and protocolVersion in the implementation.
    }

    void setVersion(ProtocolVersion protocolVersion) {
        recordLock.lock();
        try {
            this.protocolVersion = protocolVersion;
        } finally {
            recordLock.unlock();
        }
    }

    /*
     * Return true iff the record is empty -- to avoid doing the work
     * of sending empty records over the network.
     */
    boolean isEmpty() {
        return false;
    }

    boolean seqNumIsHuge() {
        recordLock.lock();
        try {
            return (writeCipher.authenticator != null) &&
                        writeCipher.authenticator.seqNumIsHuge();
        } finally {
            recordLock.unlock();
        }
    }

    // SSLEngine and SSLSocket
    abstract void encodeAlert(byte level, byte description) throws IOException;

    // SSLEngine and SSLSocket
    abstract void encodeHandshake(byte[] buffer,
            int offset, int length) throws IOException;

    // SSLEngine and SSLSocket
    abstract void encodeChangeCipherSpec() throws IOException;

    // SSLEngine and SSLSocket
    void disposeWriteCipher() {
        throw new UnsupportedOperationException();
    }

    // apply to SSLEngine only
    Ciphertext encode(
        ByteBuffer[] srcs, int srcsOffset, int srcsLength,
        ByteBuffer[] dsts, int dstsOffset, int dstsLength) throws IOException {

        throw new UnsupportedOperationException();
    }

    // apply to QuicEngine only
    byte[] getHandshakeMessage() {
        throw new UnsupportedOperationException();
    }

    // apply to QuicEngine only
    QuicTLSEngine.KeySpace getHandshakeMessageKeySpace() {
        throw new UnsupportedOperationException();
    }

    // apply to SSLSocket only
    void deliver(
            byte[] source, int offset, int length) throws IOException {
        throw new UnsupportedOperationException();
    }

    // apply to SSLSocket only
    void setDeliverStream(OutputStream outputStream) {
        throw new UnsupportedOperationException();
    }

    // Change write ciphers, may use change_cipher_spec record.
    void changeWriteCiphers(SSLWriteCipher writeCipher,
            boolean useChangeCipherSpec) throws IOException {
        recordLock.lock();
        try {
            if (isClosed()) {
                if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                    SSLLogger.warning("outbound has closed, ignore outbound " +
                        "change_cipher_spec message");
                }
                return;
            }

            if (useChangeCipherSpec) {
                encodeChangeCipherSpec();
            }

            /*
             * Dispose of any intermediate state in the underlying cipher.
             * For PKCS11 ciphers, this will release any attached sessions,
             * and thus make finalization faster.
             *
             * Since MAC's doFinal() is called for every SSL/TLS packet, it's
             * not necessary to do the same with MAC's.
             */
            disposeWriteCipher();

            this.writeCipher = writeCipher;
        } finally {
            recordLock.unlock();
        }
    }

    // Change write ciphers using key_update handshake message.
    void changeWriteCiphers(SSLWriteCipher writeCipher,
            byte keyUpdateRequest) throws IOException {
        recordLock.lock();
        try {
            if (isClosed()) {
                if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                    SSLLogger.warning("outbound has closed, ignore outbound " +
                        "key_update handshake message");
                }
                return;
            }

            // encode the handshake message, KeyUpdate
            byte[] hm = HANDSHAKE_MESSAGE_KEY_UPDATE.clone();
            hm[hm.length - 1] = keyUpdateRequest;
            encodeHandshake(hm, 0, hm.length);
            flush();

            // Dispose of any intermediate state in the underlying cipher.
            disposeWriteCipher();

            this.writeCipher = writeCipher;
        } finally {
            recordLock.unlock();
        }
    }

    void changePacketSize(int packetSize) {
        recordLock.lock();
        try {
            this.packetSize = packetSize;
        } finally {
            recordLock.unlock();
        }
    }

    void changeFragmentSize(int fragmentSize) {
        recordLock.lock();
        try {
            this.fragmentSize = fragmentSize;
        } finally {
            recordLock.unlock();
        }
    }

    int getMaxPacketSize() {
        recordLock.lock();
        try {
            return packetSize;
        } finally {
            recordLock.unlock();
        }
    }

    // apply to DTLS SSLEngine
    void initHandshaker() {
        // blank
    }

    // apply to DTLS SSLEngine
    void finishHandshake() {
        // blank
    }

    // apply to DTLS SSLEngine
    void launchRetransmission() {
        // blank
    }

    @Override
    public void close() throws IOException {
        recordLock.lock();
        try {
            if (isClosed) {
                return;
            }

            isClosed = true;
            writeCipher.dispose();
        } finally {
            recordLock.unlock();
        }
    }

    boolean isClosed() {
        return isClosed;
    }

    //
    // shared helpers
    //

    private static final class T13PaddingHolder {
        private static final byte[] zeros = new byte[16];
    }

    int calculateFragmentSize(int fragmentLimit) {
        if (fragmentSize > 0) {
            fragmentLimit = Math.min(fragmentLimit, fragmentSize);
        }

        if (protocolVersion.useTLS13PlusSpec()) {
            // No negative integer checking as the fragment capacity should
            // have been ensured.
            return fragmentLimit -  T13PaddingHolder.zeros.length - 1;
        }

        return fragmentLimit;
    }

    // Encrypt a fragment and wrap up a record.
    //
    // To be consistent with the spec of SSLEngine.wrap() methods, the
    // destination ByteBuffer's position is updated to reflect the amount
    // of data produced.  The limit remains the same.
    static long encrypt(
            SSLWriteCipher encCipher, byte contentType, ByteBuffer destination,
            int headerOffset, int dstLim, int headerSize,
            ProtocolVersion protocolVersion) {
        boolean isDTLS = protocolVersion.isDTLS;
        if (isDTLS) {
            if (protocolVersion.useTLS13PlusSpec()) {
                return d13Encrypt(encCipher,
                        contentType, destination, headerOffset,
                        dstLim, headerSize, protocolVersion);
            } else {
                return d10Encrypt(encCipher,
                        contentType, destination, headerOffset,
                        dstLim, headerSize, protocolVersion);
            }
        } else {
            if (protocolVersion.useTLS13PlusSpec()) {
                return t13Encrypt(encCipher,
                        contentType, destination, headerOffset,
                        dstLim, headerSize, protocolVersion);
            } else {
                return t10Encrypt(encCipher,
                        contentType, destination, headerOffset,
                        dstLim, headerSize, protocolVersion);
            }
        }
    }

    private static long d13Encrypt(
            SSLWriteCipher encCipher, byte contentType, ByteBuffer destination,
            int headerOffset, int dstLim, int headerSize,
            ProtocolVersion protocolVersion) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    private static long d10Encrypt(
            SSLWriteCipher encCipher, byte contentType, ByteBuffer destination,
            int headerOffset, int dstLim, int headerSize,
            ProtocolVersion protocolVersion) {
        byte[] sequenceNumber = encCipher.authenticator.sequenceNumber();
        encCipher.encrypt(contentType, destination);

        // Finish out the record header.
        int fragLen = destination.limit() - headerOffset - headerSize;

        destination.put(headerOffset, contentType);         // content type
        destination.put(headerOffset + 1, protocolVersion.major);
        destination.put(headerOffset + 2, protocolVersion.minor);

        // epoch and sequence_number
        destination.put(headerOffset + 3, sequenceNumber[0]);
        destination.put(headerOffset + 4, sequenceNumber[1]);
        destination.put(headerOffset + 5, sequenceNumber[2]);
        destination.put(headerOffset + 6, sequenceNumber[3]);
        destination.put(headerOffset + 7, sequenceNumber[4]);
        destination.put(headerOffset + 8, sequenceNumber[5]);
        destination.put(headerOffset + 9, sequenceNumber[6]);
        destination.put(headerOffset + 10, sequenceNumber[7]);

        // fragment length
        destination.put(headerOffset + 11, (byte)(fragLen >> 8));
        destination.put(headerOffset + 12, (byte)fragLen);

        // Update destination position to reflect the amount of data produced.
        destination.position(destination.limit());

        return Authenticator.toLong(sequenceNumber);
    }

    private static long t13Encrypt(
            SSLWriteCipher encCipher, byte contentType, ByteBuffer destination,
            int headerOffset, int dstLim, int headerSize,
            ProtocolVersion protocolVersion) {
        if (!encCipher.isNullCipher()) {
            // inner plaintext, using zero length padding.
            int endOfPt = destination.limit();
            int startOfPt = destination.position();
            destination.position(endOfPt);
            destination.limit(endOfPt + 1 + T13PaddingHolder.zeros.length);
            destination.put(contentType);
            destination.put(T13PaddingHolder.zeros);
            destination.position(startOfPt);
        }

        // use the right TLSCiphertext.opaque_type and legacy_record_version
        ProtocolVersion pv = protocolVersion;
        if (!encCipher.isNullCipher()) {
            pv = ProtocolVersion.TLS12;
            contentType = ContentType.APPLICATION_DATA.id;
        } else if (protocolVersion.useTLS13PlusSpec()) {
            pv = ProtocolVersion.TLS12;
        }

        byte[] sequenceNumber = encCipher.authenticator.sequenceNumber();
        encCipher.encrypt(contentType, destination);

        // Finish out the record header.
        int fragLen = destination.limit() - headerOffset - headerSize;
        destination.put(headerOffset, contentType);
        destination.put(headerOffset + 1, pv.major);
        destination.put(headerOffset + 2, pv.minor);

        // fragment length
        destination.put(headerOffset + 3, (byte)(fragLen >> 8));
        destination.put(headerOffset + 4, (byte)fragLen);

        // Update destination position to reflect the amount of data produced.
        destination.position(destination.limit());

        return Authenticator.toLong(sequenceNumber);
    }

    private static long t10Encrypt(
            SSLWriteCipher encCipher, byte contentType, ByteBuffer destination,
            int headerOffset, int dstLim, int headerSize,
            ProtocolVersion protocolVersion) {
        byte[] sequenceNumber = encCipher.authenticator.sequenceNumber();
        encCipher.encrypt(contentType, destination);

        // Finish out the record header.
        int fragLen = destination.limit() - headerOffset - headerSize;

        destination.put(headerOffset, contentType);         // content type
        destination.put(headerOffset + 1, protocolVersion.major);
        destination.put(headerOffset + 2, protocolVersion.minor);

        // fragment length
        destination.put(headerOffset + 3, (byte)(fragLen >> 8));
        destination.put(headerOffset + 4, (byte)fragLen);

        // Update destination position to reflect the amount of data produced.
        destination.position(destination.limit());

        return Authenticator.toLong(sequenceNumber);
    }

    // Encrypt a fragment and wrap up a record.
    //
    // Uses the internal expandable buf variable and the current
    // protocolVersion variable.
    long encrypt(
            SSLWriteCipher encCipher, byte contentType, int headerSize) {
        if (protocolVersion.useTLS13PlusSpec()) {
            return t13Encrypt(encCipher, contentType, headerSize);
        } else {
            return t10Encrypt(encCipher, contentType, headerSize);
        }
    }

    private long t13Encrypt(
            SSLWriteCipher encCipher, byte contentType, int headerSize) {
        if (!encCipher.isNullCipher()) {
            // inner plaintext
            write(contentType);
            write(T13PaddingHolder.zeros, 0, T13PaddingHolder.zeros.length);
        }

        byte[] sequenceNumber = encCipher.authenticator.sequenceNumber();
        int contentLen = count - headerSize;

        // ensure the capacity
        int requiredPacketSize =
                encCipher.calculatePacketSize(contentLen, headerSize);
        if (requiredPacketSize > buf.length) {
            byte[] newBuf = new byte[requiredPacketSize];
            System.arraycopy(buf, 0, newBuf, 0, count);
            buf = newBuf;
        }

        // use the right TLSCiphertext.opaque_type and legacy_record_version
        ProtocolVersion pv;
        if (!encCipher.isNullCipher()) {
            pv = ProtocolVersion.TLS12;
            contentType = ContentType.APPLICATION_DATA.id;
        } else {
            pv = ProtocolVersion.TLS12;
        }

        ByteBuffer destination = ByteBuffer.wrap(buf, headerSize, contentLen);
        count = headerSize + encCipher.encrypt(contentType, destination);

        // Fill out the header, write it and the message.
        int fragLen = count - headerSize;

        buf[0] = contentType;
        buf[1] = pv.major;
        buf[2] = pv.minor;
        buf[3] = (byte)((fragLen >> 8) & 0xFF);
        buf[4] = (byte)(fragLen & 0xFF);

        return Authenticator.toLong(sequenceNumber);
    }

    private long t10Encrypt(
            SSLWriteCipher encCipher, byte contentType, int headerSize) {
        byte[] sequenceNumber = encCipher.authenticator.sequenceNumber();
        int position = headerSize + writeCipher.getExplicitNonceSize();
        int contentLen = count - position;

        // ensure the capacity
        int requiredPacketSize =
                encCipher.calculatePacketSize(contentLen, headerSize);
        if (requiredPacketSize > buf.length) {
            byte[] newBuf = new byte[requiredPacketSize];
            System.arraycopy(buf, 0, newBuf, 0, count);
            buf = newBuf;
        }
        ByteBuffer destination = ByteBuffer.wrap(buf, position, contentLen);
        count = headerSize + encCipher.encrypt(contentType, destination);

        // Fill out the header, write it and the message.
        int fragLen = count - headerSize;
        buf[0] = contentType;
        buf[1] = protocolVersion.major;
        buf[2] = protocolVersion.minor;
        buf[3] = (byte)((fragLen >> 8) & 0xFF);
        buf[4] = (byte)(fragLen & 0xFF);

        return Authenticator.toLong(sequenceNumber);
    }
}
