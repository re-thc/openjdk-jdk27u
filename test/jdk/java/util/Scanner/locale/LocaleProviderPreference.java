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
 * @summary Text-only Scanner captures locale provider preferences immediately
 * @library provider
 * @build provider/module-info provider/scannerprovider.State
 *        provider/scannerprovider.NumberProvider provider/scannerprovider.SymbolsProvider
 * @compile --module-path ${test.classes}/modules --add-modules provider LocaleProviderPreference.java
 * @run main/othervm --add-modules provider -Djava.locale.providers=CLDR LocaleProviderPreference
 */

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Scanner;
import scannerprovider.State;

public class LocaleProviderPreference {
    public static void main(String[] args) {
        // Do not initialize the fixtures or any numeric locale classes first.
        try (Scanner scanner = new Scanner("word")) {
            if (!scanner.next().equals("word")) {
                throw new AssertionError("Unexpected text token");
            }
        }

        System.setProperty("java.locale.providers", "SPI,CLDR");
        State.prepare(false);
        NumberFormat format = NumberFormat.getNumberInstance(Locale.US);
        if (format.getClass() != DecimalFormat.class) {
            throw new AssertionError("Scanner did not capture provider preferences: "
                    + format.getClass());
        }
        if (!State.events.isEmpty()) {
            throw new AssertionError("Unexpected SPI callbacks: " + State.events);
        }
    }
}
