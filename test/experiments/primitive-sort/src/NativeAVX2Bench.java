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

public class NativeAVX2Bench {
    public static void main(String[] args) {
        boolean force=Boolean.getBoolean("forceAVX2");
        String path=System.getProperty("java.home")+"/lib/libprimitivesort.so";
        if(force) NativeISA.force(path,Long.decode(args[0]));
        PublicBench.main(new String[0]);
        if(force) {
            long[] result=NativeISA.probe(path,Long.decode(args[1]),0,Long.decode(args[2]));
            if(result==null||result[2]!=Long.decode(args[3]))throw new AssertionError("AVX2 dispatch");
            System.err.println("PASS actual AVX2 product long entry index="+result[0]+" offset=0x"+Long.toHexString(result[2]));
        }
    }
}
