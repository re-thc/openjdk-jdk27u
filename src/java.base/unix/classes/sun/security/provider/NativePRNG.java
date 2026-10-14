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
import java.util.concurrent.locks.ReentrantLock;

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
 * the seed file, which is /dev/random by default.
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
public final class NativePRNG extends SecureRandomSpi {

    private static final long serialVersionUID = -6599091113397072932L;

    private static final Debug debug = Debug.getInstance("provider");

    // name of the pure random file (also used for setSeed())
    private static final String NAME_RANDOM = "/dev/random";
    // name of the pseudo random file
    private static final String NAME_URANDOM = "/dev/urandom";

    // fills b with random bytes from the OS
    // urandom selects whether this does not block, like /dev/urandom, or
    // blocks until the OS random number generator is initialized, like
    // /dev/random
    private static native void getRandomBytes(byte[] b, boolean urandom)
            throws IOException;

    // which kind of RandomIO object are we creating?
    private enum Variant {
        MIXED, BLOCKING, NONBLOCKING
    }

    // singleton instance
    private static final RandomIO INSTANCE = initIO(Variant.MIXED);

    /**
     * Get the System egd source (if defined).  We only allow "file:"
     * URLs for now. If there is a egd value, parse it.
     *
     * @return the URL or null if not available.
     */
    private static URL getEgdUrl() {
        // This will return "" if nothing was set.
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

    /**
     * Create a RandomIO object for all I/O of this Variant type.
     */
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
                    // Swallow, seedFile is still null
                }
            }

            // Try egd first.
            if ((egdFile != null) && egdFile.canRead()) {
                seedFile = egdFile;
            } else {
                // fall back to /dev/random.
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
            // Shouldn't happen!
            throw new InternalError();
        }

        // The seed comes from the OS, unless the seed file is another file.
        InputStream seedIn = null;
        String path = seedFile.getPath();
        if (!path.equals(NAME_RANDOM) && !path.equals(NAME_URANDOM)) {
            try {
                seedIn = FileInputStreamPool.getInputStream(seedFile);
            } catch (IOException e) {
                // Swallow, the seed comes from the OS
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

    // return whether the NativePRNG is available
    static boolean isAvailable() {
        return true;
    }

    // the implementation of the SecureRandom service with the algorithm name
    // of the SUN provider, or null if it is not one of this class, for
    // SunEntries.SecureRandomService
    static SecureRandomSpi newInstance(String algorithm) {
        return switch (algorithm) {
            case "NativePRNG" -> new NativePRNG(null);
            case "NativePRNGBlocking" -> new Blocking(null);
            case "NativePRNGNonBlocking" -> new NonBlocking(null);
            default -> null;
        };
    }

    // constructor, called by the JCA framework
    public NativePRNG(SecureRandomParameters params) {
        if (params != null) {
            throw new IllegalArgumentException("Unsupported params: " + params.getClass());
        }
    }

    // set the seed
    @Override
    protected void engineSetSeed(byte[] seed) {
        INSTANCE.implSetSeed(seed);
    }

    // get pseudo random bytes
    @Override
    protected void engineNextBytes(byte[] bytes) {
        INSTANCE.implNextBytes(bytes);
    }

    // get true random bytes
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
    public static final class Blocking extends SecureRandomSpi {
        private static final long serialVersionUID = -6396183145759983347L;

        private static final RandomIO INSTANCE = initIO(Variant.BLOCKING);

        // return whether this is available
        static boolean isAvailable() {
            return true;
        }

        // constructor, called by the JCA framework
        public Blocking(SecureRandomParameters params) {
            if (params != null) {
                throw new IllegalArgumentException("Unsupported params: " + params.getClass());
            }
        }

        // set the seed
        @Override
        protected void engineSetSeed(byte[] seed) {
            INSTANCE.implSetSeed(seed);
        }

        // get pseudo random bytes
        @Override
        protected void engineNextBytes(byte[] bytes) {
            INSTANCE.implNextBytes(bytes);
        }

        // get true random bytes
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
    public static final class NonBlocking extends SecureRandomSpi {
        private static final long serialVersionUID = -1102062982994105487L;

        private static final RandomIO INSTANCE = initIO(Variant.NONBLOCKING);

        // return whether this is available
        static boolean isAvailable() {
            return true;
        }

        // constructor, called by the JCA framework
        public NonBlocking(SecureRandomParameters params) {
            if (params != null) {
                throw new IllegalArgumentException("Unsupported params: " + params.getClass());
            }
        }

        // set the seed
        @Override
        protected void engineSetSeed(byte[] seed) {
            INSTANCE.implSetSeed(seed);
        }

        // get pseudo random bytes
        @Override
        protected void engineNextBytes(byte[] bytes) {
            INSTANCE.implNextBytes(bytes);
        }

        // get true random bytes
        @Override
        protected byte[] engineGenerateSeed(int numBytes) {
            return INSTANCE.implGenerateSeed(numBytes);
        }
    }

    /**
     * Nested class doing the actual work. Singleton, see INSTANCE above.
     */
    private static class RandomIO {

        // Holder for the seedFile.  Used if we ever add seed material.
        File seedFile;

        // stream for "seed" if the seed source is a file, null if it is the OS
        private final InputStream seedIn;
        private OutputStream seedOut;

        // whether the OS gives the seed and the random bytes like
        // /dev/urandom, which does not block, instead of /dev/random
        private final boolean seedUrandom, nextUrandom;

        // flag indicating if we have tried to open seedOut yet
        private boolean seedOutInitialized;

        // SHA1PRNG instance for mixing in the bytes supplied via setSeed();
        // null until setSeed() is first called
        private volatile sun.security.provider.SecureRandom mixRandom;

        // A system call per request costs more than a small request itself,
        // so small requests take their bytes from a buffer that one call
        // refills. Threads use one of several buffers, by thread id, and
        // don't wait for a buffer that another thread is using. There are
        // several buffers per processor, so that threads running at the same
        // time rarely share one. As before, the bytes in a buffer are used
        // for at most MAX_BUFFER_TIME.
        private static final int BUFFER_SIZE = 256;
        private static final int MAX_BUFFERED_REQUEST = 64;
        private static final long MAX_BUFFER_TIME = 100_000_000L; // 100 ms
        private static final int MAX_BUFFERS = 64;

        @SuppressWarnings("serial") // never serialized
        private static final class Buffer extends ReentrantLock {
            final byte[] bytes = new byte[BUFFER_SIZE];
            // number of unused bytes at the end of bytes, guarded by this
            int remaining;
            // System.nanoTime() of the last refill, guarded by this
            long refillTime;
        }

        // the buffers, a power of two of them
        private final Buffer[] buffers;

        // mutex lock for generateSeed()
        private final Object LOCK_GET_SEED = new Object();

        // mutex lock for setSeed()
        private final Object LOCK_SET_SEED = new Object();

        // constructor, called only once from initIO()
        private RandomIO(File seedFile, InputStream seedIn, boolean nextUrandom) {
            this.seedFile = seedFile;
            this.seedIn = seedIn;
            this.seedUrandom = seedFile.getPath().equals(NAME_URANDOM);
            this.nextUrandom = nextUrandom;
            int n = Math.min(4 * Runtime.getRuntime().availableProcessors(),
                    MAX_BUFFERS);
            buffers = new Buffer[Integer.highestOneBit(2 * n - 1)];
            for (int i = 0; i < buffers.length; i++) {
                buffers[i] = new Buffer();
            }
        }

        // get the SHA1PRNG for mixing
        // create and seed it from the OS if not yet created
        // called with LOCK_SET_SEED held
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

        // read data.length bytes from in
        // These are not normal files, so we need to loop the read.
        // just keep trying as long as we are making progress
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

        // get true random bytes, from the OS or by reading "seed"
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

        // supply random bytes to the OS
        // write to "seed" if possible
        // always add the seed to our mixing random
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

        // fills data with random bytes from the OS, through a buffer if
        // data is small
        private void nextRandomBytes(byte[] data) throws IOException {
            int len = data.length;
            if (len > MAX_BUFFERED_REQUEST) {
                getRandomBytes(data, nextUrandom);
                return;
            }
            // spread consecutive thread ids over the buffers
            long h = Thread.currentThread().threadId() * 0x9E3779B97F4A7C15L;
            Buffer b = buffers[(int) (h >>> 32) & (buffers.length - 1)];
            if (!b.tryLock()) {
                getRandomBytes(data, nextUrandom);
                return;
            }
            try {
                long now = System.nanoTime();
                if (b.remaining < len || now - b.refillTime > MAX_BUFFER_TIME) {
                    b.remaining = 0;
                    getRandomBytes(b.bytes, nextUrandom);
                    b.remaining = BUFFER_SIZE;
                    b.refillTime = now;
                }
                System.arraycopy(b.bytes, BUFFER_SIZE - b.remaining, data, 0, len);
                b.remaining -= len;
            } finally {
                b.unlock();
            }
        }

        // get pseudo random bytes
        // get them from the OS and, if setSeed() has been called, XOR with
        // bytes generated by the mixing SHA1PRNG
        private void implNextBytes(byte[] data) {
            try {
                sun.security.provider.SecureRandom mix = mixRandom;
                if (mix == null) {
                    nextRandomBytes(data);
                    return;
                }
                byte[] random = new byte[data.length];
                nextRandomBytes(random);
                mix.engineNextBytes(data);
                for (int i = 0; i < data.length; i++) {
                    data[i] ^= random[i];
                }
            } catch (IOException e) {
                throw new ProviderException("nextBytes() failed", e);
            }
        }
    }
}
