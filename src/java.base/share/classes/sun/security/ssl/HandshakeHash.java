/*
 * Copyright (c) 2003, 2022, Oracle and/or its affiliates. All rights reserved.
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
import java.io.IOException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.LinkedList;
import javax.crypto.SecretKey;
import sun.security.util.MessageDigestSpi2;

final class HandshakeHash {
    private TranscriptHash transcriptHash;
    private LinkedList<byte[]> reserves;    // one handshake message per entry
    private boolean hasBeenUsed;

    HandshakeHash() {
        this.transcriptHash = new CacheOnlyHash();
        this.reserves = new LinkedList<>();
        this.hasBeenUsed = false;
    }

    // fix the negotiated protocol version and cipher suite
    void determine(ProtocolVersion protocolVersion,
            CipherSuite cipherSuite) {
        if (!(transcriptHash instanceof CacheOnlyHash coh)) {
            throw new IllegalStateException(
                    "Not expected instance of transcript hash");
        }

        if (protocolVersion.useTLS13PlusSpec()) {
            transcriptHash = new T13HandshakeHash(cipherSuite);
        } else {
            transcriptHash = new T12HandshakeHash(cipherSuite);
        }

        byte[] reserved = coh.baos.toByteArray();
        if (reserved.length != 0) {
            transcriptHash.update(reserved, 0, reserved.length);
        }
    }

    HandshakeHash copy() {
        if (transcriptHash instanceof CacheOnlyHash) {
            HandshakeHash result = new HandshakeHash();
            result.transcriptHash = ((CacheOnlyHash)transcriptHash).copy();
            result.reserves = new LinkedList<>(reserves);
            result.hasBeenUsed = hasBeenUsed;
            return result;
        } else {
            throw new IllegalStateException("Hash does not support copying");
        }
    }

    void receive(byte[] input) {
        reserves.add(Arrays.copyOf(input, input.length));
    }

    void receive(ByteBuffer input, int length) {
        if (input.hasArray()) {
            int from = input.position() + input.arrayOffset();
            int to = from + length;
            reserves.add(Arrays.copyOfRange(input.array(), from, to));
        } else {
            int inPos = input.position();
            byte[] holder = new byte[length];
            input.get(holder);
            input.position(inPos);
            reserves.add(Arrays.copyOf(holder, holder.length));
        }
    }
    void receive(ByteBuffer input) {
        receive(input, input.remaining());
    }

    // For HelloRetryRequest only! Please use this method very carefully!
    void push(byte[] input) {
        reserves.push(Arrays.copyOf(input, input.length));
    }

    // For PreSharedKey to modify the state of the PSK binder hash
    byte[] removeLastReceived() {
        return reserves.removeLast();
    }

    void deliver(byte[] input) {
        update();
        transcriptHash.update(input, 0, input.length);
    }

    void deliver(byte[] input, int offset, int length) {
        update();
        transcriptHash.update(input, offset, length);
    }

    void deliver(ByteBuffer input) {
        update();
        if (input.hasArray()) {
            transcriptHash.update(input.array(),
                    input.position() + input.arrayOffset(), input.remaining());
        } else {
            int inPos = input.position();
            byte[] holder = new byte[input.remaining()];
            input.get(holder);
            input.position(inPos);
            transcriptHash.update(holder, 0, holder.length);
        }
    }

    // Use one handshake message if it has not been used.
    void utilize() {
        if (hasBeenUsed) {
            return;
        }
        if (reserves.size() != 0) {
            byte[] holder = reserves.remove();
            transcriptHash.update(holder, 0, holder.length);
            hasBeenUsed = true;
        }
    }

    // Consume one handshake message if it has not been consumed.
    void consume() {
        if (hasBeenUsed) {
            hasBeenUsed = false;
            return;
        }
        if (reserves.size() != 0) {
            byte[] holder = reserves.remove();
            transcriptHash.update(holder, 0, holder.length);
        }
    }

    void update() {
        while (reserves.size() != 0) {
            byte[] holder = reserves.remove();
            transcriptHash.update(holder, 0, holder.length);
        }
        hasBeenUsed = false;
    }

    byte[] digest() {
        // Note that the reserve handshake message may be not a part of
        // the expected digest.
        return transcriptHash.digest();
    }

    void finish() {
        this.transcriptHash = new CacheOnlyHash();
        this.reserves = new LinkedList<>();
        this.hasBeenUsed = false;
    }

    // Optional
    byte[] archived() {
        // Note that the reserve handshake message may be not a part of
        // the expected digest.
        return transcriptHash.archived();
    }

    public boolean isHashable(byte handshakeType) {
        return handshakeType != SSLHandshake.HELLO_REQUEST.id &&
               handshakeType != SSLHandshake.HELLO_VERIFY_REQUEST.id;
    }

    interface TranscriptHash {
        void update(byte[] input, int offset, int length);
        byte[] digest();
        byte[] archived();  // optional
    }

    // For cache only.
    private static final class CacheOnlyHash implements TranscriptHash {
        private final ByteArrayOutputStream baos;

        CacheOnlyHash() {
            this.baos = new ByteArrayOutputStream();
        }

        @Override
        public void update(byte[] input, int offset, int length) {
            baos.write(input, offset, length);
        }

        @Override
        public byte[] digest() {
            throw new IllegalStateException(
                    "Not expected call to handshake hash digest");
        }

        @Override
        public byte[] archived() {
            return baos.toByteArray();
        }

        CacheOnlyHash copy() {
            CacheOnlyHash result = new CacheOnlyHash();
            try {
                baos.writeTo(result.baos);
            } catch (IOException ex) {
                throw new RuntimeException("unable to clone hash state");
            }
            return result;
        }
    }

    static final class T12HandshakeHash implements TranscriptHash {
        private final TranscriptHash transcriptHash;
        private final ByteArrayOutputStream baos;

        T12HandshakeHash(CipherSuite cipherSuite) {
            MessageDigest md;
            try {
                md = MessageDigest.getInstance(cipherSuite.hashAlg.name);
            } catch (NoSuchAlgorithmException nsae) {
                throw new RuntimeException(
                        "Hash algorithm " +
                        cipherSuite.hashAlg.name + " is not available", nsae);
            }

            if (md instanceof Cloneable) {
                transcriptHash = new CloneableHash(md);
                this.baos = new ByteArrayOutputStream();
            } else {
                transcriptHash = new NonCloneableHash(md);
                this.baos = null;
            }
        }

        @Override
        public void update(byte[] input, int offset, int length) {
            transcriptHash.update(input, offset, length);
            if (baos != null) {
                baos.write(input, offset, length);
            }
        }

        @Override
        public byte[] digest() {
            return transcriptHash.digest();
        }

        @Override
        public byte[] archived() {
            if (baos != null) {
                return baos.toByteArray();
            } else {
                return transcriptHash.archived();
            }
        }
    }

    static final class T13HandshakeHash implements TranscriptHash {
        private final TranscriptHash transcriptHash;

        T13HandshakeHash(CipherSuite cipherSuite) {
            MessageDigest md;
            try {
                md = MessageDigest.getInstance(cipherSuite.hashAlg.name);
            } catch (NoSuchAlgorithmException nsae) {
                throw new RuntimeException(
                        "Hash algorithm " +
                        cipherSuite.hashAlg.name + " is not available", nsae);
            }

            if (md instanceof Cloneable) {
                transcriptHash = new CloneableHash(md);
            } else {
                transcriptHash = new NonCloneableHash(md);
            }
        }

        @Override
        public void update(byte[] input, int offset, int length) {
            transcriptHash.update(input, offset, length);
        }

        @Override
        public byte[] digest() {
            return transcriptHash.digest();
        }

        @Override
        public byte[] archived() {
            // This method is not necessary in T13
            throw new UnsupportedOperationException(
                    "TLS 1.3 does not require archived.");
        }
    }

    static final class CloneableHash implements TranscriptHash {
        private final MessageDigest md;

        CloneableHash(MessageDigest md) {
            this.md = md;
        }

        @Override
        public void update(byte[] input, int offset, int length) {
            md.update(input, offset, length);
        }

        @Override
        public byte[] digest() {
            try {
                return ((MessageDigest)md.clone()).digest();
            } catch (CloneNotSupportedException ex) {
                // unlikely
                return new byte[0];
            }
        }

        @Override
        public byte[] archived() {
            throw new UnsupportedOperationException("Not supported yet.");
        }
    }

    static final class NonCloneableHash implements TranscriptHash {
        private final MessageDigest md;
        private final ByteArrayOutputStream baos = new ByteArrayOutputStream();

        NonCloneableHash(MessageDigest md) {
            this.md = md;
        }

        @Override
        public void update(byte[] input, int offset, int length) {
            baos.write(input, offset, length);
        }

        @Override
        public byte[] digest() {
            byte[] bytes = baos.toByteArray();
            md.reset();
            return md.digest(bytes);
        }

        @Override
        public byte[] archived() {
            return baos.toByteArray();
        }
    }
}
