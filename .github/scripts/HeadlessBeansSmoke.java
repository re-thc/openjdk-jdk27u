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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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

import java.beans.*;
import java.lang.management.ManagementFactory;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import javax.management.JMX;
import javax.management.ObjectName;
import javax.management.StandardMBean;

/** Exercises the non-GUI beans contract in every ordinary profile build. */
public class HeadlessBeansSmoke {
    public static class Base<T> {
        private T value;
        public T getValue() { return value; }
        public void setValue(T value) { this.value = value; }
    }
    public static class Bean extends Base<String> {
        private final PropertyChangeSupport changes = new PropertyChangeSupport(this);
        private int[] numbers = { 1, 2 };
        public int[] getNumbers() { return numbers; }
        public void setNumbers(int[] values) { numbers = values; }
        public int getNumbers(int index) { return numbers[index]; }
        public void setNumbers(int index, int value) { numbers[index] = value; }
        public boolean isReady() { return true; }
        public boolean getReady() { return false; }
        public void addPropertyChangeListener(PropertyChangeListener listener) {
            changes.addPropertyChangeListener(listener);
        }
        public void removePropertyChangeListener(PropertyChangeListener listener) {
            changes.removePropertyChangeListener(listener);
        }
        public PropertyChangeListener[] getPropertyChangeListeners() {
            return changes.getPropertyChangeListeners();
        }
    }
    public static class Explicit extends Base<String> { }
    public static class ExplicitBeanInfo extends SimpleBeanInfo {
        @Override public PropertyDescriptor[] getPropertyDescriptors() {
            try {
                return new PropertyDescriptor[] {
                    new PropertyDescriptor("alias", Explicit.class, "getValue", "setValue")
                };
            } catch (IntrospectionException ex) {
                throw new AssertionError(ex);
            }
        }
    }
    public enum Mode { ON, OFF }
    public static class CustomEditor extends PropertyEditorSupport {
        @Override public void setAsText(String value) { setValue(value.length()); }
    }
    public static class Config {
        private final String name;
        @ConstructorProperties("name")
        public Config(String name) { this.name = name; }
        public String getName() { return name; }
    }
    public interface ConfigMXBean {
        Config getConfig();
        void setConfig(Config config);
    }
    public static class ConfigManager implements ConfigMXBean {
        private Config config = new Config("initial");
        public Config getConfig() { return config; }
        public void setConfig(Config config) { this.config = config; }
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    private static PropertyDescriptor property(BeanInfo info, String name) {
        return Arrays.stream(info.getPropertyDescriptors())
                .filter(p -> p.getName().equals(name)).findFirst().orElseThrow();
    }
    public static void main(String[] args) throws Exception {
        check(Introspector.class.getClassLoader() == null, "boot loader");
        check(Introspector.class.getModule().getName().equals("java.desktop"), "standard module");
        check(Introspector.decapitalize("URL").equals("URL"), "acronym");
        var info = Introspector.getBeanInfo(Bean.class);
        var bean = new Bean();
        var value = property(info, "value");
        check(value.getPropertyType() == String.class, "inherited generic property");
        value.getWriteMethod().invoke(bean, "bound");
        check(value.getReadMethod().invoke(bean).equals("bound"), "property invocation");
        var indexed = (IndexedPropertyDescriptor) property(info, "numbers");
        indexed.getIndexedWriteMethod().invoke(bean, 1, 42);
        check(indexed.getIndexedReadMethod().invoke(bean, 1).equals(42), "indexed access");
        check(property(info, "ready").getReadMethod().getName().equals("isReady"), "boolean getter");
        check(Arrays.stream(info.getMethodDescriptors()).anyMatch(m ->
                m.getMethod().getName().equals("setValue")), "method metadata");
        check(Arrays.stream(info.getEventSetDescriptors()).anyMatch(e ->
                e.getName().equals("propertyChange") && e.getListenerType() == PropertyChangeListener.class),
                "event metadata");
        check(property(Introspector.getBeanInfo(Explicit.class), "alias") != null, "explicit BeanInfo");
        check(info == Introspector.getBeanInfo(Bean.class), "introspection cache");
        Introspector.flushFromCaches(Bean.class);
        check(info != Introspector.getBeanInfo(Bean.class), "cache invalidation");
        for (String absent : new String[] { "java.awt.Toolkit", "javax.swing.JFrame",
                "java.awt.image.BufferedImage", "java.beans.XMLDecoder", "java.beans.beancontext.BeanContext" }) {
            try {
                Class.forName(absent, false, null);
                throw new AssertionError("Unsupported desktop class present: " + absent);
            } catch (ClassNotFoundException expected) { }
        }
        // These reflective calls resolve every public AWT signature dependency.
        check(BeanInfo.class.getMethods().length > 0, "BeanInfo reflection");
        check(PropertyEditor.class.getMethods().length > 0, "PropertyEditor reflection");
        check(new SimpleBeanInfo().getIcon(BeanInfo.ICON_COLOR_16x16) == null, "no default icons");
        try {
            new SimpleBeanInfo().loadImage("unused.gif");
            throw new AssertionError("image loading supported");
        } catch (UnsupportedOperationException expected) { }
        try {
            new java.awt.Rectangle();
            throw new AssertionError("AWT instances supported");
        } catch (UnsupportedOperationException expected) { }
        for (Class<?> type : new Class<?>[] { boolean.class, byte.class, short.class, int.class,
                long.class, float.class, double.class, String.class, Mode.class }) {
            var editor = PropertyEditorManager.findEditor(type);
            check(editor != null, "missing scalar editor: " + type);
            editor.setAsText(type == boolean.class ? "true" : type == Mode.class ? "ON"
                    : type == String.class ? "configured" : "7");
            check(editor.getValue() != null, "editor conversion: " + type);
            check(!editor.supportsCustomEditor() && !editor.isPaintable(), "non-GUI editor");
        }
        PropertyEditorManager.registerEditor(Config.class, CustomEditor.class);
        var custom = PropertyEditorManager.findEditor(Config.class);
        custom.setAsText("four");
        check(custom.getValue().equals(4), "registered custom editor");
        PropertyEditorManager.registerEditor(Config.class, null);
        var calls = new AtomicInteger();
        var changes = new PropertyChangeSupport(bean);
        changes.addPropertyChangeListener("value", e -> {
            check(e.getNewValue().equals("new"), "property event value");
            calls.incrementAndGet();
        });
        changes.firePropertyChange("value", "old", "new");
        check(calls.get() == 1, "property change listener");
        var vetoes = new VetoableChangeSupport(bean);
        vetoes.addVetoableChangeListener("value", e -> {
            throw new PropertyVetoException("rejected", e);
        });
        try {
            vetoes.fireVetoableChange("value", "old", "new");
            throw new AssertionError("veto not delivered");
        } catch (PropertyVetoException expected) { }
        // java.management finds Introspector via the boot loader and uses the
        // ConstructorProperties annotation to reconstruct MXBean values.
        var server = ManagementFactory.getPlatformMBeanServer();
        var name = new ObjectName("beans:type=Config");
        server.registerMBean(new StandardMBean(new ConfigManager(), ConfigMXBean.class, true), name);
        try {
            var proxy = JMX.newMXBeanProxy(server, name, ConfigMXBean.class);
            check(proxy.getConfig().getName().equals("initial"), "MXBean read");
            proxy.setConfig(new Config("updated"));
            check(proxy.getConfig().getName().equals("updated"), "MXBean reconstruction");
        } finally {
            server.unregisterMBean(name);
        }
        System.out.println("Headless beans introspection, editors, events, signatures and MXBean mapping passed");
    }
}
