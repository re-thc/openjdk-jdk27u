/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @test id=parser
 * @summary Reject incomplete, intrinsified and method-handle C1 Adler call shapes
 * @library /test/lib
 * @modules java.xml
 * @run driver TestC1DirectAdler32CallShape parser
 */

/*
 * @test id=apple-call-shape
 * @summary Verify a direct native Adler invocation in the C1 compilation holding FP values
 * @requires vm.compiler1.enabled & os.family == "mac" & os.simpleArch == "aarch64"
 * @library /test/lib
 * @modules java.xml
 * @run driver TestC1DirectAdler32CallShape
 */

import java.io.StringReader;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.zip.Adler32;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import jdk.test.lib.process.ProcessTools;

public class TestC1DirectAdler32CallShape {
    private static final String ROOT = "TestC1DirectAdler32CallShape checksumWithFp ";

    // This public API call, rather than a method handle, must be inlined into
    // this compilation. The driver verifies its direct invokestatic call site.
    static long checksumWithFp(Adler32 adler, ByteBuffer input, double[] fp) {
        double a = fp[0], b = fp[1], c = fp[2], d = fp[3];
        double e = fp[4], f = fp[5], g = fp[6], h = fp[7];
        double i = fp[8], j = fp[9], k = fp[10], l = fp[11];
        adler.update(input);
        return adler.getValue() ^ Double.doubleToRawLongBits(
                a + b + c + d + e + f + g + h + i + j + k + l);
    }

    private static void child() {
        byte[] data = new byte[4097 + 31];
        for (int i = 0; i < data.length; i++) data[i] = (byte) (37 * i + 11);
        ByteBuffer input = ByteBuffer.allocateDirect(data.length);
        input.put(data);
        double[] fp = {0.25, 1.5, 2.75, 4, 5.25, 6.5, 7.75, 9, 10.25, 11.5, 12.75, 14};
        double sum = 0;
        for (double value : fp) sum += value;
        int[] sizes = {0, 1, 63, 64, 65, 4095, 4096, 4097};
        long[][] expected = new long[4][sizes.length];
        for (int off = 0; off < 4; off++) {
            int offset = new int[]{0, 1, 7, 31}[off];
            for (int n = 0; n < sizes.length; n++) {
                int s1 = 1, s2 = 0;
                for (int j = offset; j < offset + sizes[n]; j++) {
                    s1 = (s1 + (data[j] & 255)) % 65521;
                    s2 = (s2 + s1) % 65521;
                }
                expected[off][n] = (((long) s2 << 16) | s1) ^ Double.doubleToRawLongBits(sum);
            }
        }
        Adler32 adler = new Adler32();
        for (int repeat = 0; repeat < 20_000; repeat++) {
            int n = repeat % sizes.length, o = (repeat / sizes.length) % 4;
            int offset = new int[]{0, 1, 7, 31}[o];
            input.clear().limit(offset + sizes[n]).position(offset);
            adler.reset();
            long actual = checksumWithFp(adler, input, fp);
            if (actual != expected[o][n] || input.position() != input.limit()) {
                throw new AssertionError("Checksum/FP/buffer mismatch at " + repeat);
            }
        }
    }

    private static Map<String, Element> ids(Element task, String tag) {
        Map<String, Element> result = new HashMap<>();
        var nodes = task.getElementsByTagName(tag);
        for (int i = 0; i < nodes.getLength(); i++) {
            Element e = (Element) nodes.item(i);
            result.put(e.getAttribute("id"), e);
        }
        return result;
    }

    private static String methodName(String id, Map<String, Element> methods,
                                     Map<String, Element> classes) {
        Element m = methods.get(id);
        if (m == null || classes.get(m.getAttribute("holder")) == null) return "";
        return classes.get(m.getAttribute("holder")).getAttribute("name").replace('/', '.') +
               " " + m.getAttribute("name");
    }

    // A successful level1 compilation alone is insufficient. Require the public
    // wrapper parse inside the FP root and its direct invokestatic target, with
    // the native-method decline. Never accept a linkToStatic/adapter parse path.
    static void verifyLog(String xml) throws Exception {
        var factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        var document = factory.newDocumentBuilder().parse(new InputSource(new StringReader(xml)));
        Set<String> c1 = new HashSet<>();
        var nmethods = document.getElementsByTagName("nmethod");
        for (int i = 0; i < nmethods.getLength(); i++) {
            Element e = (Element) nmethods.item(i);
            if (e.getAttribute("compiler").equals("c1") && e.getAttribute("level").equals("1")) {
                c1.add(e.getAttribute("compile_id"));
            }
        }
        int checked = 0;
        var tasks = document.getElementsByTagName("task");
        for (int i = 0; i < tasks.getLength(); i++) {
            Element task = (Element) tasks.item(i);
            if (!task.getAttribute("method").startsWith(ROOT) ||
                !c1.contains(task.getAttribute("compile_id"))) continue;
            var done = task.getElementsByTagName("task_done");
            if (done.getLength() != 1 ||
                !((Element) done.item(0)).getAttribute("success").equals("1")) continue;
            Map<String, Element> methods = ids(task, "method"), classes = ids(task, "klass");
            boolean found = false;
            var calls = task.getElementsByTagName("call");
            for (int j = 0; j < calls.getLength(); j++) {
                Element call = (Element) calls.item(j);
                if (!methodName(call.getAttribute("method"), methods, classes)
                        .equals("java.util.zip.Adler32 updateByteBuffer")) continue;
                if (!call.getAttribute("instr").equals("invokestatic")) {
                    throw new AssertionError("Adler target is not a direct invokestatic");
                }
                boolean wrapper = false, root = false, adapter = false;
                for (Node p = call.getParentNode(); p != task; p = p.getParentNode()) {
                    if (p instanceof Element e && e.getTagName().equals("parse")) {
                        String name = methodName(e.getAttribute("method"), methods, classes);
                        wrapper |= name.equals("java.util.zip.Adler32 update");
                        root |= name.equals("TestC1DirectAdler32CallShape checksumWithFp");
                        adapter |= name.startsWith("java.lang.invoke.");
                    }
                }
                boolean declined = false;
                for (Node next = call.getNextSibling(); next != null; next = next.getNextSibling()) {
                    if (!(next instanceof Element e)) continue;
                    if (Set.of("call", "parse", "intrinsic").contains(e.getTagName())) break;
                    if (e.getTagName().equals("inline_fail") &&
                        e.getAttribute("reason").equals("native method")) declined = true;
                }
                if (!wrapper || !root || adapter || !declined) {
                    throw new AssertionError("Adler target is outlined, adapted or intrinsified");
                }
                found = true;
            }
            if (!found) throw new AssertionError("No direct declined Adler target in FP compilation " +
                                                  task.getAttribute("compile_id"));
            checked++;
        }
        if (checked == 0) throw new AssertionError("No successful C1 FP compilation checked");
    }

    private static void parserTests() throws Exception {
        String good = """
            <hotspot_log><nmethod compile_id='1' compiler='c1' level='1'/>
            <task compile_id='1' method='TestC1DirectAdler32CallShape checksumWithFp signature'>
            <klass id='1' name='TestC1DirectAdler32CallShape'/><klass id='2' name='java.util.zip.Adler32'/>
            <method id='10' holder='1' name='checksumWithFp'/><method id='11' holder='2' name='update'/>
            <method id='12' holder='2' name='updateByteBuffer'/>
            <parse method='10'><parse method='11'><call method='12' instr='invokestatic'/>
            <inline_fail reason='native method'/></parse></parse><task_done success='1'/>
            </task></hotspot_log>
            """;
        verifyLog(good);
        for (String bad : new String[]{
                good.replace("<inline_fail reason='native method'/>", "<intrinsic id='_updateByteBufferAdler32'/>"),
                good.replace("instr='invokestatic'", "instr='invokehandle'"),
                good.replace("name='update'", "name='outlinedHelper'"),
                good.replace("success='1'", "success='0'"),
                good.replace("compiler='c1'", "compiler='c2'"),
                good.replace("<inline_fail reason='native method'/>", "<inline_fail reason='native method'/><call method='12' instr='invokestatic'/><intrinsic id='_updateByteBufferAdler32'/>"),
                good.replace("<parse method='11'>", "<klass id='3' name='java.lang.invoke.MethodHandle'/><method id='13' holder='3' name='linkToStatic'/><parse method='13'><parse method='11'>").replace("</parse></parse><task_done", "</parse></parse></parse><task_done"),
                good.replace("name='java.util.zip.Adler32'", "name='java.lang.invoke.MethodHandle'")}) {
            try {
                verifyLog(bad);
                throw new IllegalStateException("Accepted invalid call-shape fixture");
            } catch (AssertionError expected) { }
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0 && args[0].equals("child")) { child(); return; }
        parserTests();
        if (args.length != 0 && args[0].equals("parser")) return;
        for (String adler : new String[]{"+", "-"}) {
            Path log = Path.of("direct-adler-" + (adler.equals("+") ? "enabled" : "disabled") + ".xml").toAbsolutePath();
            ProcessTools.executeTestJava("-Xbatch", "-XX:TieredStopAtLevel=1",
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation", "-XX:LogFile=" + log,
                    "-XX:C1MaxInlineSize=300", "-XX:C1InlineStackLimit=100",
                    "-XX:CompileCommand=inline,java.util.zip.Adler32::update",
                    "-XX:CompileCommand=dontinline,TestC1DirectAdler32CallShape::checksumWithFp",
                    "-XX:" + adler + "UseAdler32Intrinsics", "-Xcheck:jni",
                    TestC1DirectAdler32CallShape.class.getName(), "child").shouldHaveExitValue(0);
            verifyLog(Files.readString(log));
        }
    }
}
