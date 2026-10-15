package org.openjdk.bench.recovery;

import java.lang.reflect.Constructor;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.internal.math.DoubleToDecimal;
import jdk.internal.math.FormattedFPDecimal;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
public class SplitFallbackBench {
    static final int N = 1024;
    @Param({"ordinary", "tiny"}) public String dataset;
    double[] values;
    FormattedFPDecimal holder;
    DecimalFormat decimalFormat;

    @Setup public void setup() throws Exception {
        Constructor<FormattedFPDecimal> c = FormattedFPDecimal.class.getDeclaredConstructor();
        c.setAccessible(true);
        holder = c.newInstance();
        values = new double[N];
        Random r = new Random(0x51_171_2026L);
        for (int i = 0; i < N; i++) {
            values[i] = dataset.equals("tiny") ? Double.longBitsToDouble(i % 128 + 1L)
                    : switch (i % 4) {
                        case 0 -> r.nextDouble() * 180 + 0.01;
                        case 1 -> r.nextDouble() * 1_000_000 + 0.01;
                        case 2 -> (r.nextInt(1_000_000) + 1) / 100.0;
                        default -> Math.scalb(r.nextDouble() + 1, r.nextInt(100) - 50);
                    };
        }
        decimalFormat = new DecimalFormat("0.#########", DecimalFormatSymbols.getInstance(Locale.US));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void split(Blackhole bh) {
        for (double v : values) {
            DoubleToDecimal.split(v, holder);
            bh.consume(holder.getSignificand());
            bh.consume(holder.getExp());
            bh.consume(holder.getPrecision());
            bh.consume(holder.getExact());
            bh.consume(holder.getAway());
        }
    }

    @Benchmark @OperationsPerInvocation(N)
    public void precisionGeneral(Blackhole bh) {
        for (double v : values) {
            FormattedFPDecimal fd = FormattedFPDecimal.valueOf(v, 9, FormattedFPDecimal.GENERAL);
            bh.consume(fd.getMantissa());
            bh.consume(fd.getExponent());
            bh.consume(fd.getExponentRounded());
        }
    }

    @Benchmark @OperationsPerInvocation(N)
    public void bigDecimalValueOf(Blackhole bh) {
        for (double v : values) bh.consume(BigDecimal.valueOf(v));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void decimalFormat(Blackhole bh) {
        for (double v : values) bh.consume(decimalFormat.format(v));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void formatterGeneral(Blackhole bh) {
        for (double v : values) bh.consume(String.format(Locale.US, "%.9g", v));
    }
}
