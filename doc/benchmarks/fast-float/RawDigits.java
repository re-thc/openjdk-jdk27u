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
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 *
 */

package bench;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.internal.math.FloatingDecimal;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class RawDigits {
 @Param({"4","8","12","16","20","60","256"}) public int length;
 @Param({"0","310","-325"}) public int exponent;
 private byte[][] inputs;
 @Setup public void setup() {
  Random r = new Random(42);
  inputs = new byte[1024][];
  for (int i=0;i<inputs.length;i++) {
   byte[] b = new byte[length];
   b[0] = (byte)('1'+r.nextInt(9));
   for (int j=1;j<length;j++) b[j]=(byte)('0'+r.nextInt(10));
   inputs[i]=b;
  }
 }
 @Benchmark @OperationsPerInvocation(1024)
 public void parse(Blackhole b) {
  for (byte[] s:inputs) b.consume(FloatingDecimal.parseDoubleSignlessDigits(exponent,s,length));
 }
}
