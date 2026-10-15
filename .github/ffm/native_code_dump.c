#include <jni.h>
#include <jvmti.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* Diagnostic only: read existing NEP runtime stubs through JVMTI after the
 * untimed batches. No agent is installed during linking or execution. */
static const char *dump_prefix;
static int dump_count;
static int dump_error;
static int compiled_count;

static void JNICALL compiled(jvmtiEnv *env, jmethodID method, jint code_size,
                            const void *code_address, jint map_length,
                            const jvmtiAddrLocationMap *map, const void *compile_info) {
    (void)map_length; (void)map; (void)compile_info;
    char *name = NULL, *signature = NULL, *class_name = NULL;
    jclass klass;
    if ((*env)->GetMethodName(env, method, &name, &signature, NULL) != JVMTI_ERROR_NONE ||
        (*env)->GetMethodDeclaringClass(env, method, &klass) != JVMTI_ERROR_NONE ||
        (*env)->GetClassSignature(env, klass, &class_name, NULL) != JVMTI_ERROR_NONE) {
        dump_error = 1;
        goto cleanup;
    }
    int selected = (strcmp(class_name, "LSteady;") == 0 && strcmp(name, "callsUnbound") == 0) ||
                   (strcmp(class_name, "Ljava/lang/invoke/MethodHandle;") == 0 && strcmp(name, "linkToNative") == 0) ||
                   (strcmp(class_name, "Ljdk/internal/foreign/abi/SharedUtils;") == 0 && strcmp(name, "checkNative") == 0) ||
                   (strcmp(class_name, "Ljdk/internal/foreign/AbstractMemorySegmentImpl;") == 0 && strcmp(name, "equals") == 0);
    if (selected) {
        char path[4096];
        int index = compiled_count++;
        int n = snprintf(path, sizeof(path), "%s-compiled-%d.bin", dump_prefix, index);
        if (n < 0 || n >= (int)sizeof(path) || code_size <= 0) {
            dump_error = 1;
            goto cleanup;
        }
        FILE *file = fopen(path, "wb");
        if (!file) { dump_error = 1; goto cleanup; }
        if (fwrite(code_address, 1, (size_t)code_size, file) != (size_t)code_size) dump_error = 1;
        if (fclose(file) != 0) dump_error = 1;
        snprintf(path, sizeof(path), "%s-compiled-%d.json", dump_prefix, index);
        file = fopen(path, "w");
        if (!file) { dump_error = 1; goto cleanup; }
        if (fprintf(file, "{\"class\":\"%s\",\"method\":\"%s\",\"signature\":\"%s\",\"address\":\"0x%llx\",\"length\":%d}\n",
                    class_name, name, signature, (unsigned long long)(uintptr_t)code_address, code_size) < 0) dump_error = 1;
        if (fclose(file) != 0) dump_error = 1;
    }
cleanup:
    if (name) (*env)->Deallocate(env, (unsigned char *)name);
    if (signature) (*env)->Deallocate(env, (unsigned char *)signature);
    if (class_name) (*env)->Deallocate(env, (unsigned char *)class_name);
}

static void JNICALL generated(jvmtiEnv *env, const char *name,
                              const void *address, jint length) {
    (void)env;
    if (strcmp(name, "nep_invoker_blob") != 0) return;
    char path[4096];
    int index = dump_count++;
    int n = snprintf(path, sizeof(path), "%s-%d.bin", dump_prefix, index);
    if (n < 0 || n >= (int)sizeof(path) || length <= 0) {
        dump_error = 1;
        return;
    }
    FILE *file = fopen(path, "wb");
    if (!file) { dump_error = 1; return; }
    if (fwrite(address, 1, (size_t)length, file) != (size_t)length) dump_error = 1;
    if (fclose(file) != 0) dump_error = 1;
    snprintf(path, sizeof(path), "%s-%d.json", dump_prefix, index);
    file = fopen(path, "w");
    if (!file) { dump_error = 1; return; }
    if (fprintf(file, "{\"name\":\"nep_invoker_blob\",\"address\":\"0x%llx\",\"length\":%d}\n",
                (unsigned long long)(uintptr_t)address, length) < 0) dump_error = 1;
    if (fclose(file) != 0) dump_error = 1;
}

JNIEXPORT void JNICALL Java_NativeCodeDump_dump(JNIEnv *env, jclass cls, jstring prefix) {
    (void)cls;
    JavaVM *vm;
    jvmtiEnv *jvmti = NULL;
    jvmtiEventCallbacks callbacks;
    memset(&callbacks, 0, sizeof(callbacks));
    callbacks.DynamicCodeGenerated = generated;
    callbacks.CompiledMethodLoad = compiled;
    int error = (*env)->GetJavaVM(env, &vm);
    if (error == JNI_OK) error = (*vm)->GetEnv(vm, (void **)&jvmti, JVMTI_VERSION_1_2);
    jvmtiCapabilities capabilities;
    memset(&capabilities, 0, sizeof(capabilities));
    capabilities.can_generate_compiled_method_load_events = 1;
    if (error == JNI_OK) error = (*jvmti)->AddCapabilities(jvmti, &capabilities);
    if (error == JNI_OK) error = (*jvmti)->SetEventCallbacks(jvmti, &callbacks, sizeof(callbacks));
    if (error == JNI_OK) error = (*jvmti)->SetEventNotificationMode(jvmti, JVMTI_ENABLE,
                                                               JVMTI_EVENT_DYNAMIC_CODE_GENERATED, NULL);
    if (error == JNI_OK) error = (*jvmti)->SetEventNotificationMode(jvmti, JVMTI_ENABLE,
                                                               JVMTI_EVENT_COMPILED_METHOD_LOAD, NULL);
    if (error == JNI_OK) {
        dump_prefix = (*env)->GetStringUTFChars(env, prefix, NULL);
        if (!dump_prefix) return;
        dump_count = 0;
        dump_error = 0;
        compiled_count = 0;
        error = (*jvmti)->GenerateEvents(jvmti, JVMTI_EVENT_DYNAMIC_CODE_GENERATED);
        if (error == JNI_OK) error = (*jvmti)->GenerateEvents(jvmti, JVMTI_EVENT_COMPILED_METHOD_LOAD);
        (*env)->ReleaseStringUTFChars(env, prefix, dump_prefix);
        dump_prefix = NULL;
        if (dump_error || dump_count != 1 || compiled_count < 2) error = -1;
    }
    if (jvmti) (*jvmti)->DisposeEnvironment(jvmti);
    if (error != JNI_OK) {
        jclass exception = (*env)->FindClass(env, "java/lang/AssertionError");
        char message[128];
        snprintf(message, sizeof(message), "JVMTI native stub dump: error=%d count=%d write_error=%d",
                 error, dump_count, dump_error);
        (*env)->ThrowNew(env, exception, message);
    }
}
