/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#include <algorithm>
#include <cstdlib>
#include <memory>
#include <cstdint>
#include <type_traits>
#include <jni.h>
#include "ips2ra.hpp"
template<class T> struct Key { auto operator()(T x)const{using U=std::make_unsigned_t<T>;return U(x)^(U(1)<<(8*sizeof(T)-1));} };
template<class T> void sort_parallel(T* p,size_t n,bool reuse) {
  if(reuse){thread_local auto context=ips2ra::parallel::make_sorter<T*>(4,Key<T>{});context(p,p+n);}
  else ips2ra::parallel::sort(p,p+n,Key<T>{},4);
}
extern "C" JNIEXPORT jboolean JNICALL Java_ParallelBench_sortCopy(JNIEnv* e,jclass,jobject a,jint lo,jint n,jint width,jboolean reuse) {
  std::unique_ptr<void,decltype(&std::free)> buf(std::malloc(size_t(n)*width+8),&std::free);if(!buf)return false;
  for(int offset=0;offset<n;offset+=16384){int count=std::min(16384,n-offset);if(width==4)e->GetIntArrayRegion((jintArray)a,lo+offset,count,(jint*)buf.get()+offset);else e->GetLongArrayRegion((jlongArray)a,lo+offset,count,(jlong*)buf.get()+offset);if(e->ExceptionCheck())return false;}
  try{if(width==4)sort_parallel((int32_t*)buf.get(),n,reuse);else sort_parallel((int64_t*)buf.get(),n,reuse);}catch(...){return false;}
  for(int offset=0;offset<n;offset+=16384){int count=std::min(16384,n-offset);if(width==4)e->SetIntArrayRegion((jintArray)a,lo+offset,count,(jint*)buf.get()+offset);else e->SetLongArrayRegion((jlongArray)a,lo+offset,count,(jlong*)buf.get()+offset);if(e->ExceptionCheck())return false;}
  return true;
}
