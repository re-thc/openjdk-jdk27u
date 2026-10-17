#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
# Source only: normalize every make TEST value to one space-separated line.
cache_test_paths=(
  test/jdk/java/util/zip/InflaterClose.java
  test/jdk/java/util/zip/DeflaterDictionaryTests.java
  test/jdk/java/util/zip/InflaterInputStream/MarkReset.java
  test/jdk/java/util/zip/InflaterInputStream/TestAvailable.java
  test/jdk/java/util/zip/InflaterInputStream/UnexpectedEndOfZlibStream.java
  test/jdk/java/util/zip/ZipFile/EnumerateAfterClose.java
  test/jdk/java/util/zip/ZipFile/FinalizeInflater.java
  test/jdk/java/util/zip/ZipFile/InflaterCache.java
  test/jdk/java/util/zip/ZipFile/InvalidCompressedSizeTest.java
  test/jdk/java/util/zip/ZipFile/MultiThreadedReadTest.java
  test/jdk/java/util/zip/ZipFile/ReadAfterClose.java
  test/jdk/java/util/zip/ZipFile/ReleaseInflater.java
  test/jdk/java/util/zip/ZipFile/ShortRead.java
  test/jdk/java/util/zip/ZipFile/TestCleaner.java
  test/jdk/java/util/zip/ZipFile/ZipFileSharedSourceTest.java
)
consumer_test_paths=(
  test/jdk/java/net/URLClassLoader/JarLoaderCloseTest.java
  test/jdk/java/util/ServiceLoader/basic/ServiceLoaderBasicTest.java
  test/jdk/java/util/jar/JarFile/mrjar/MultiReleaseJarAPI.java
  test/jdk/java/util/jar/JarFile/VerifySignedJar.java
  test/jdk/java/util/jar/JarFile/SignedJarFileGetInputStream.java
  test/jdk/java/util/jar/JarFile/SignedJarPendingBlock.java
)
join_tests() { local IFS=' '; printf '%s' "$*"; }
cache_tests=$(join_tests "${cache_test_paths[@]}")
consumer_tests=$(join_tests "${consumer_test_paths[@]}")
candidate_tests=$(join_tests "${cache_test_paths[@]}" "${consumer_test_paths[@]}")
