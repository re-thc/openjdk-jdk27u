
#define CAT_I(a, b) a##b
#define CAT(a, b) CAT_I(a, b)
#define JVM_StringZillaCapabilities CAT(VARIANT, _capabilities)
#define JVM_RegisterStringZillaKernels CAT(VARIANT, _register)
#define StringZilla_initialize CAT(VARIANT, _initialize)
#include "StringZillaKernels.c"
#if SZ_USE_MISALIGNED_LOADS != 0 || SZ_SWAR_THRESHOLD != 24
#error Unexpected portable-load configuration
#endif
JNIEXPORT jint JNICALL JVM_StringZillaCapabilities(void) { return JVM_STRINGZILLA_SERIAL; }
JNIEXPORT void JNICALL JVM_RegisterStringZillaKernels(const void* ignored) { (void)ignored; }
__attribute__((noinline)) int CAT(VARIANT, _equal)(const char* a, const char* b, int n) {
    return serial_kernels.equal(a, b, n);
}
