/*
 * Copyright (c) 2015, 2021, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package jdk.internal.net.http;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

class FilterFactory {

    // Strictly-ordered list of filters.
    private final List<Filter> filters = new ArrayList<>(3);

    public void addFilter(Class<? extends HeaderFilter> type) {
        filters.add(new Filter(type));
    }

    List<HeaderFilter> getFilterChain() {
        List<HeaderFilter> l = new ArrayList<>(filters.size());
        for (Filter filter : filters) {
            try {
                l.add(filter.newInstance());
            } catch (ReflectiveOperationException e) {
                throw new InternalError(e);
            }
        }
        return l;
    }

    private static final class Filter {
        private final Class<? extends HeaderFilter> type;
        private volatile Constructor<? extends HeaderFilter> constructor;

        Filter(Class<? extends HeaderFilter> type) {
            this.type = type;
        }

        HeaderFilter newInstance() throws ReflectiveOperationException {
            Constructor<? extends HeaderFilter> c = constructor;
            if (c != null) {
                return c.newInstance();
            }
            // Resolve the public no-arg constructor lazily, caching only after success.
            // Concurrent first exchanges may each resolve their own constructor.
            c = type.getConstructor();
            HeaderFilter filter = c.newInstance();
            constructor = c;
            return filter;
        }
    }
}
