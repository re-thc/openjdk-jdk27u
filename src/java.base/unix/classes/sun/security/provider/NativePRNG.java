/*
 * Copyright (c) 2003, 2024, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.provider;

import java.io.*;
import java.net.*;
import java.security.*;

import sun.security.util.Debug;

/**
 * Native PRNG implementation for Linux/MacOS.
 * <p>
 * It obtains seed and random numbers from the random number generator of the
 * operating system through a native call: getrandom() on Linux and
 * arc4random_buf() on macOS.  This implementation respects the
 * {@code securerandom.source} Security property and {@code java.security.egd}
 * System property for obtaining seed material.  If they name a readable file
 * other than /dev/random or /dev/urandom, generateSeed() reads that file.
 * Otherwise the seed comes from the operating system as well.
 * <p>
 * The native code behaves either like /dev/urandom, which never blocks
 * (getrandom() with GRND_INSECURE), or like /dev/random, which blocks until
 * the operating system random number generator is initialized (getrandom()
 * without flags). The bytes for nextBytes() and for the seed of
 * the SHA1PRNG behave like /dev/urandom, except in the blocking algorithm,
 * where they behave like /dev/random. The seed for generateSeed() behaves like
 * the seed file, which is /dev/random by default. Where the getrandom() system
 * call is not available, for example because a seccomp filter blocks it, the
 * native code reads /dev/urandom or /dev/random instead. Each algorithm is
 * available only if it can get its random bytes and its seed.
 * <p>
 * setSeed() attempts to write to the seed file. However, this file may only be
 * writable by root in many configurations. Because we cannot just ignore bytes
 * specified via setSeed(), we keep a SHA1PRNG around in parallel. It is
 * created by the first call to setSeed().
 * <p>
 * nextBytes() gets the bytes directly from the operating system (and, once
 * setSeed() has been called, mixes them with bytes from the SHA1PRNG for the
 * reasons explained above). This means that we are generally getting entropy
 * from the operating system. This is a notable advantage over the SHA1PRNG
 * model, which acquires entropy only initially during startup although the VM
 * may be running for months.
 * <p>
 * Finally, note that we use a singleton for the actual work (RandomIO)
 * so that the SHA1PRNG and the buffers for small requests are shared.
 * However, there may be many NativePRNG instances created by the JCA
 * framework.
 *
 * @since   1.5
 * @author  Andreas Sterbenz
 */
@SuppressWarnings("serial") // Serial version compatibility is not maintained.
public final class NativePRNG extends SecureRandomSpi {

    private static final Debug debug = Debug.getInstance("provider");

    private static final String NAME_RANDOM = "/dev/random";
    private static final String NAME_URANDOM = "/dev/urandom";

    // urandom selects /dev/urandom rather than /dev/random semantics.
    private static native void getRandomBytes(byte[] b, boolean urandom)
            throws IOException;

    // Probe availability without waiting for OS RNG initialization.
    private static native boolean isAvailable0(boolean urandom);

    private enum Variant {
        MIXED, BLOCKING, NONBLOCKING
    }

    private static final RandomIO INSTANCE = initIO(Variant.MIXED);

    // Only file URLs are supported as explicit seed sources.
    private static URL getEgdUrl() {
        String egdSource = SunEntries.getSeedSource();
        URL egdUrl;

        if (egdSource.length() != 0) {
            if (debug != null) {
                debug.println("NativePRNG egdUrl: " + egdSource);
            }
            try {
                @SuppressWarnings("deprecation")
                var _unused = egdUrl = new URL(egdSource);
                if (!egdUrl.getProtocol().equalsIgnoreCase("file")) {
                    return null;
                }
            } catch (MalformedURLException e) {
                return null;
            }
        } else {
            egdUrl = null;
        }

        return egdUrl;
    }

    private static RandomIO initIO(final Variant v) {

        File seedFile;
        boolean nextUrandom;

        switch(v) {
        case MIXED:
            URL egdUrl;
            File egdFile = null;

            if ((egdUrl = getEgdUrl()) != null) {
                try {
                    egdFile = SunEntries.getDeviceFile(egdUrl);
                } catch (IOException e) {
                }
            }

            if ((egdFile != null) && egdFile.canRead()) {
                seedFile = egdFile;
            } else {
                seedFile = new File(NAME_RANDOM);
            }
            nextUrandom = true;
            break;

        case BLOCKING:
            seedFile = new File(NAME_RANDOM);
            nextUrandom = false;
            break;

        case NONBLOCKING:
            seedFile = new File(NAME_URANDOM);
            nextUrandom = true;
            break;

        default:
            throw new InternalError();
        }

        // Device names select OS RNG policies; other files supply seed bytes.
        InputStream seedIn = null;
        String path = seedFile.getPath();
        if (!path.equals(NAME_RANDOM) && !path.equals(NAME_URANDOM)) {
            try {
                seedIn = FileInputStreamPool.getInputStream(seedFile);
            } catch (IOException e) {
                // Fall back to the OS RNG if the seed file cannot be opened.
            }
        }

        if (debug != null) {
            debug.println("NativePRNG." + v +
                " seedFile: " + seedFile +
                " readSeedFile: " + (seedIn != null) +
                " nextFile: " + (nextUrandom ? NAME_URANDOM : NAME_RANDOM));
        }

        return new RandomIO(seedFile, seedIn, nextUrandom);
    }

    private static final boolean AVAILABLE = INSTANCE.isAvailable();

    static boolean isAvailable() {
        return AVAILABLE;
    }

    // Unknown algorithms use Provider.Service's generic construction path.
    static SecureRandomSpi newInstance(String algorithm) {
        return switch (algorithm) {
            case "NativePRNG" -> new NativePRNG(null);
            case "NativePRNGBlocking" -> new Blocking(null);
            case "NativePRNGNonBlocking" -> new NonBlocking(null);
            default -> null;
        };
    }

    public NativePRNG(SecureRandomParameters params) {
        if (params != null) {
            throw new IllegalArgumentException("Unsupported params: " + params.getClass());
        }
    }

    @Override
    protected void engineSetSeed(byte[] seed) {
        INSTANCE.implSetSeed(seed);
    }

    @Override
    protected void engineNextBytes(byte[] bytes) {
        INSTANCE.implNextBytes(bytes);
    }

    @Override
    protected byte[] engineGenerateSeed(int numBytes) {
        return INSTANCE.implGenerateSeed(numBytes);
    }

    /**
     * A NativePRNG-like class that gets both seed and random material from
     * the OS, and writes the seeds supplied to setSeed to /dev/random.
     *
     * Note that it does not respect the egd properties, since we have
     * no way of knowing what those qualities are.
     *
     * This is very similar to the outer NativePRNG class, minimizing any
     * breakage to the serialization of the existing implementation.
     *
     * Since Linux 5.6, /dev/random and getrandom() without flags behave the
     * same: they only block until the OS random number generator has been
     * initialized. So the native call serves this class as well.
     *
     * @since   1.8
     */
    @SuppressWarnings("serial") // Serial version compatibility is not maintained.
    public static final class Blocking extends SecureRandomSpi {
        private static final RandomIO INSTANCE = initIO(Variant.BLOCKING);

        static boolean isAvailable() {
            return INSTANCE.isAvailable();
        }

        public Blocking(SecureRandomParameters params) {
            if (params != null) {
                throw new IllegalArgumentException("Unsupported params: " + params.getClass());
            }
        }

        @Override
        protected void engineSetSeed(byte[] seed) {
            INSTANCE.implSetSeed(seed);
        }

        @Override
        protected void engineNextBytes(byte[] bytes) {
            INSTANCE.implNextBytes(bytes);
        }

        @Override
        protected byte[] engineGenerateSeed(int numBytes) {
            return INSTANCE.implGenerateSeed(numBytes);
        }
    }

    /**
     * A NativePRNG-like class that gets both seed and random material from
     * the OS, and writes the seeds supplied to setSeed to /dev/urandom.
     *
     * Note that it does not respect the egd properties, since we have
     * no way of knowing what those qualities are.
     *
     * This is very similar to the outer NativePRNG class, minimizing any
     * breakage to the serialization of the existing implementation.
     *
     * @since   1.8
     */
    @SuppressWarnings("serial") // Serial version compatibility is not maintained.
    public static final class NonBlocking extends SecureRandomSpi {
        private static final RandomIO INSTANCE = initIO(Variant.NONBLOCKING);

        static boolean isAvailable() {
            return INSTANCE.isAvailable();
        }

        public NonBlocking(SecureRandomParameters params) {
            if (params != null) {
                throw new IllegalArgumentException("Unsupported params: " + params.getClass());
            }
        }

        @Override
        protected void engineSetSeed(byte[] seed) {
            INSTANCE.implSetSeed(seed);
        }

        @Override
        protected void engineNextBytes(byte[] bytes) {
            INSTANCE.implNextBytes(bytes);
        }

        @Override
        protected byte[] engineGenerateSeed(int numBytes) {
            return INSTANCE.implGenerateSeed(numBytes);
        }
    }

    private static class RandomIO {

        File seedFile;

        // Null when seed bytes come from the OS RNG.
        private final InputStream seedIn;
        private OutputStream seedOut;

        // Independent /dev/urandom policies for seed and nextBytes output.
        private final boolean seedUrandom, nextUrandom;

        private boolean seedOutInitialized;

        // Null until setSeed() first creates the supplemental SHA1PRNG.
        private volatile sun.security.provider.SecureRandom mixRandom;

        // Share bounded buffers across threads to amortize small OS RNG requests.
        // Expire buffered bytes after MAX_BUFFER_TIME.
        private static final int BUFFER_SIZE = 256;
        private static final int MAX_BUFFERED_REQUEST = 64;
        private static final long MAX_BUFFER_TIME = 100_000_000L; // 100 ms
        private static final int MAX_BUFFERS = 64;

        private static final class Buffer {
            final byte[] bytes = new byte[BUFFER_SIZE];
            // number of unused bytes at the end of bytes, guarded by this
            int remaining;
            // System.nanoTime() of the last refill, guarded by this
            long refillTime;
        }

        // The array length must be a power of two for hash-based indexing.
        private volatile Buffer[] buffers;

        private static final int MAX_MIX_CHUNK = 4096;

        private final Object LOCK_GET_SEED = new Object();

        private final Object LOCK_SET_SEED = new Object();

        private RandomIO(File seedFile, InputStream seedIn, boolean nextUrandom) {
            this.seedFile = seedFile;
            this.seedIn = seedIn;
            this.seedUrandom = seedFile.getPath().equals(NAME_URANDOM);
            this.nextUrandom = nextUrandom;
        }

        // Registration requires both output and seed sources to be available.
        private boolean isAvailable() {
            return isAvailable0(nextUrandom)
                    && (seedIn != null || isAvailable0(seedUrandom));
        }

        private Buffer[] buffers() {
            Buffer[] bs = buffers;
            if (bs == null) {
                synchronized (this) {
                    bs = buffers;
                    if (bs == null) {
                        int n = Math.min(4 * Runtime.getRuntime().availableProcessors(),
                                MAX_BUFFERS);
                        bs = new Buffer[Integer.highestOneBit(2 * n - 1)];
                        for (int i = 0; i < bs.length; i++) {
                            bs[i] = new Buffer();
                        }
                        buffers = bs;
                    }
                }
            }
            return bs;
        }

        // Called with LOCK_SET_SEED held; seed the mixer from the OS before use.
        private sun.security.provider.SecureRandom getMixRandom() {
            sun.security.provider.SecureRandom r = mixRandom;
            if (r == null) {
                r = new sun.security.provider.SecureRandom();
                try {
                    byte[] b = new byte[20];
                    getRandomBytes(b, nextUrandom);
                    r.engineSetSeed(b);
                } catch (IOException e) {
                    throw new ProviderException("init failed", e);
                }
                mixRandom = r;
            }
            return r;
        }

        // A seed source may return fewer bytes than requested.
        private static void readFully(InputStream in, byte[] data)
                throws IOException {
            int len = data.length;
            int ofs = 0;
            while (len > 0) {
                int k = in.read(data, ofs, len);
                if (k <= 0) {
                    throw new EOFException("File(s) closed?");
                }
                ofs += k;
                len -= k;
            }
            if (len > 0) {
                throw new IOException("Could not read from file(s)");
            }
        }

        private byte[] implGenerateSeed(int numBytes) {
            try {
                byte[] b = new byte[numBytes];
                if (seedIn == null) {
                    getRandomBytes(b, seedUrandom);
                } else {
                    synchronized (LOCK_GET_SEED) {
                        readFully(seedIn, b);
                    }
                }
                return b;
            } catch (IOException e) {
                throw new ProviderException("generateSeed() failed", e);
            }
        }

        // Supplied seeds remain supplemental even if writing the seed file fails.
        private void implSetSeed(byte[] seed) {
            synchronized (LOCK_SET_SEED) {
                if (seedOutInitialized == false) {
                    seedOutInitialized = true;
                    try {
                        seedOut = new FileOutputStream(seedFile, true);
                    } catch (Exception e) {
                        seedOut = null;
                    }
                }
                if (seedOut != null) {
                    try {
                        seedOut.write(seed);
                    } catch (IOException e) {
                        // Ignored. On Mac OS X, /dev/urandom can be opened
                        // for write, but actual write is not permitted.
                    }
                }
                getMixRandom().engineSetSeed(seed);
            }
        }

        private void nextRandomBytes(byte[] data) throws IOException {
            int len = data.length;
            if (len > MAX_BUFFERED_REQUEST) {
                getRandomBytes(data, nextUrandom);
                return;
            }
            // spread consecutive thread ids over the buffers
            long h = Thread.currentThread().threadId() * 0x9E3779B97F4A7C15L;
            Buffer[] bs = buffers();
            Buffer b = bs[(int) (h >>> 32) & (bs.length - 1)];
            synchronized (b) {
                long now = System.nanoTime();
                if (b.remaining < len || now - b.refillTime > MAX_BUFFER_TIME) {
                    b.remaining = 0;
                    getRandomBytes(b.bytes, nextUrandom);
                    b.remaining = BUFFER_SIZE;
                    b.refillTime = now;
                }
                System.arraycopy(b.bytes, BUFFER_SIZE - b.remaining, data, 0, len);
                b.remaining -= len;
            }
        }

        // Mix supplemental seed state with fresh OS bytes after setSeed().
        private void implNextBytes(byte[] data) {
            try {
                sun.security.provider.SecureRandom mix = mixRandom;
                if (mix == null) {
                    nextRandomBytes(data);
                    return;
                }
                mix.engineNextBytes(data);
                // Bound temporary storage even for large requests.
                byte[] random = new byte[Math.min(data.length, MAX_MIX_CHUNK)];
                int off = 0;
                while (off < data.length) {
                    nextRandomBytes(random);
                    int n = Math.min(random.length, data.length - off);
                    for (int i = 0; i < n; i++) {
                        data[off + i] ^= random[i];
                    }
                    off += n;
                }
            } catch (IOException e) {
                throw new ProviderException("nextBytes() failed", e);
            }
        }
    }
}
