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
        PhaseVectorProbe.main(args);
        System.out.println("MEASURED_PASS_BEGIN");
        System.setProperty("measureCalls", Integer.toString(qualifiedCalls));
        PhaseVectorProbe.main(args);
    }
}
