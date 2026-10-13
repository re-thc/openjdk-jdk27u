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

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;

/*
 * @test
 * @summary Tests the description of the only property of java.lang.Object
 * @run main ObjectPropertyTest
 */
public class ObjectPropertyTest {

    public static void main(String[] args) throws Exception {
        BeanInfo info = Introspector.getBeanInfo(Object.class);
        PropertyDescriptor[] properties = info.getPropertyDescriptors();
        if (properties.length != 1) {
            throw new Error("unexpected properties: " + properties.length);
        }
        PropertyDescriptor property = properties[0];
        check("name", property.getName(), "class");
        check("type", property.getPropertyType(), Class.class);
        check("read method", property.getReadMethod(), Object.class.getMethod("getClass"));
        check("write method", property.getWriteMethod(), null);
        check("bound", property.isBound(), false);
        check("constrained", property.isConstrained(), false);
        check("expert", property.isExpert(), false);
        check("hidden", property.isHidden(), false);
        check("preferred", property.isPreferred(), false);
        check("transient", property.getValue("transient"), null);
        check("required", property.getValue("required"), false);
        check("visualUpdate", property.getValue("visualUpdate"), false);
        check("enumerationValues", ((Object[]) property.getValue("enumerationValues")).length, 0);
        check("description", property.getShortDescription(), "class");
        check("bean class", info.getBeanDescriptor().getBeanClass(), Object.class);
        check("bean name", info.getBeanDescriptor().getName(), "Object");
    }

    private static void check(String what, Object actual, Object expected) {
        if (!java.util.Objects.equals(actual, expected)) {
            throw new Error(what + ": expected " + expected + " but got " + actual);
        }
    }
}
