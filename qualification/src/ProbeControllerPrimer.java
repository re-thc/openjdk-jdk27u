/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only.
 * This code is distributed without any warranty; see the LICENSE file.
 */
/** Prime the unchanged frozen controller before the qualified pass. */
public final class ProbeControllerPrimer {
    public static void main(String[] args) throws Exception {
        int qualifiedCalls = Integer.getInteger("measureCalls", 100000);
        System.out.println("CONTROLLER_PRIMER_BEGIN");
        System.setProperty("measureCalls", "10000");
        FixedVectorProbe.main(args);
        // Prime management getters, formatting and allocation-counter plumbing.
        // Zero calls keep the kernel warmup history unchanged.
        for (int i = 0; i < 1000; i++) {
            FixedVectorProbe.window("controller_prime", 0, 0);
        }
        System.out.println("MEASURED_PASS_BEGIN");
        System.setProperty("measureCalls", Integer.toString(qualifiedCalls));
        FixedVectorProbe.main(args);
    }
}
