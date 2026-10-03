/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
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

#ifndef SHARE_TMFY_TMFYCATALOGUE_HPP
#define SHARE_TMFY_TMFYCATALOGUE_HPP

#define TMFY_INTRINSICS_DO(do_intrinsic, do_class, do_name, do_signature) \
  do_signature(tmfy_output_signature, "([BII[BII)I") \
  do_intrinsic(_tmfy_encodeLatin1Utf8, java_lang_StringCoding, tmfy_encodeLatin1Utf8_name, tmfy_output_signature, F_SN) \
  do_name(tmfy_encodeLatin1Utf8_name, "encodeLatin1Utf80") \
  do_intrinsic(_tmfy_encodeUtf16Utf8, java_lang_StringCoding, tmfy_encodeUtf16Utf8_name, tmfy_output_signature, F_SN) \
  do_name(tmfy_encodeUtf16Utf8_name, "encodeUtf16Utf80") \
  do_intrinsic(_tmfy_decodeUtf8Utf16, java_lang_StringCoding, tmfy_decodeUtf8Utf16_name, tmfy_output_signature, F_SN) \
  do_name(tmfy_decodeUtf8Utf16_name, "decodeUtf8Utf160") \
  do_class(sun_nio_cs_UTF_8_Encoder, "sun/nio/cs/UTF_8$Encoder") \
  do_signature(tmfy_char_output_signature, "([CII[BII)I") \
  do_intrinsic(_tmfy_encodeUtf16ArrayUtf8, sun_nio_cs_UTF_8_Encoder, tmfy_encodeUtf16ArrayUtf8_name, tmfy_char_output_signature, F_SN) \
  do_name(tmfy_encodeUtf16ArrayUtf8_name, "encodeUtf16ArrayUtf80") \
  do_intrinsic(_tmfy_useNativeEncoder, sun_nio_cs_UTF_8_Encoder, tmfy_useNativeEncoder_name, void_boolean_signature, F_S) \
  do_name(tmfy_useNativeEncoder_name, "useNativeEncoder")

// name, shape, helper, maximum input bytes, leaf audit
#define TMFY_STRING_KERNELS_DO(f) \
  f(encodeLatin1Utf8, output, encode_latin1_utf8, 4096, TMFY_AUDITED_encodeLatin1Utf8) \
  f(encodeUtf16Utf8, output, encode_utf16_utf8, 4096, TMFY_AUDITED_encodeUtf16Utf8) \
  f(decodeUtf8Utf16, output, decode_utf8_utf16, 4096, TMFY_AUDITED_decodeUtf8Utf16)

// The bound for char_output is in UTF-16 code units, not bytes.
#define TMFY_CHARSET_KERNELS_DO(f) \
  f(encodeUtf16ArrayUtf8, char_output, encode_utf16_array_utf8, 2048, TMFY_AUDITED_encodeUtf16ArrayUtf8)

#define TMFY_KERNELS_DO(f) \
  TMFY_STRING_KERNELS_DO(f) \
  TMFY_CHARSET_KERNELS_DO(f)

#endif // SHARE_TMFY_TMFYCATALOGUE_HPP
