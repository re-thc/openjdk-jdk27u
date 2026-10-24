#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
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

"""Focused source-only collation validation; no full JDK build or installs.

The existing JDK supplies a compiler and VM, not its Unicode semantics.
All collation, Character data, and ICU normalization classes/data are
compiled or copied from this checkout into isolated module patches.
Uses the same generators as the production gensrc/gendata rules.
"""

import argparse
import os
from pathlib import Path
import shutil
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--java-home", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True,
                        help="new directory for isolated classes and resources")
    parser.add_argument("--test", action="store_true",
                        help="run focused generated, fallback, SPI and determinism checks")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    java = str(args.java_home.resolve() / "bin/java")
    javac = str(args.java_home.resolve() / "bin/javac")
    env = os.environ.copy()
    # Caller injection must not select host providers or additional patches.
    for name in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "CLASSPATH"):
        env.pop(name, None)

    def run(command):
        subprocess.run([str(x) for x in command], check=True, cwd=root, env=env)

    base = root / "src/java.base/share/classes"
    ld = root / "src/jdk.localedata/share/classes"
    ucd = root / "src/java.base/share/data/unicodedata"
    genroot = root / "make/jdk/src/classes/build/tools"
    tools = output / "tools"
    tools.mkdir()
    gen_sources = sorted((genroot / "generatecharacter").glob("*.java"))
    generators = sorted((genroot / "generatecollation").glob("*.java"))
    run([javac, "-d", tools, *gen_sources, *generators])
    identity = output / "generated/sun/text/resources/CollationDataIdentity.java"
    metadata = output / "identity"
    run([java, "-cp", tools, "build.tools.generatecollation.GenerateCollationIdentity",
         root, identity, metadata])
    generated = output / "generated/java/lang"
    generated.mkdir(parents=True)
    for suffix, options in [
        ("Latin1", ["-latin1", "8"]),
        ("00", ["-string", "-plane", "0", "11", "4", "1"]),
        ("01", ["-string", "-plane", "1", "11", "4", "1"]),
        ("02", ["-string", "-plane", "2", "11", "4", "1"]),
        ("03", ["-string", "-plane", "3", "11", "4", "1"]),
        ("0E", ["-string", "-plane", "14", "11", "4", "1"]),
    ]:
        name = "CharacterData" + suffix
        run([java, "-cp", tools, "build.tools.generatecharacter.GenerateCharacter",
             "-template", base / f"java/lang/{name}.java.template",
             "-spec", ucd / "UnicodeData.txt",
             "-specialcasing", ucd / "SpecialCasing.txt",
             "-proplist", ucd / "PropList.txt",
             "-derivedprops", ucd / "DerivedCoreProperties.txt",
             "-emojidata", ucd / "emoji/emoji-data.txt",
             "-o", generated / f"{name}.java", "-usecharforbyte", *options])

    text_classes = [
        "Collator", "RuleBasedCollator", "RBCollationTables", "RBTableBuilder",
        "MergeCollation", "PatternEntry", "EntryPair", "CollationElementIterator",
        "CollationKey", "RuleBasedCollationKey", "Normalizer",
        "CharacterIterator", "StringCharacterIterator",
    ]
    sources = [base / f"java/text/{name}.java" for name in text_classes]
    sources += [base / f"java/lang/{name}.java" for name in
                ("Character", "CharacterData", "CharacterDataUndefined",
                 "CharacterDataPrivateUse")]
    sources += sorted((base / "jdk/internal/icu").rglob("*.java"))
    sources += [base / f"sun/text/{name}.java" for name in
                ("UCompactIntArray", "IntHashtable", "ComposedCharIter",
                 "CollatorUtilities", "Normalizer")]
    sources += [base / "sun/util/locale/provider/CollationRules.java",
                base / "sun/util/locale/provider/CollatorProviderImpl.java"]
    sources += sorted((base / "sun/text/resources").glob("CollationData*.java"))
    sources += [base / "jdk/internal/access/SharedSecrets.java",
                base / "jdk/internal/access/JavaSecurityAlgorithmParametersAccess.java"]
    access = base / "jdk/internal/access/JavaTextAccess.java"
    if access.exists():
        sources.append(access)

    staging = output / "source/java.base"
    for source in sources:
        destination = staging / source.relative_to(base)
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, destination)
    for source in generated.glob("*.java"):
        destination = staging / "java/lang" / source.name
        shutil.copyfile(source, destination)
    destination = staging / "sun/text/resources/CollationDataIdentity.java"
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(identity, destination)
    patch = output / "patch/java.base"
    patch.mkdir(parents=True)
    run([javac, "-implicit:none", "--patch-module", f"java.base={staging}",
         "-d", patch, *sorted(staging.rglob("*.java"))])
    data_root = base / "jdk/internal/icu/impl/data"
    shutil.copytree(data_root, patch / "jdk/internal/icu/impl/data")

    ld_sources = sorted((ld / "sun/text/resources/ext").glob("CollationData*.java"))
    ld_staging = output / "source/jdk.localedata"
    ld_staging.mkdir(parents=True)
    for source in ld_sources:
        destination = ld_staging / source.relative_to(ld)
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, destination)
    ld_patch = output / "patch/jdk.localedata"
    ld_patch.mkdir(parents=True)
    run([javac, "--patch-module", f"jdk.localedata={ld_staging}",
         "-d", ld_patch, *sorted(ld_staging.rglob("*.java"))])

    manifest = metadata / "sources.sha256"
    bundles = metadata / "bundles.txt"
    vm_args = ["--patch-module", f"java.base={patch}", "--add-modules", "jdk.localedata",
               "--patch-module", f"jdk.localedata={ld_patch}",
               "--add-opens", "java.base/java.text=ALL-UNNAMED",
               "--add-opens", "java.base/sun.util.locale.provider=ALL-UNNAMED",
               "--add-exports", "java.base/sun.text.resources=ALL-UNNAMED",
               "--add-exports", "jdk.localedata/sun.text.resources.ext=ALL-UNNAMED"]
    (output / "java.args").write_text("\n".join('"' + x.replace('\\', '\\\\').replace('"', '\\"')
        + '"' for x in vm_args) + "\n", encoding="utf-8")
    data = output / "data"
    run([java, *vm_args, "-cp", tools,
         "build.tools.generatecollation.GenerateCollationTables",
         data, bundles, manifest])
    shutil.copytree(data / "java.base", patch, dirs_exist_ok=True)
    shutil.copytree(data / "jdk.localedata", ld_patch, dirs_exist_ok=True)
    if args.test:
        test = root / "test/jdk/java/text/Collator/GeneratedTablesTest.java"
        run([javac, "-d", tools, test])
        run([java, *vm_args, "-Xmx512m", "-Djava.locale.providers=CLDR", "-cp", tools,
             "GeneratedTablesTest", "--require-generated"])
        run([java, "--limit-modules", "java.base", "--patch-module", f"java.base={patch}",
             "--add-opens", "java.base/java.text=ALL-UNNAMED", "-cp", tools,
             "GeneratedTablesTest", "--base-only"])
        no_tables = output / "patch-no-tables/java.base"
        shutil.copytree(patch, no_tables, ignore=shutil.ignore_patterns("collation-*.bin"))
        no_ld_tables = output / "patch-no-tables/jdk.localedata"
        shutil.copytree(ld_patch, no_ld_tables, ignore=shutil.ignore_patterns("collation-*.bin"))
        # Root has a stale input identity; every other table is absent.
        filename = next((patch / "sun/text/resources").glob("collation-*.bin")).name
        corrupt = bytearray((patch / "sun/text/resources" / filename).read_bytes())
        version_length = int.from_bytes(corrupt[8:12], "big")
        corrupt[12 + version_length * 2 + 5] ^= 1
        (no_tables / "sun/text/resources" / filename).write_bytes(corrupt)
        fallback_args = [str(x).replace(str(patch), str(no_tables))
                        .replace(str(ld_patch), str(no_ld_tables)) for x in vm_args]
        run([java, *fallback_args, "-Xmx512m", "-Djava.locale.providers=CLDR", "-cp", tools,
             "GeneratedTablesTest", "--require-fallback"])
        service = tools / "META-INF/services/java.text.spi.CollatorProvider"
        service.parent.mkdir(parents=True)
        service.write_text("GeneratedTablesTest$Provider\n", encoding="utf-8")
        run([java, *vm_args, "-Djava.locale.providers=SPI,CLDR", "-cp", tools,
             "GeneratedTablesTest", "--spi"])
        repro = output / "repro"
        run([java, *vm_args, "-Djava.locale.providers=CLDR", "-cp", tools,
             "build.tools.generatecollation.GenerateCollationTables", repro, bundles, manifest])
        for file in repro.rglob("*"):
            if file.is_file() and file.read_bytes() != (data / file.relative_to(repro)).read_bytes():
                raise RuntimeError(f"Nondeterministic output: {file.name}")
        print("PASS deterministic resources/index/manifest in independent generator JVM", flush=True)
    print(f"Target-source patches and generated resources: {output}", flush=True)


if __name__ == "__main__":
    main()
