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
  do_class(jdk_internal_tmfy_Utf8Codec, "jdk/internal/tmfy/Utf8Codec") \
  do_signature(tmfy_output_signature, "([BII[BII)I") \
  do_intrinsic(_tmfy_encodeLatin1Utf8, jdk_internal_tmfy_Utf8Codec, tmfy_encodeLatin1Utf8_name, tmfy_output_signature, F_SN) \
  do_name(tmfy_encodeLatin1Utf8_name, "encodeLatin1Utf80")

// name, shape, helper, maximum input bytes, leaf audit
#define TMFY_KERNELS_DO(f) \
  f(encodeLatin1Utf8, output, encode_latin1_utf8, 4096, TMFY_AUDITED_encodeLatin1Utf8)

#endif // SHARE_TMFY_TMFYCATALOGUE_HPP
