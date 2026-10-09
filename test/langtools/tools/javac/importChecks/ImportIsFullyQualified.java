/*
 * @test /nodynamiccopyright/
 * @bug 4335264
 * @summary Verify that import-on-demand must be fully qualified.
 * @author maddox
 *
 * @compile/fail/ref=ImportIsFullyQualified.out -XDrawDiagnostics  ImportIsFullyQualified.java
 */

import java.lang.*;
import Thread.*;  // class Thread is contained in package java.lang

public class ImportIsFullyQualified {
    Thread.State x;
}
