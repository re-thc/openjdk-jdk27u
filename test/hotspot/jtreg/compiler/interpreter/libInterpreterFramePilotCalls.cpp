/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#include <jni.h>
#include <jvmti.h>

static jvmtiEnv* jvmti=nullptr;
extern "C" {
JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm,char*,void*) {
  if(vm->GetEnv((void**)&jvmti,JVMTI_VERSION_1_2)!=JNI_OK)return JNI_ERR;
  jvmtiCapabilities capabilities={};capabilities.can_redefine_classes=1;
  return jvmti->AddCapabilities(&capabilities)==JVMTI_ERROR_NONE?JNI_OK:JNI_ERR;
}
JNIEXPORT void JNICALL Java_InterpreterFramePilotCallTest_redefine(JNIEnv* env,jclass,jclass klass,jbyteArray bytes) {
  jbyte* code=env->GetByteArrayElements(bytes,nullptr);
  if(code==nullptr)return;
  jvmtiClassDefinition definition={klass,env->GetArrayLength(bytes),(unsigned char*)code};
  jvmtiError error=jvmti->RedefineClasses(1,&definition);
  env->ReleaseByteArrayElements(bytes,code,JNI_ABORT);
  if(error!=JVMTI_ERROR_NONE) {
    jclass failure=env->FindClass("java/lang/AssertionError");
    if(failure!=nullptr)env->ThrowNew(failure,"RedefineClasses failed");
  }
}
}
