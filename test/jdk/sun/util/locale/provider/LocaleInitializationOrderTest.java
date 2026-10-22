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

/*
 * @test
 * @summary Preserve in-progress pool state when adapter initialization logs
 *          to a logger that reenters per-service locale enumeration
 * @library /test/lib
 * @run driver LocaleInitializationOrderTest
 */

import java.lang.System.Logger;
import java.lang.System.LoggerFinder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.BreakIterator;
import java.text.spi.BreakIteratorProvider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import jdk.test.lib.process.ProcessTools;

public class LocaleInitializationOrderTest {
    private static final Locale SPI_LOCALE = Locale.of("qad", "ZZ");
    private static int logCalls;
    private static int constructors;
    private static boolean callbackSawSPI;
    private static boolean inLog;

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            List<Locale> locales = args[0].equals("stream")
                    ? Locale.availableLocales().toList()
                    : Arrays.asList(Locale.getAvailableLocales());
            if (!locales.contains(SPI_LOCALE) || constructors != 1) {
                throw new RuntimeException("SPI not discovered exactly once: " + constructors);
            }
            if (logCalls == 0 || callbackSawSPI) {
                throw new RuntimeException("Changed callback enumeration: calls="
                        + logCalls + " callbackSawSPI=" + callbackSawSPI);
            }
            return;
        }
        Path services = Path.of("logger-spi", "META-INF", "services");
        Files.createDirectories(services);
        Files.writeString(services.resolve(LoggerFinder.class.getName()),
                Finder.class.getName() + "\n");
        Files.writeString(services.resolve(BreakIteratorProvider.class.getName()),
                Breaks.class.getName() + "\n");
        String classPath = System.getProperty("test.class.path")
                + System.getProperty("path.separator") + Path.of("logger-spi").toAbsolutePath();
        for (boolean baseOnly : List.of(false, true)) {
            for (String preference : List.of("SPI,INVALID,CLDR", "SPI,COMPAT,CLDR")) {
                for (String order : List.of("array", "stream")) {
                    List<String> options = new ArrayList<>();
                    if (baseOnly) {
                        options.add("--limit-modules=java.base");
                    }
                    options.addAll(List.of("-Djava.locale.providers=" + preference,
                            "-cp", classPath, LocaleInitializationOrderTest.class.getName(), order));
                    ProcessTools.executeTestJava(options.toArray(String[]::new))
                            .shouldHaveExitValue(0);
                }
            }
        }
    }

    public static class Finder extends LoggerFinder {
        @Override
        public Logger getLogger(String name, Module module) {
            return new Logger() {
                public String getName() { return name; }
                public boolean isLoggable(Level level) { return true; }
                public void log(Level level, ResourceBundle bundle, String message, Throwable thrown) {
                    capture();
                }
                public void log(Level level, ResourceBundle bundle, String format, Object... params) {
                    capture();
                }
                private void capture() {
                    if (!name.equals("sun.util.locale.provider.LocaleProviderAdapter") || inLog) {
                        return;
                    }
                    inLog = true;
                    try {
                        logCalls++;
                        callbackSawSPI |= Arrays.asList(BreakIterator.getAvailableLocales())
                                .contains(SPI_LOCALE);
                    } finally {
                        inLog = false;
                    }
                }
            };
        }
    }

    public static class Breaks extends BreakIteratorProvider {
        public Breaks() { constructors++; }
        public Locale[] getAvailableLocales() { return new Locale[] { SPI_LOCALE }; }
        public BreakIterator getWordInstance(Locale locale) {
            return BreakIterator.getWordInstance(Locale.ROOT);
        }
        public BreakIterator getLineInstance(Locale locale) {
            return BreakIterator.getLineInstance(Locale.ROOT);
        }
        public BreakIterator getCharacterInstance(Locale locale) {
            return BreakIterator.getCharacterInstance(Locale.ROOT);
        }
        public BreakIterator getSentenceInstance(Locale locale) {
            return BreakIterator.getSentenceInstance(Locale.ROOT);
        }
    }
}
