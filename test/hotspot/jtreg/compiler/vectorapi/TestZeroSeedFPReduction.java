/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
package compiler.vectorapi;

import java.lang.reflect.Method;
import java.util.*;
import jdk.incubator.vector.*;
import jdk.test.whitebox.WhiteBox;

/*
 * @test
 * @bug 8392077
 * @summary Check floating reduction widths, masks, special values and scalar order
 * @modules jdk.incubator.vector
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UnlockDiagnosticVMOptions
 *      -XX:+WhiteBoxAPI -Xbootclasspath/a:. -DverifyLevels=true
 *      -XX:CompileCommand=exclude,compiler.vectorapi.TestZeroSeedFPReduction::scalarFloatOracle
 *      -XX:CompileCommand=exclude,compiler.vectorapi.TestZeroSeedFPReduction::scalarDoubleOracle
 *      compiler.vectorapi.TestZeroSeedFPReduction 4
 */
public class TestZeroSeedFPReduction {
    static long checks;
    static volatile long sink;

    public static float f64(float[] a) { return FloatVector.fromArray(FloatVector.SPECIES_64,a,0).reduceLanes(VectorOperators.ADD); }
    public static float f128(float[] a) { return FloatVector.fromArray(FloatVector.SPECIES_128,a,0).reduceLanes(VectorOperators.ADD); }
    public static float f256(float[] a) { return FloatVector.fromArray(FloatVector.SPECIES_256,a,0).reduceLanes(VectorOperators.ADD); }
    public static float f512(float[] a) { return FloatVector.fromArray(FloatVector.SPECIES_512,a,0).reduceLanes(VectorOperators.ADD); }
    public static double d128(double[] a) { return DoubleVector.fromArray(DoubleVector.SPECIES_128,a,0).reduceLanes(VectorOperators.ADD); }
    public static double d256(double[] a) { return DoubleVector.fromArray(DoubleVector.SPECIES_256,a,0).reduceLanes(VectorOperators.ADD); }
    public static double d512(double[] a) { return DoubleVector.fromArray(DoubleVector.SPECIES_512,a,0).reduceLanes(VectorOperators.ADD); }
    public static float mf64(float[] a,long bits) { return FloatVector.fromArray(FloatVector.SPECIES_64,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(FloatVector.SPECIES_64,bits)); }
    public static float mf128(float[] a,long bits) { return FloatVector.fromArray(FloatVector.SPECIES_128,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(FloatVector.SPECIES_128,bits)); }
    public static float mf256(float[] a,long bits) { return FloatVector.fromArray(FloatVector.SPECIES_256,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(FloatVector.SPECIES_256,bits)); }
    public static float mf512(float[] a,long bits) { return FloatVector.fromArray(FloatVector.SPECIES_512,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(FloatVector.SPECIES_512,bits)); }
    public static double md128(double[] a,long bits) { return DoubleVector.fromArray(DoubleVector.SPECIES_128,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(DoubleVector.SPECIES_128,bits)); }
    public static double md256(double[] a,long bits) { return DoubleVector.fromArray(DoubleVector.SPECIES_256,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(DoubleVector.SPECIES_256,bits)); }
    public static double md512(double[] a,long bits) { return DoubleVector.fromArray(DoubleVector.SPECIES_512,a,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(DoubleVector.SPECIES_512,bits)); }

    public static float carryF64(float[] a,float sum) {
        int i=0;
        for (;i<FloatVector.SPECIES_64.loopBound(a.length);i+=2) sum+=FloatVector.fromArray(FloatVector.SPECIES_64,a,i).reduceLanes(VectorOperators.ADD);
        for (;i<a.length;i++) sum+=a[i];
        return sum;
    }
    public static float carryF128(float[] a,float sum) {
        int i=0;
        for (;i<FloatVector.SPECIES_128.loopBound(a.length);i+=4) sum+=FloatVector.fromArray(FloatVector.SPECIES_128,a,i).reduceLanes(VectorOperators.ADD);
        for (;i<a.length;i++) sum+=a[i];
        return sum;
    }
    public static double carryD128(double[] a,double sum) {
        int i=0;
        for (;i<DoubleVector.SPECIES_128.loopBound(a.length);i+=2) sum+=DoubleVector.fromArray(DoubleVector.SPECIES_128,a,i).reduceLanes(VectorOperators.ADD);
        for (;i<a.length;i++) sum+=a[i];
        return sum;
    }
    public static void independentF128(float[] a,float[] out) {
        int i=0,k=0;
        for (;i<FloatVector.SPECIES_128.loopBound(a.length);i+=4) out[k++]=FloatVector.fromArray(FloatVector.SPECIES_128,a,i).reduceLanes(VectorOperators.ADD);
        float tail=0;for (;i<a.length;i++)tail+=a[i];out[k]=tail;
    }
    public static void independentD128(double[] a,double[] out) {
        int i=0,k=0;
        for (;i<DoubleVector.SPECIES_128.loopBound(a.length);i+=2) out[k++]=DoubleVector.fromArray(DoubleVector.SPECIES_128,a,i).reduceLanes(VectorOperators.ADD);
        double tail=0;for (;i<a.length;i++)tail+=a[i];out[k]=tail;
    }
    public static float strictF(float[] a,float seed) { for(float x:a)seed+=x;return seed; }
    public static double strictD(double[] a,double seed) { for(double x:a)seed+=x;return seed; }
    public static float scalarFloatOracle(float[] a,float seed) { for(int i=0;i<a.length;i++)seed=seed+a[i];return seed; }
    public static double scalarDoubleOracle(double[] a,double seed) { for(int i=0;i<a.length;i++)seed=seed+a[i];return seed; }

    static int fb(float x) { return Float.isNaN(x)?0x7fc00000:Float.floatToRawIntBits(x); }
    static long db(double x) { return Double.isNaN(x)?0x7ff8000000000000L:Double.doubleToRawLongBits(x); }
    static void equalF(float got,float want,String label) { checks++;if(fb(got)!=fb(want))throw new AssertionError(label+" "+Integer.toHexString(fb(got))+" != "+Integer.toHexString(fb(want))); }
    static void equalD(double got,double want,String label) { checks++;if(db(got)!=db(want))throw new AssertionError(label+" "+Long.toHexString(db(got))+" != "+Long.toHexString(db(want))); }

    // Enumerate all ordered binary addition trees via subset partitions.
    // Optional +0 covers the scalar fallback's identity. Non-empty all-negative
    // zero vectors also permit the lane-only hardware reduction's -0.
    static Set<Integer> possibleF(float[] a) {
        Set<Integer> result=new HashSet<>();
        result.addAll(treeF(a,(1<<a.length)-1,new HashMap<>()));
        float[] withZero=Arrays.copyOf(a,a.length+1);
        result.addAll(treeF(withZero,(1<<withZero.length)-1,new HashMap<>()));
        return result;
    }
    static Set<Integer> treeF(float[] a,int mask,Map<Integer,Set<Integer>> memo) {
        if(memo.containsKey(mask))return memo.get(mask);
        Set<Integer> r=new HashSet<>();
        if(Integer.bitCount(mask)==1)r.add(fb(a[Integer.numberOfTrailingZeros(mask)]));
        else for(int left=(mask-1)&mask;left!=0;left=(left-1)&mask) {
            int right=mask^left;if(right==0)continue;
            for(int x:treeF(a,left,memo))for(int y:treeF(a,right,memo))r.add(fb(Float.intBitsToFloat(x)+Float.intBitsToFloat(y)));
        }
        memo.put(mask,r);return r;
    }
    static Set<Long> possibleD(double[] a) {
        Set<Long> result=new HashSet<>();result.addAll(treeD(a,(1<<a.length)-1,new HashMap<>()));
        double[] withZero=Arrays.copyOf(a,a.length+1);result.addAll(treeD(withZero,(1<<withZero.length)-1,new HashMap<>()));return result;
    }
    static Set<Long> treeD(double[] a,int mask,Map<Integer,Set<Long>> memo) {
        if(memo.containsKey(mask))return memo.get(mask);
        Set<Long> r=new HashSet<>();
        if(Integer.bitCount(mask)==1)r.add(db(a[Integer.numberOfTrailingZeros(mask)]));
        else for(int left=(mask-1)&mask;left!=0;left=(left-1)&mask) {
            int right=mask^left;if(right==0)continue;
            for(long x:treeD(a,left,memo))for(long y:treeD(a,right,memo))r.add(db(Double.longBitsToDouble(x)+Double.longBitsToDouble(y)));
        }
        memo.put(mask,r);return r;
    }
    static float reduceF(float[] a,long mask,boolean masked) {
        return switch(a.length) {
            case 2 -> masked?mf64(a,mask):f64(a);case 4 -> masked?mf128(a,mask):f128(a);
            case 8 -> masked?mf256(a,mask):f256(a);case 16 -> masked?mf512(a,mask):f512(a);
            default -> throw new AssertionError();
        };
    }
    static double reduceD(double[] a,long mask,boolean masked) {
        return switch(a.length) {
            case 2 -> masked?md128(a,mask):d128(a);case 4 -> masked?md256(a,mask):d256(a);
            case 8 -> masked?md512(a,mask):d512(a);default -> throw new AssertionError();
        };
    }
    static float[] selectedF(float[] a,long mask) { float[] s=new float[Long.bitCount(mask)];int j=0;for(int i=0;i<a.length;i++)if((mask&(1L<<i))!=0)s[j++]=a[i];return s; }
    static double[] selectedD(double[] a,long mask) { double[] s=new double[Long.bitCount(mask)];int j=0;for(int i=0;i<a.length;i++)if((mask&(1L<<i))!=0)s[j++]=a[i];return s; }
    static void checkF(float[] a,long mask,boolean masked) {
        float got=reduceF(a,mask,masked);float[] s=selectedF(a,mask);checks++;
        if(s.length==0) { equalF(got,+0.0f,"empty float mask");return; }
        if(s.length<=4) {
            if(!possibleF(s).contains(fb(got)))throw new AssertionError("float reduction "+Arrays.toString(s)+" -> "+got);
        } else {
            float want=scalarFloatOracle(s,0);
            // Wide cases are exact small integers, zeros, NaNs or infinities.
            if(want==0 && Arrays.stream(toDouble(s)).allMatch(x->x==0)) {
                boolean positive=false;for(float x:s)positive|=Float.floatToRawIntBits(x)==0;
                if(positive)equalF(got,0,"mixed/positive zero");else if(got!=0)throw new AssertionError("negative zeros");
            } else equalF(got,want,"wide float");
        }
    }
    static double[] toDouble(float[] a) { double[] r=new double[a.length];for(int i=0;i<a.length;i++)r[i]=a[i];return r; }
    static void checkD(double[] a,long mask,boolean masked) {
        double got=reduceD(a,mask,masked);double[] s=selectedD(a,mask);checks++;
        if(s.length==0) { equalD(got,+0.0,"empty double mask");return; }
        if(s.length<=4) {
            if(!possibleD(s).contains(db(got)))throw new AssertionError("double reduction "+Arrays.toString(s)+" -> "+got);
        } else {
            double want=scalarDoubleOracle(s,0);
            if(want==0 && Arrays.stream(s).allMatch(x->x==0)) {
                boolean positive=false;for(double x:s)positive|=Double.doubleToRawLongBits(x)==0;
                if(positive)equalD(got,0,"mixed/positive zero");else if(got!=0)throw new AssertionError("negative zeros");
            } else equalD(got,want,"wide double");
        }
    }
    static void specialValues() {
        for(int n:new int[]{2,4,8,16}) {
            float[][] cases=new float[11][n];
            Arrays.fill(cases[1],-0.0f);Arrays.fill(cases[2],Float.POSITIVE_INFINITY);
            Arrays.fill(cases[3],Float.NEGATIVE_INFINITY);Arrays.fill(cases[4],Float.intBitsToFloat(0x7fc12345));
            for(int i=0;i<n;i++){cases[5][i]=(i%2==0?Float.POSITIVE_INFINITY:Float.NEGATIVE_INFINITY);cases[6][i]=i%2==0?-0.0f:+0.0f;cases[7][i]=i-3;}
            cases[8][n-1]=1;Arrays.fill(cases[9],Float.intBitsToFloat(0xffc12345));Arrays.fill(cases[10],Float.intBitsToFloat(0x7f812345));
            for(float[] a:cases)for(long mask:new long[]{0,(1L<<n)-1,1,1L<<(n-1),0x5555&((1L<<n)-1)}) { checkF(a,mask,true);if(mask==(1L<<n)-1)checkF(a,mask,false); }
            if(n<=4) {
                float[] a=new float[n];a[0]=0x1p25f;a[1]=-0x1p25f;if(n==4){a[2]=1;a[3]=-1;}
                for(long mask=0;mask<(1L<<n);mask++)checkF(a,mask,true);
            }
        }
        for(int n:new int[]{2,4,8}) {
            double[][] cases=new double[11][n];
            Arrays.fill(cases[1],-0.0);Arrays.fill(cases[2],Double.POSITIVE_INFINITY);
            Arrays.fill(cases[3],Double.NEGATIVE_INFINITY);Arrays.fill(cases[4],Double.longBitsToDouble(0x7ff8123456789abcL));
            for(int i=0;i<n;i++){cases[5][i]=i%2==0?Double.POSITIVE_INFINITY:Double.NEGATIVE_INFINITY;cases[6][i]=i%2==0?-0.0:+0.0;cases[7][i]=i-3;}
            cases[8][n-1]=1;Arrays.fill(cases[9],Double.longBitsToDouble(0xfff8123456789abcL));Arrays.fill(cases[10],Double.longBitsToDouble(0x7ff0123456789abcL));
            for(double[] a:cases)for(long mask:new long[]{0,(1L<<n)-1,1,1L<<(n-1),0x55&((1L<<n)-1)}) { checkD(a,mask,true);if(mask==(1L<<n)-1)checkD(a,mask,false); }
            if(n<=4) {
                double[] a=new double[n];a[0]=0x1p54;a[1]=-0x1p54;if(n==4){a[2]=1;a[3]=-1;}
                for(long mask=0;mask<(1L<<n);mask++)checkD(a,mask,true);
            }
        }
    }
    static void loopsAndTails() {
        for(int n:new int[]{0,1,2,3,4,5,7,8,9,17,257}) {
            float[] f=new float[n];double[] d=new double[n];
            for(int i=0;i<n;i++){f[i]=(i%7)-3;d[i]=f[i];}
            float want=scalarFloatOracle(f,0);double dwant=scalarDoubleOracle(d,0);
            equalF(carryF64(f,0),want,"float64 tail "+n);equalF(carryF128(f,0),want,"float128 tail "+n);
            equalD(carryD128(d,0),dwant,"double tail "+n);
            equalF(strictF(f,0),want,"strict float");equalD(strictD(d,0),dwant,"strict double");
            float[] fo=new float[n/4+1];double[] dout=new double[n/2+1];independentF128(f,fo);independentD128(d,dout);
            for(int i=0;i<fo.length;i++)equalF(fo[i],scalarFloatOracle(Arrays.copyOfRange(f,i*4,Math.min(n,i*4+4)),0),"independent float");
            for(int i=0;i<dout.length;i++)equalD(dout[i],scalarDoubleOracle(Arrays.copyOfRange(d,i*2,Math.min(n,i*2+2)),0),"independent double");
        }
        // Scalar ADD after vector reduction must not move into the reduction.
        equalF(carryF128(new float[]{-0x1p25f,1,0,0},0x1p25f),0,"scalar boundary float");
        equalD(carryD128(new double[]{-0x1p54,1},0x1p54),0,"scalar boundary double");
        equalF(strictF(new float[]{-0x1p25f,1,0,0},0x1p25f),1,"strict float order");
        equalD(strictD(new double[]{-0x1p54,1},0x1p54),1,"strict double order");
        for(float seed:new float[]{+0.0f,-0.0f,Float.NaN,Float.POSITIVE_INFINITY,Float.NEGATIVE_INFINITY})
            equalF(strictF(new float[]{-0.0f,-0.0f,-0.0f,-0.0f},seed),scalarFloatOracle(new float[]{-0.0f,-0.0f,-0.0f,-0.0f},seed),"strict special float");
        for(double seed:new double[]{+0.0,-0.0,Double.NaN,Double.POSITIVE_INFINITY,Double.NEGATIVE_INFINITY})
            equalD(strictD(new double[]{-0.0,-0.0},seed),scalarDoubleOracle(new double[]{-0.0,-0.0},seed),"strict special double");
    }
    public static void main(String[] args) throws Exception {
        specialValues();loopsAndTails();
        float[] f=new float[257];double[] d=new double[257];for(int i=0;i<257;i++){f[i]=(i%7)-3;d[i]=f[i];}
        float[] out=new float[65];double[] dout=new double[129];
        int warm=Integer.getInteger("warmup",20000);
        for(int i=0;i<warm;i++) {
            sink=fb(f64(f))+fb(f128(f))+fb(f256(f))+fb(f512(f))+db(d128(d))+db(d256(d))+db(d512(d));
            sink+=fb(mf64(f,i&3))+fb(mf128(f,i&15))+fb(mf256(f,i&255))+fb(mf512(f,i&65535));
            sink+=db(md128(d,i&3))+db(md256(d,i&15))+db(md512(d,i&255));
            sink+=fb(carryF64(f,0))+fb(carryF128(f,0))+db(carryD128(d,0))+fb(strictF(f,0))+db(strictD(d,0));
            independentF128(f,out);independentD128(d,dout);
        }
        specialValues();loopsAndTails();
        if(Boolean.getBoolean("verifyLevels")) {
            int required=Integer.parseInt(args[0]);WhiteBox wb=WhiteBox.getWhiteBox();
            for(Method m:TestZeroSeedFPReduction.class.getDeclaredMethods())
                if(m.getName().matches("(m?[fd](64|128|256|512)|carry[FD](64|128)|independent[FD]128|strict[FD])")) {
                    int level=wb.getMethodCompilationLevel(m,false);
                    if(level!=required)throw new AssertionError(m+" level "+level+" != "+required);
                }
        }
        // Preserve the actual signed-zero result at each execution tier.
        float[] fzero=new float[]{-0.0f,-0.0f,-0.0f,-0.0f};
        double[] dzero=new double[]{-0.0,-0.0};
        System.out.println("REDUCTION_ZERO_BITS float64="+Integer.toHexString(Float.floatToRawIntBits(f64(fzero)))
            +" float128="+Integer.toHexString(Float.floatToRawIntBits(f128(fzero)))
            +" double128="+Long.toHexString(Double.doubleToRawLongBits(d128(dzero)))
            +" maskedFloat128="+Integer.toHexString(Float.floatToRawIntBits(mf128(fzero,15)))
            +" maskedDouble128="+Long.toHexString(Double.doubleToRawLongBits(md128(dzero,3)))
            +" emptyFloat="+Integer.toHexString(Float.floatToRawIntBits(mf128(fzero,0)))
            +" emptyDouble="+Long.toHexString(Double.doubleToRawLongBits(md128(dzero,0)))
            +" strictFloat="+Integer.toHexString(Float.floatToRawIntBits(strictF(fzero,-0.0f)))
            +" strictDouble="+Long.toHexString(Double.doubleToRawLongBits(strictD(dzero,-0.0))));
        System.out.println("REDUCTION_SEMANTICS_PASS checks="+checks+" warmup="+warm);
    }
}
