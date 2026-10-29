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

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import javax.net.ssl.SSLHandshakeException;

import sun.security.ssl.SSLCipher.SSLWriteCipher;

/**
 * {@code OutputRecord} implementation for {@code SSLEngine}.
 */
final class SSLEngineOutputRecord extends OutputRecord implements SSLRecord {

    private HandshakeFragment fragmenter;

    private volatile boolean isCloseWaiting;

    SSLEngineOutputRecord(HandshakeHash handshakeHash) {
        super(handshakeHash, SSLWriteCipher.nullTlsWriteCipher());

        this.packetSize = SSLRecord.maxRecordSize;
        this.protocolVersion = ProtocolVersion.NONE;
    }

    @Override
    public void close() throws IOException {
        recordLock.lock();
        try {
            if (!isClosed) {
                if (fragmenter != null && !fragmenter.isEmpty()) {
                    isCloseWaiting = true;
                } else {
                    super.close();
                }
            }
        } finally {
            recordLock.unlock();
        }
    }

    boolean isClosed() {
        return isClosed || isCloseWaiting;
    }

    @Override
    void encodeAlert(byte level, byte description) {
        if (isClosed()) {
            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                SSLLogger.warning("outbound has closed, ignore outbound " +
                    "alert message: " + Alert.nameOf(description));
            }
            return;
        }

        if (fragmenter == null) {
           fragmenter = new HandshakeFragment();
        }

        fragmenter.queueUpAlert(level, description);
    }

    @Override
    void encodeHandshake(byte[] source,
            int offset, int length) {
        if (isClosed()) {
            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                SSLLogger.warning("outbound has closed, ignore outbound " +
                        "handshake message",
                        ByteBuffer.wrap(source, offset, length));
            }
            return;
        }

        if (fragmenter == null) {
           fragmenter = new HandshakeFragment();
        }

        byte handshakeType = source[offset];
        if (handshakeHash.isHashable(handshakeType)) {
            handshakeHash.deliver(source, offset, length);
        }

        fragmenter.queueUpFragment(source, offset, length);
    }

    @Override
    void encodeChangeCipherSpec() {
        if (isClosed()) {
            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                SSLLogger.warning("outbound has closed, ignore outbound " +
                    "change_cipher_spec message");
            }
            return;
        }

        if (fragmenter == null) {
           fragmenter = new HandshakeFragment();
        }
        fragmenter.queueUpChangeCipherSpec();
    }

    @Override
    void disposeWriteCipher() {
        if (fragmenter == null) {
            writeCipher.dispose();
        } else {
            fragmenter.queueUpCipherDispose();
        }
    }

    @Override
    Ciphertext encode(
        ByteBuffer[] srcs, int srcsOffset, int srcsLength,
        ByteBuffer[] dsts, int dstsOffset, int dstsLength) throws IOException {

        if (isClosed) {
            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                SSLLogger.warning("outbound has closed, ignore outbound " +
                    "application data or cached messages");
            }

            return null;
        } else if (isCloseWaiting) {
            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                SSLLogger.warning("outbound has closed, ignore outbound " +
                    "application data");
            }

            srcs = null;    // use no application data.
        }

        return encode(srcs, srcsOffset, srcsLength, dsts[0]);
    }

    private Ciphertext encode(ByteBuffer[] sources, int offset, int length,
            ByteBuffer destination) throws IOException {

        if (writeCipher.authenticator.seqNumOverflow()) {
            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                SSLLogger.fine(
                    "sequence number extremely close to overflow " +
                    "(2^64-1 packets). Closing connection.");
            }

            throw new SSLHandshakeException("sequence number overflow");
        }

        // Don't process the incoming record until all the
        // buffered records get handled.
        Ciphertext ct = acquireCiphertext(destination);
        if (ct != null) {
            return ct;
        }

        if (sources == null || sources.length == 0) {
            return null;
        }

        int srcsRemains = 0;
        for (int i = offset; i < offset + length; i++) {
            srcsRemains += sources[i].remaining();
        }

        if (srcsRemains == 0) {
            return null;
        }

        int dstLim = destination.limit();
        int packetLeftSize = Math.min(maxRecordSize, packetSize);
        int fragLen;
        if (packetLeftSize > 0) {
            fragLen = writeCipher.calculateFragmentSize(
                    packetLeftSize, headerSize);

            fragLen = Math.min(fragLen, Record.maxDataSize);
        } else {
            fragLen = Record.maxDataSize;
        }

        // Calculate more impact, for example TLS 1.3 padding.
        fragLen = calculateFragmentSize(fragLen);

        int dstPos = destination.position();
        int dstContent = dstPos + headerSize +
                            writeCipher.getExplicitNonceSize();
        destination.position(dstContent);

        int remains = Math.min(fragLen, destination.remaining());
        int srcsLen = offset + length;
        for (int i = offset; (i < srcsLen) && (remains > 0); i++) {
            int amount = Math.min(sources[i].remaining(), remains);
            int srcLimit = sources[i].limit();
            sources[i].limit(sources[i].position() + amount);
            destination.put(sources[i]);
            sources[i].limit(srcLimit);         // restore the limit
            remains -= amount;
        }

        destination.limit(destination.position());
        destination.position(dstContent);

        if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.RECORD)) {
            SSLLogger.fine(
                    "WRITE: " + protocolVersion.name + " " +
                    ContentType.APPLICATION_DATA.name +
                    ", length = " + destination.remaining());
        }

        // Encrypt the fragment and wrap up a record.
        long recordSN = encrypt(writeCipher,
                ContentType.APPLICATION_DATA.id, destination,
                dstPos, dstLim, headerSize,
                protocolVersion);

        if (SSLLogger.isOn() &&
                SSLLogger.isOn(SSLLogger.Opt.RECORD_PACKET)) {
            ByteBuffer temporary = destination.duplicate();
            temporary.limit(temporary.position());
            temporary.position(dstPos);
            SSLLogger.fine("Raw write", temporary);
        }

        // remain the limit unchanged
        destination.limit(dstLim);

        return new Ciphertext(ContentType.APPLICATION_DATA.id,
                SSLHandshake.NOT_APPLICABLE.id, recordSN);
    }

    private Ciphertext acquireCiphertext(
            ByteBuffer destination) throws IOException {
        if (fragmenter != null) {
            return fragmenter.acquireCiphertext(destination);
        }

        return null;
    }

    @Override
    boolean isEmpty() {
        return (fragmenter == null) || fragmenter.isEmpty();
    }

    // buffered record fragment
    private static class RecordMemo {
        byte            contentType;
        byte            majorVersion;
        byte            minorVersion;
        SSLWriteCipher  encodeCipher;
        boolean         disposeCipher;

        byte[]          fragment;
    }

    private static class HandshakeMemo extends RecordMemo {
        byte            handshakeType;
        int             acquireOffset;
    }

    final class HandshakeFragment {
        private final LinkedList<RecordMemo> handshakeMemos =
                new LinkedList<>();

        void queueUpFragment(byte[] source,
                int offset, int length) {
            HandshakeMemo memo = new HandshakeMemo();

            memo.contentType = ContentType.HANDSHAKE.id;
            memo.majorVersion = protocolVersion.major;  // kick start version?
            memo.minorVersion = protocolVersion.minor;
            memo.encodeCipher = writeCipher;

            memo.handshakeType = source[offset];
            memo.acquireOffset = 0;
            memo.fragment = new byte[length - 4];       // 4: header size
                                                        //    1: HandshakeType
                                                        //    3: message length
            System.arraycopy(source, offset + 4, memo.fragment, 0, length - 4);

            handshakeMemos.add(memo);
        }

        void queueUpChangeCipherSpec() {
            RecordMemo memo = new RecordMemo();

            memo.contentType = ContentType.CHANGE_CIPHER_SPEC.id;
            memo.majorVersion = protocolVersion.major;
            memo.minorVersion = protocolVersion.minor;
            memo.encodeCipher = writeCipher;

            memo.fragment = new byte[1];
            memo.fragment[0] = 1;

            handshakeMemos.add(memo);
        }

        void queueUpAlert(byte level, byte description) {
            RecordMemo memo = new RecordMemo();

            memo.contentType = ContentType.ALERT.id;
            memo.majorVersion = protocolVersion.major;
            memo.minorVersion = protocolVersion.minor;
            memo.encodeCipher = writeCipher;

            memo.fragment = new byte[2];
            memo.fragment[0] = level;
            memo.fragment[1] = description;

            handshakeMemos.add(memo);
        }

        void queueUpCipherDispose() {
            RecordMemo lastMemo = handshakeMemos.peekLast();
            if (lastMemo != null) {
                lastMemo.disposeCipher = true;
            } else {
                writeCipher.dispose();
            }
        }

        Ciphertext acquireCiphertext(ByteBuffer dstBuf) throws IOException {
            if (isEmpty()) {
                return null;
            }

            RecordMemo memo = handshakeMemos.getFirst();
            HandshakeMemo hsMemo = null;
            if (memo.contentType == ContentType.HANDSHAKE.id) {
                hsMemo = (HandshakeMemo)memo;
            }

            // ChangeCipherSpec message is pretty small.  Don't worry about
            // the fragmentation of ChangeCipherSpec record.
            int fragLen;
            if (packetSize > 0) {
                fragLen = Math.min(maxRecordSize, packetSize);
                fragLen = memo.encodeCipher.calculateFragmentSize(
                        fragLen, headerSize);
            } else {
                fragLen = Record.maxDataSize;
            }

            // Calculate more impact, for example TLS 1.3 padding.
            fragLen = calculateFragmentSize(fragLen);

            int dstPos = dstBuf.position();
            int dstLim = dstBuf.limit();
            int dstContent = dstPos + headerSize +
                                    memo.encodeCipher.getExplicitNonceSize();
            dstBuf.position(dstContent);

            if (hsMemo != null) {
                int remainingFragLen = fragLen;
                while ((remainingFragLen > 0) && !handshakeMemos.isEmpty()) {
                    int memoFragLen = hsMemo.fragment.length;
                    if (hsMemo.acquireOffset == 0) {
                        // Don't fragment handshake message header
                        if (remainingFragLen <= 4) {
                            break;
                        }

                        dstBuf.put(hsMemo.handshakeType);
                        dstBuf.put((byte)((memoFragLen >> 16) & 0xFF));
                        dstBuf.put((byte)((memoFragLen >> 8) & 0xFF));
                        dstBuf.put((byte)(memoFragLen & 0xFF));

                        remainingFragLen -= 4;
                    } // Otherwise, handshake message is fragmented.

                    int chipLen = Math.min(remainingFragLen,
                            (memoFragLen - hsMemo.acquireOffset));
                    dstBuf.put(hsMemo.fragment, hsMemo.acquireOffset, chipLen);

                    hsMemo.acquireOffset += chipLen;
                    if (hsMemo.acquireOffset == memoFragLen) {
                        handshakeMemos.removeFirst();

                        // still have space for more records?
                        if ((remainingFragLen > chipLen) &&
                                 !handshakeMemos.isEmpty()) {

                            // look for the next buffered record fragment
                            RecordMemo rm = handshakeMemos.getFirst();
                            if (rm.contentType == ContentType.HANDSHAKE.id &&
                                    rm.encodeCipher == hsMemo.encodeCipher) {
                                hsMemo = (HandshakeMemo)rm;
                            } else {
                                // not of the flight, break the loop
                                break;
                            }
                        }
                    }

                    remainingFragLen -= chipLen;
                }
            } else {
                fragLen = Math.min(fragLen, memo.fragment.length);
                dstBuf.put(memo.fragment, 0, fragLen);

                handshakeMemos.removeFirst();
            }

            dstBuf.limit(dstBuf.position());
            dstBuf.position(dstContent);

            if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.RECORD)) {
                SSLLogger.fine(
                        "WRITE: " + protocolVersion.name + " " +
                        ContentType.nameOf(memo.contentType) +
                        ", length = " + dstBuf.remaining());
            }

            // Encrypt the fragment and wrap up a record.
            long recordSN = encrypt(
                    memo.encodeCipher,
                    memo.contentType, dstBuf,
                    dstPos, dstLim, headerSize,
                    ProtocolVersion.valueOf(memo.majorVersion,
                            memo.minorVersion));
            if (memo.disposeCipher) {
                memo.encodeCipher.dispose();
            }

            if (SSLLogger.isOn() &&
                    SSLLogger.isOn(SSLLogger.Opt.RECORD_PACKET)) {
                ByteBuffer temporary = dstBuf.duplicate();
                temporary.limit(temporary.position());
                temporary.position(dstPos);
                SSLLogger.fine("Raw write", temporary);
            }

            // remain the limit unchanged
            dstBuf.limit(dstLim);

            // Reset the fragmentation offset.
            try {
                if (hsMemo != null) {
                    return new Ciphertext(hsMemo.contentType,
                            hsMemo.handshakeType, recordSN);
                } else {
                    return new Ciphertext(memo.contentType,
                            SSLHandshake.NOT_APPLICABLE.id, recordSN);
                }
            } finally {
                if (isCloseWaiting && isEmpty()) {
                    close();
                }
            }
        }

        boolean isEmpty() {
            return handshakeMemos.isEmpty();
        }
    }

}
