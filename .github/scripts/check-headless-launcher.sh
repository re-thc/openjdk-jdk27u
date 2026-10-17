#!/bin/bash
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
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
#

# Focused launcher/archive and retained native-service checks.
set -euo pipefail
jdk=$(cd "${1:?Usage: check-headless-launcher.sh JDK_PATH}" && pwd)
java="$jdk/bin/java"
javac="$jdk/bin/javac"
jar="$jdk/bin/jar"
[[ -x $java ]] || java="$java.exe"
[[ -x $javac ]] || javac="$javac.exe"
[[ -x $jar ]] || jar="$jar.exe"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

expect_error() {
  local expected=$1
  shift
  local result=0
  "$java" "$@" > "$work/stdout" 2> "$work/stderr" || result=$?
  if [[ $result != 1 || -s $work/stdout ]] || ! grep -Fxq "$expected" "$work/stderr"; then
    cat "$work/stdout" "$work/stderr" >&2
    echo "Unexpected launcher error (exit $result): $expected" >&2
    exit 1
  fi
}
expect_error "Error: Unable to access jarfile $work/missing.jar" -jar "$work/missing.jar"
printf 'invalid archive\n' > "$work/corrupt.jar"
expect_error "Error: Invalid or corrupt jarfile $work/corrupt.jar" -jar "$work/corrupt.jar"

cat > "$work/LauncherJarSmoke.java" <<'JAVA'
public class LauncherJarSmoke {
    public static class Agent {
        public static void premain(String options, java.lang.instrument.Instrumentation instrumentation) {
            if (instrumentation.getAllLoadedClasses().length == 0) throw new AssertionError();
            System.setProperty("headless.agent.loaded", "true");
        }
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new AssertionError("Arguments lost");
        if (args[0].equals("kerberos")) {
            var config = Class.forName("sun.security.krb5.SCDynamicStoreConfig");
            try {
                config.getMethod("getConfig").invoke(null);
            } catch (java.lang.reflect.InvocationTargetException e) {
                // An unconfigured machine may have no Kerberos dynamic-store
                // data. Native linking, initialization and invocation must work.
                if (!(e.getCause() instanceof java.io.IOException)) throw e;
            }
            System.out.println("KRB5_OK");
            return;
        }
        if (args[0].equals("agent") && !Boolean.getBoolean("headless.agent.loaded")) {
            throw new AssertionError("Native instrumentation did not initialize");
        }
        System.out.println("JAR_OK:" + args[0]);
    }
}
JAVA
"$javac" -d "$work/classes" "$work/LauncherJarSmoke.java"
"$jar" --create --file "$work/no-manifest.jar" --no-manifest -C "$work/classes" .
expect_error "Error: Invalid or corrupt jarfile $work/no-manifest.jar" -jar "$work/no-manifest.jar"
"$jar" --create --file "$work/no-main.jar" -C "$work/classes" .
expect_error "no main manifest attribute, in $work/no-main.jar" -jar "$work/no-main.jar"
# Splash metadata is harmless; it must not enable a graphical launcher path.
printf 'Main-Class: LauncherJarSmoke\nSplashScreen-Image: absent.png\n\n' > "$work/main.mf"
"$jar" --create --file "$work/main.jar" --manifest "$work/main.mf" -C "$work/classes" .
[[ $("$java" -jar "$work/main.jar" plain) == JAR_OK:plain ]]
printf 'Premain-Class: LauncherJarSmoke$Agent\n\n' > "$work/agent.mf"
"$jar" --create --file "$work/agent.jar" --manifest "$work/agent.mf" -C "$work/classes" .
[[ $("$java" -javaagent:"$work/agent.jar" -jar "$work/main.jar" agent) == JAR_OK:agent ]]

if [[ $(uname -s) == Darwin ]]; then
  instrument_deps=$(otool -L "$jdk/lib/libinstrument.dylib")
  krb5_deps=$(otool -L "$jdk/lib/libosxkrb5.dylib")
  if printf '%s\n%s\n' "$instrument_deps" "$krb5_deps" \
      | grep -Eq '/(Cocoa|AppKit|ApplicationServices)[.]framework/'; then
    echo 'Unnecessary GUI framework linked by a retained server library' >&2; exit 1
  fi
  # The graph test checks the retained framework inputs. Exercise their native
  # services here without assuming how the OS represents framework reexports.
  [[ $("$java" --add-exports java.security.jgss/sun.security.krb5=ALL-UNNAMED \
      -cp "$work/classes" LauncherJarSmoke kerberos) == KRB5_OK ]]
fi
echo 'Headless launcher/archive and native-service checks passed.'
