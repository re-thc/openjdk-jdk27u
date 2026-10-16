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

package scannerprovider;

import java.text.NumberFormat;
import java.text.spi.NumberFormatProvider;
import java.util.Locale;
import java.util.function.Consumer;

public class NumberProvider extends NumberFormatProvider {
    @Override
    public Locale[] getAvailableLocales() {
        return State.symbolsOnly ? new Locale[0] : State.LOCALES.clone();
    }

    @Override
    public NumberFormat getNumberInstance(Locale locale) {
        State.request("number", locale);
        Consumer<Locale> callback = State.numberCallback;
        State.numberCallback = null;
        if (callback != null) {
            callback.accept(locale);
        }
        return State.numberFormat;
    }

    @Override
    public NumberFormat getCurrencyInstance(Locale locale) {
        throw new AssertionError("Unexpected currency formatter request");
    }

    @Override
    public NumberFormat getIntegerInstance(Locale locale) {
        throw new AssertionError("Unexpected integer formatter request");
    }

    @Override
    public NumberFormat getPercentInstance(Locale locale) {
        throw new AssertionError("Unexpected percent formatter request");
    }
}
