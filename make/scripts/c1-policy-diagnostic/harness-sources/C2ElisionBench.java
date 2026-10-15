package org.openjdk.bench.recovery;

import java.lang.reflect.Constructor;
import java.math.BigDecimal;
import java.util.concurrent.TimeUnit;
import jdk.internal.math.DoubleToDecimal;
import jdk.internal.math.FormattedFPDecimal;
import org.openjdk.jmh.annotations.*;

/** Check whether constant inputs let ordinary C2 remove the old allocation. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
public class C2ElisionBench {
    FormattedFPDecimal holder;
    @Setup public void setup() throws Exception {
        Constructor<FormattedFPDecimal> c = FormattedFPDecimal.class.getDeclaredConstructor();
        c.setAccessible(true);
        holder = c.newInstance();
    }
    @Benchmark public long splitPositiveZero() {
        DoubleToDecimal.split(0.0, holder);
        return holder.getSignificand();
    }
    @Benchmark public long splitExactInteger() {
        DoubleToDecimal.split(42.0, holder);
        return holder.getSignificand() + holder.getPrecision() + holder.getExp();
    }
    @Benchmark public BigDecimal valueOfShortInteger() {
        return BigDecimal.valueOf(42.0);
    }
}
