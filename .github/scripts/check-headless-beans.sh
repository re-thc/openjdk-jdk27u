#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.

set -euo pipefail
jdk=${1:?Usage: check-headless-beans.sh JDK_PATH}
repo_root="$(cd "$(dirname "$0")/../.." && pwd)"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
java="$jdk/bin/java"
javac="$jdk/bin/javac"
jmod="$jdk/bin/jmod"
jlink="$jdk/bin/jlink"
if [[ ! -x $java && -x $java.exe ]]; then
  java+=.exe; javac+=.exe; jmod+=.exe; jlink+=.exe
fi
"$jmod" list "$jdk/jmods/java.desktop.jmod" > "$work/desktop.list"
# Independent package-level inventory: no Swing, toolkit, imaging, sound,
# printing, XML persistence or bean context can enter the restricted module.
unexpected=$(grep '^classes/' "$work/desktop.list" | grep -Ev \
  '^classes/(module-info[.]class|java/beans/[^/]+[.]class|java/awt/(Component|Graphics|Image|Rectangle)[.]class|com/sun/beans/(TypeResolver|WeakCache|WildcardTypeImpl)([$][^/]*)?[.]class|com/sun/beans/(introspect|finder|util)/[^/]+[.]class|com/sun/beans/editors/(Boolean|Byte|Double|Enum|Float|Integer|Long|Number|Short|String)Editor([$][^/]*)?[.]class)$' || true)
[[ -z $unexpected ]] || { echo "Unexpected desktop classes: $unexpected" >&2; exit 1; }
if grep -Eq '^classes/java/beans/(Beans|.*Persistence.*|XML.*|Encoder|Decoder|Statement|Expression|EventHandler)[.$]' "$work/desktop.list"; then
  echo 'Unexpected bean persistence or activation API' >&2; exit 1
fi
if grep -Eq '^(bin|lib|include|conf)/' "$work/desktop.list"; then
  echo 'Unexpected desktop native library, configuration or header' >&2; exit 1
fi
"$javac" -d "$work/classes" "$repo_root/.github/scripts/HeadlessBeansSmoke.java"
"$java" -cp "$work/classes" HeadlessBeansSmoke
mkdir -p "$work/src/beans.client/probe"
cat > "$work/src/beans.client/module-info.java" <<'EOF'
module beans.client { requires java.desktop; }
EOF
cat > "$work/src/beans.client/probe/Main.java" <<'EOF'
package probe;
public class Main {
    public String getName() { return "bean"; }
    public static void main(String[] args) throws Exception {
        var properties = java.beans.Introspector.getBeanInfo(Main.class).getPropertyDescriptors();
        if (java.util.Arrays.stream(properties).noneMatch(p -> p.getName().equals("name")))
            throw new AssertionError("named-module bean introspection");
        if (java.beans.Introspector.class.getClassLoader() != null)
            throw new AssertionError("beans not boot loaded");
    }
}
EOF
"$javac" --module-source-path "$work/src" -d "$work/mods" -m beans.client
"$java" --module-path "$work/mods" -m beans.client/probe.Main
"$jlink" --module-path "$work/mods" --add-modules beans.client --output "$work/runtime"
"$work/runtime/bin/java" -m beans.client/probe.Main
# JMX reconstruction and classpath reflection must also work in a linked image.
"$jlink" --add-modules java.desktop,java.management --output "$work/management"
"$work/management/bin/java" -cp "$work/classes" HeadlessBeansSmoke
printf 'Headless beans module inventory, named requires and jlink passed.\n'
