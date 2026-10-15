final class NativeCodeDump {
    static {
        System.load(System.getProperty("steady.dump.library"));
    }
    static native void dump(String prefix);
}
