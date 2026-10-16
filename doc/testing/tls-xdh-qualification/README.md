# TLS XDH constraint qualification

The TLS implementation uses ordinary JCA discovery for each application constraint check of an available XDH group. It initializes fresh parameters for that group. This preserves provider configuration, ordering, aliases, mutable services, fallback, exceptions and initial class instrumentation. Default JDK constraints retain the fast path that avoids an unsupported XDH parameter lookup.

The production and regression-test sources are the reviewed reconstruction of public parents `fe381d6f56c2cd2e7f02dd572ffa74116ba6293b` and `de359971a1972f74866e963fb4f750359aecc145`, plus the eight-file follow-up. Before adding these reproduction assets, that complete source tree is `168bc21b7beb48774d49ee52ea506cc849f0f3f4`. This review branch consolidates those sources in a linear commit; it does not merge either PR.

Live lookup has a cost. With application constraints, an absent XDH AlgorithmParameters service can cause normal JCA discovery to load otherwise unused providers. Subsequent checks also query services and initialize fresh parameters. A cache based on provider-list identity misses service and alias changes; a per-ClientHello miss cache hides a provider installed by an earlier callback. Passing correctness tests does not establish startup latency equivalence or resolve this integration tradeoff. The manual probe sources live outside the jtreg test root so their historical annotations do not add new suite selections. The probes below collect functional markers and class definitions, with timing output disabled. Class loading is not a latency measurement or proof that a provider constructor succeeded.

Before the build or first fixture compilation, reject inherited JVM and launcher overrides:

```bash
set -euo pipefail
for variable in JAVA_TOOL_OPTIONS JDK_JAVA_OPTIONS _JAVA_OPTIONS JDK_JAVAC_OPTIONS JTREG_JAVA_OPTIONS JTREG_JAVA JTREG_HOME JT_JAVA JT_HOME; do
  if [[ -n "${!variable:-}" ]]; then
    printf 'Unexpected JVM/launcher override: %s\n' "$variable" >&2
    exit 1
  fi
done
```

## Build or reuse a fastdebug image

Use existing, managed build dependencies described in `doc/building.md`, a boot JDK 27, jtreg 8.3, and the repository's reference GCC 14.2.0. Keep warnings as errors. Set absolute paths to your installed dependencies; there are no private handoff inputs:

```bash
set -euo pipefail
export BOOT_JDK=/absolute/path/to/boot-jdk-27
export JTREG=/absolute/path/to/jtreg-8.3
test "$(/usr/bin/gcc -dumpfullversion)" = 14.2.0
test "$(/usr/bin/g++ -dumpfullversion)" = 14.2.0
CC=/usr/bin/gcc CXX=/usr/bin/g++ bash configure \
  --with-conf-name=tls-fastdebug-gcc14 \
  --with-debug-level=fastdebug \
  --with-jvm-variants=server \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG"
make CONF=tls-fastdebug-gcc14 JOBS=4 images
export JDK="$PWD/build/tls-fastdebug-gcc14/images/jdk"
```

Apply platform-specific dependency options, such as a managed sysroot, only when your existing build setup requires them. Do not suppress compiler warnings. An existing image must be from the same production and regression-test sources. The recorded qualification reused its GCC 14.2.0 fastdebug image and did not rebuild it.

## Functional and provider-load cases

From the repository root, use a fresh absolute output directory. Check available process, memory and disk headroom first. Keep the test workload within 25 minutes, retaining five more minutes for cleanup and evidence. Run no more than four test workers. Stop at a failed test, failed admission, security denial or deadline; do not retry automatically.

```bash
set -euo pipefail
export OUT=/absolute/path/to/new-tls-results
mkdir "$OUT"
Q="$PWD/doc/testing/tls-xdh-qualification"
mkdir "$OUT/classes"
"$JDK/bin/javac" -J-XX:ActiveProcessorCount=4 -implicit:none \
  -d "$OUT/classes" \
  "$Q/NativeClientHelloProbe.java" "$Q/NativeHandshakeProbe.java" \
  test/jdk/sun/security/ssl/NamedGroup/CustomXDHParameters.java \
  test/jdk/javax/net/ssl/templates/SSLContextTemplate.java
: > "$OUT/absent.security"
# The qualified image has contiguous security.provider.1 through .12.
# Verify that condition before using the next entry, 13.
printf '%s\n' 'security.provider.13=CustomXDHParameters$XDHProvider' \
  > "$OUT/configured.security"
for protocol in TLSv1.2 TLSv1.3; do
  for constraints in default application; do
    for profile in absent configured; do
      for probe in NativeClientHelloProbe NativeHandshakeProbe; do
        label="$probe-$protocol-$constraints-$profile"
        "$JDK/bin/java" -XX:ActiveProcessorCount=4 -ea -esa \
          -Dpr25.functionalSmoke=true \
          "-Djava.security.properties=$OUT/$profile.security" \
          -cp "$OUT/classes" "$probe" "$protocol" "$constraints" "$profile" \
          > "$OUT/$label.log" 2>&1
        test "$(cat "$OUT/$label.log")" = "Passed $probe $protocol $constraints $profile"
      done
    done
  done
done
for constraints in default application; do
  for profile in absent configured; do
    label="provider-load-$constraints-$profile"
    "$JDK/bin/java" -XX:ActiveProcessorCount=4 -ea -esa \
      -Dpr25.functionalSmoke=true \
      "-Xlog:class+load=info:file=$OUT/$label.classes.log:none:filesize=0" \
      "-Djava.security.properties=$OUT/$profile.security" \
      -cp "$OUT/classes" NativeClientHelloProbe TLSv1.3 "$constraints" "$profile" \
      > "$OUT/$label.log" 2>&1
    test "$(cat "$OUT/$label.log")" = "Passed NativeClientHelloProbe TLSv1.3 $constraints $profile"
  done
done
```

There are 16 functional cases, split between ClientHello supported-group checks and full in-memory handshakes, and four additional provider-load observations. For default constraints, none of these seven late provider classes or the configured test provider should be defined: `org.jcp.xml.dsig.internal.dom.XMLDSigRI`, `sun.security.jgss.SunProvider`, `com.sun.security.sasl.Provider`, `sun.security.smartcardio.SunPCSC`, `sun.security.provider.certpath.ldap.JdkLDAP`, `com.sun.security.sasl.gsskerb.JdkSASL`, `sun.security.pkcs11.SunPKCS11`. For application constraints, `com.sun.security.sasl.Provider` must be defined; `CustomXDHParameters$XDHProvider` must be defined exactly when the configured profile is used. Preserve all observed late-provider names, rather than treating their appearance as a timing result.

## Assertion-enabled jtreg selection

The seven selector files contain 116 distinct descriptions. The focused file includes every declared mode of CustomXDHParameters, ChangingXDHParameters, XDHProviderFallbacks, TransformedXDHParameters and NoUnusedProviderLoad. ChangingXDHParameters includes its callback-update action; the transformation driver must report eight individual successful cases. Keep their own JTR evidence.

Reject inherited JVM or launcher overrides (`JAVA_TOOL_OPTIONS`, `JDK_JAVA_OPTIONS`, `_JAVA_OPTIONS`, `JDK_JAVAC_OPTIONS`, `JTREG_JAVA_OPTIONS`, `JTREG_JAVA`, `JTREG_HOME`, `JT_JAVA`, `JT_HOME`) before the run. Use an installed NSS library for the selected PKCS11 cases; below is the conventional Debian x86_64 location. No dependency download is part of the qualification.

```bash
export NSS_LIB_DIR=/usr/lib/x86_64-linux-gnu
for batch in focused secure-random cacerts-curves pkcs12-blowfish crypto-key-spec other-security dtls; do
  tests=()
  while IFS= read -r selector; do
    tests+=("$PWD/test/jdk/$selector")
  done < "$Q/selectors/$batch.txt"
  JAVA_HOME="$BOOT_JDK" "$JTREG/bin/jtreg" \
    "-jdk:$JDK" "-w:$OUT/$batch/work" "-r:$OUT/$batch/report" \
    -conc:4 -timeoutFactor:2 -v:summary -retain:all \
    "-javaoptions:-XX:ActiveProcessorCount=4 -ea -esa -Djdk.test.lib.artifacts.artifactmanager=jdk.test.lib.artifacts.DefaultArtifactManager -Djdk.test.lib.artifacts.nsslib-linux_x64=$NSS_LIB_DIR" \
    "${tests[@]}"
done
```

Read each action's result and skip diagnostics, not just the description's final Passed status. In particular, unsupported Blowfish in NSS is a skip. NativePRNGFallback and all eight of its device/seccomp/namespace modes are excluded from this environment; do not build its native fixture or work around those restrictions. The originally selected PKCS12 interoperability ID is `UseExistingPKCS12`; `GenerateOpensslPKCS12` is excluded. Unsupported OpenSSL/provider/device modes remain skipped or unrun. No benchmark, header/archive determinism probe, release rebuild, OS/security setting change, hosted workflow or PR merge is included.

## Recorded result

The single approved continuation completed in about 23 minutes, within the 30-minute overall / 25-minute workload bounds and four-worker limit. It reused the existing GCC 14.2.0 Linux x64 fastdebug image, with assertions enabled. The exact source tree and complete image remained unchanged. No rebuild, retry, benchmark or hosted workflow was used.

All 16 functional cases, all four provider-load observations and all 16 focused jtreg actions passed. Callback-update has its own passed action; all eight transformation cases exited successfully.

All 116 selected jtreg descriptions completed with no failed description:

| Coverage | Descriptions | Actions |
| --- | ---: | ---: |
| Passed without actual test skips | 112 | 204 |
| Passed with partial nested coverage | 3 | 3 |
| Fully skipped | 1 | 1 |

The nested omissions are recorded separately from passes:

* ECDHPrimitive passed 75 vectors; 300 vectors across 12 curve groups were omitted by its fixed curve map.
* ECDSAPrimitive passed 180 vectors; 540 vectors across 36 curve/digest groups were omitted because their curves are outside its fixed map. Its cascading “Unknown digest” diagnostics do not mean SHA-224/256/384/512 are unavailable; all four ran on supported curves.
* TestEC passed 63 TLSv1.2 cipher/authentication combinations and skipped nine combinations involving TLS1.3-only cipher suites in TLSv1.2. No timeout-ignore messages occurred.
* TestBlowfishRetained was fully skipped because SunPKCS11-NSS lacks Blowfish.

Seven additional automatic skip flags were fixture-reuse messages in SecurityProviderModularTest. Source and output review confirmed that all eight actions ran all 88 scenario checks. The original conservative diagnostic scan remains unchanged in local evidence; this table distinguishes reused setup from skipped test execution.

The eight NativePRNGFallback modes remain unrun under the preserved security restrictions. The unselected OpenSSL generation mode was not run. Existing release evidence used GCC 16.2 and is separate from this GCC 14.2.0 fastdebug assertion profile. No matched-compiler performance claim is made. The application-constraints startup tradeoff described above remains unresolved.
