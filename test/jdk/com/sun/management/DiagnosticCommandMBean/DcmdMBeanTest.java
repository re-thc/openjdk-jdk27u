/*
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/*
 * @test
 * @bug     7150256 8338603
 * @summary Basic Test for the DiagnosticCommandMBean
 * @author  Frederic Parain, Shanliang JIANG
 *
 * @run main/othervm DcmdMBeanTest
 */


import java.lang.management.ManagementFactory;
import javax.management.Descriptor;
import javax.management.MBeanInfo;
import javax.management.MBeanOperationInfo;
import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.management.*;
import javax.management.remote.*;

public class DcmdMBeanTest {

    private static String HOTSPOT_DIAGNOSTIC_MXBEAN_NAME =
        "com.sun.management:type=DiagnosticCommand";

    public static void main(String[] args) throws Exception {
        System.out.println("--->JRCMD MBean Test: invocation on \"operation info\"...");

        MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
        JMXServiceURL url = new JMXServiceURL("rmi", null, 0);
        JMXConnectorServer cs = null;
        JMXConnector cc = null;
        try {
            cs = JMXConnectorServerFactory.newJMXConnectorServer(url, null, mbs);
            cs.start();
            JMXServiceURL addr = cs.getAddress();
            cc = JMXConnectorFactory.connect(addr);
            MBeanServerConnection mbsc = cc.getMBeanServerConnection();
            ObjectName name = new ObjectName(HOTSPOT_DIAGNOSTIC_MXBEAN_NAME);
            MBeanInfo info = mbsc.getMBeanInfo(name);

            // the test should check that the MBean doesn't have any
            // Attribute, notification or constructor. Current version only
            // check operations
            System.out.println("Class Name:" + info.getClassName());
            System.out.println("Description:" + info.getDescription());
            MBeanOperationInfo[] opInfo = info.getOperations();
            System.out.println("Operations:");
            int operationFailures = 0;
            for (int i = 0; i < opInfo.length; i++) {
                operationFailures += printOperation(opInfo[i]);
                operationFailures += checkHelp(mbsc, name, opInfo[i]);
                System.out.println("\n@@@@@@\n");
            }
            if (operationFailures > 0) {
                throw new RuntimeException("FAILED.  " + operationFailures + " operations found with non-standard parameter types or wrong dcmd.help.");
            }

            // Also exercise local descriptor access, without serialization.
            MBeanOperationInfo localOp = mbs.getMBeanInfo(name).getOperations()[0];
            if (checkHelp(mbs, name, localOp) > 0) {
                throw new RuntimeException("FAILED.  Wrong dcmd.help for " + localOp.getName() + " from the local MBeanServer.");
            }
        } finally {
            try {
                cc.close();
                cs.stop();
            } catch (Exception e) {
            }
        }

        System.out.println("Test passed");
    }

    /** Returns the number of mismatches between dcmd.help and the help operation. */
    static int checkHelp(MBeanServerConnection conn, ObjectName name, MBeanOperationInfo info)
            throws Exception {
        Descriptor desc = info.getDescriptor();
        String cmdName = (String) desc.getFieldValue("dcmd.name");
        Object help = conn.invoke(name, "help", new Object[] { new String[] { cmdName } },
                                  new String[] { String[].class.getName() });
        if (!help.equals(desc.getFieldValue("dcmd.help"))) {
            System.out.println("** FAILED ** dcmd.help of " + info.getName()
                    + " differs from the output of \"help " + cmdName + "\"");
            return 1;
        }
        return 0;
    }

    /**
     * Print an Operation, and check for any non-standard parameter types.
     * Return the number of failed parameters, so the caller can signal to fail the test.
     */
    static int printOperation(MBeanOperationInfo info) {
        int failures = 0;
        System.out.println("Name: "+info.getName());
        System.out.println("Description: "+info.getDescription());
        System.out.println("Return Type: "+info.getReturnType());
        System.out.println("Impact: "+info.getImpact());
        Descriptor desc = info.getDescriptor();
        System.out.println("Descriptor");
        for(int i=0; i<desc.getFieldNames().length; i++) {
            if(desc.getFieldNames()[i].compareTo("dcmd.arguments") == 0) {
                System.out.println("\t"+desc.getFieldNames()[i]+":");
                Descriptor desc2 =
                        (Descriptor)desc.getFieldValue(desc.getFieldNames()[i]);
                for(int j=0; j<desc2.getFieldNames().length; j++) {
                    System.out.println("\t\t"+desc2.getFieldNames()[j]+"=");
                    Descriptor desc3 =
                            (Descriptor)desc2.getFieldValue(desc2.getFieldNames()[j]);
                    for(int k=0; k<desc3.getFieldNames().length; k++) {
                        String fieldName3 = desc3.getFieldNames()[k];
                        Object fieldValue3 = desc3.getFieldValue(fieldName3);
                        System.out.print("\t\t\t" + fieldName3 + "=" + fieldValue3);
                        if (fieldName3.equals("dcmd.arg.type")) {
                            if (!isPublicType((String) fieldValue3)) {
                                System.out.print("\t** FAILED ** not a standard type");
                                failures++;
                            }
                        }
                        System.out.println();
                    }
                }
            } else {
                System.out.println("\t"+desc.getFieldNames()[i]+"="
                        +desc.getFieldValue(desc.getFieldNames()[i]));
            }
        }
        return failures;
    }

    // Knowledge of the implementation-dependent types in DiagnosticCommandImpl, seen by applications/users
    // (see the DiagnosticCommandMBean Descriptor, field "dcmd.arg.type").
    private static final String [] publicTypes = new String [] { "INT", "STRING", "BOOLEAN", "STRING SET", "MEMORY SIZE", "NANOTIME" };

    private static final boolean isPublicType(String typeName) {
        if (typeName == null) {
            return false;
        }
        for (String t : publicTypes) {
            if (typeName.equals(t)) {
                return true;
            }
        }
        return false;
    }
}
