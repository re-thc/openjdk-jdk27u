#include <stddef.h>
#include "jni.h"
void JNU_ThrowIllegalArgumentException(JNIEnv *, const char *);
void JNU_ThrowIOException(JNIEnv *, const char *);
void JNU_ThrowIOExceptionWithLastError(JNIEnv *, const char *);
