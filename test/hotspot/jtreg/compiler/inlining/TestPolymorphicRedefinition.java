/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 */

/*
 * @test
 * @summary Redefine receiver methods after compiling wider-profile interface calls
 * @requires vm.compiler2.enabled & vm.jvmti
 * @library /test/lib
 * @modules java.compiler java.instrument jdk.jartool/sun.tools.jar
 * @run main RedefineClassHelper
 * @run main/othervm -javaagent:redefineagent.jar
 *      -XX:+UnlockExperimentalVMOptions -XX:+PolymorphicInlining
 *      -XX:MorphismLimit=8 -XX:TypeProfileWidth=8
 *      -XX:-TieredCompilation -Xbatch
 *      -XX:CompileCommand=compileonly,TestPolymorphicRedefinition::call
 *      -XX:CompileCommand=dontinline,TestPolymorphicRedefinition::call
 *      TestPolymorphicRedefinition
 */

public class TestPolymorphicRedefinition {
    public interface Rule { long apply(long x); }
    static volatile long sink;
    static long call(Rule rule, long x) { return rule.apply(x); }

    static void check(Rule[] rules, long extra) {
        long total = 0;
        for (int i = 0; i < 60_000; i++) {
            int k = i % rules.length;
            long actual = call(rules[k], i);
            if (actual != i + k + extra) throw new AssertionError("receiver " + k + ": " + actual);
            total += actual;
        }
        sink = total;
    }

    public static void main(String[] args) throws Exception {
        Rule[] rules = {new PolyR0(), new PolyR1(), new PolyR2()};
        check(rules, 0);
        for (int k = 0; k < rules.length; k++) {
            String name = "PolyR" + k;
            String replacement = "class " + name + " implements TestPolymorphicRedefinition.Rule {"
                    + " public long apply(long x) { return x + " + (k + 1009) + "; } }";
            RedefineClassHelper.redefineClass(rules[k].getClass(), replacement);
        }
        check(rules, 1009);
    }
}

class PolyR0 implements TestPolymorphicRedefinition.Rule { public long apply(long x) { return x; } }
class PolyR1 implements TestPolymorphicRedefinition.Rule { public long apply(long x) { return x + 1; } }
class PolyR2 implements TestPolymorphicRedefinition.Rule { public long apply(long x) { return x + 2; } }
