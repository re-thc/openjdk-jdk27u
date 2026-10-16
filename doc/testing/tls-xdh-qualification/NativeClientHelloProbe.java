import java.nio.ByteBuffer;
import java.security.AlgorithmConstraints;
import java.security.AlgorithmParameters;
import java.security.CryptoPrimitive;
import java.security.Key;
import java.security.spec.NamedParameterSpec;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.SSLEngineResult;
import javax.net.ssl.SSLParameters;

// Uncompiled review draft. Each invocation performs one cold operation.
public class NativeClientHelloProbe {
    static String protocol;
    static boolean application;
    static boolean supplied;
    static int callbacks;
    static int nonnullCallbacks;
    static long callbackBodyNanos;

    static final AlgorithmConstraints CONSTRAINTS = new AlgorithmConstraints() {
        public boolean permits(Set<CryptoPrimitive> primitives, String algorithm,
                AlgorithmParameters parameters) {
            long start = System.nanoTime();
            try {
                if (!algorithm.equals("XDH")) return true;
                callbacks++;
                if (parameters == null) {
                    if (supplied) throw new AssertionError("Missing XDH parameters");
                    return true;
                }
                nonnullCallbacks++;
                if (!supplied || !parameters.getProvider().getClass().getName()
                        .equals("CustomXDHParameters$XDHProvider")) {
                    throw new AssertionError("Unexpected XDH provider");
                }
                String name = parameters.getParameterSpec(
                        NamedParameterSpec.class).getName();
                return !name.equals("X25519");
            } catch (java.security.spec.InvalidParameterSpecException e) {
                throw new AssertionError(e);
            } finally {
                // Body only: service lookup, SPI construction and init preceded entry.
                callbackBodyNanos += System.nanoTime() - start;
            }
        }
        public boolean permits(Set<CryptoPrimitive> primitives, Key key) {
            return true;
        }
        public boolean permits(Set<CryptoPrimitive> primitives, String algorithm,
                Key key, AlgorithmParameters parameters) {
            return true;
        }
    };

    static void configure(String[] args) {
        if (args.length != 3 ||
                !(args[0].equals("TLSv1.2") || args[0].equals("TLSv1.3")) ||
                !(args[1].equals("default") || args[1].equals("application")) ||
                !(args[2].equals("absent") || args[2].equals("configured"))) {
            throw new IllegalArgumentException("protocol constraints provider-profile");
        }
        protocol = args[0];
        application = args[1].equals("application");
        supplied = args[2].equals("configured");
    }

    static void validateCallbacks() {
        if (application && (callbacks == 0 ||
                (supplied ? nonnullCallbacks != callbacks : nonnullCallbacks != 0))) {
            throw new AssertionError("Unexpected constraint observations");
        }
        if (!application && callbacks != 0) throw new AssertionError(callbacks);
    }

    public static void main(String[] args) throws Exception {
        configure(args);
        long start = System.nanoTime();
        SSLContext context = SSLContext.getInstance("TLS");
        context.init(null, null, null);
        long contextEnd = System.nanoTime();
        SSLEngine engine = context.createSSLEngine();
        engine.setUseClientMode(true);
        SSLParameters parameters = engine.getSSLParameters();
        parameters.setProtocols(new String[] {protocol});
        if (application) parameters.setAlgorithmConstraints(CONSTRAINTS);
        engine.setSSLParameters(parameters);
        ByteBuffer output = ByteBuffer.allocate(
                engine.getSession().getPacketBufferSize());
        ByteBuffer input = ByteBuffer.allocate(0);
        long setupEnd = System.nanoTime();
        SSLEngineResult result = engine.wrap(input, output);
        long end = System.nanoTime();
        if (result.getStatus() != SSLEngineResult.Status.OK || output.position() == 0) {
            throw new AssertionError(result);
        }
        validateCallbacks();
        Set<Integer> groups = groups(output);
        if (groups.contains(29) == (application && supplied) || !groups.contains(30)) {
            throw new AssertionError("Unexpected supported groups: " + groups);
        }
        if (Boolean.getBoolean("pr25.functionalSmoke")) {
            System.out.println("Passed NativeClientHelloProbe " + String.join(" ", args));
            return;
        }
        System.out.printf(Locale.ROOT,
                "{\"context_setup_ns\":%d,\"engine_setup_ns\":%d,\"setup_ns\":%d,"
                + "\"first_wrap_ns\":%d,\"total_ns\":%d,\"callback_body_ns\":%d,"
                + "\"xdh_callbacks\":%d,\"nonnull_xdh_callbacks\":%d}%n",
                contextEnd-start, setupEnd-contextEnd, setupEnd-start,
                end-setupEnd, end-start, callbackBodyNanos, callbacks,
                nonnullCallbacks);
    }

    // Validation runs after the operation's end marker, within process-wall time.
    private static Set<Integer> groups(ByteBuffer output) {
        ByteBuffer b = output.duplicate().flip();
        if (Byte.toUnsignedInt(b.get()) != 22) throw new AssertionError("Not TLS handshake");
        b.getShort();
        int recordLength = Short.toUnsignedInt(b.getShort());
        if (recordLength > b.remaining() || Byte.toUnsignedInt(b.get()) != 1) {
            throw new AssertionError("Not a complete ClientHello");
        }
        b.position(b.position() + 3 + 2 + 32);
        skip(b, Byte.toUnsignedInt(b.get()));
        skip(b, Short.toUnsignedInt(b.getShort()));
        skip(b, Byte.toUnsignedInt(b.get()));
        int extensionsEnd = b.position() + 2 + Short.toUnsignedInt(b.getShort());
        while (b.position() < extensionsEnd) {
            int type = Short.toUnsignedInt(b.getShort());
            int length = Short.toUnsignedInt(b.getShort());
            if (type == 10) {
                Set<Integer> result = new HashSet<>();
                int listLength = Short.toUnsignedInt(b.getShort());
                if (listLength + 2 != length || (listLength & 1) != 0) {
                    throw new AssertionError("Bad group list");
                }
                for (int i = 0; i < listLength; i += 2) {
                    result.add(Short.toUnsignedInt(b.getShort()));
                }
                return result;
            }
            skip(b, length);
        }
        throw new AssertionError("No supported_groups");
    }

    private static void skip(ByteBuffer buffer, int size) {
        buffer.position(buffer.position() + size);
    }
}
