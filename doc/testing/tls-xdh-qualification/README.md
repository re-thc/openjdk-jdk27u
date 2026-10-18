# Fresh-process TLS probes

`NativeClientHelloProbe` exercises the first ClientHello of a new `SSLEngine`.
`NativeHandshakeProbe` creates client/server engines and completes an in-memory
handshake, application-data exchange and orderly close. Both validate constraint
callbacks. They accept three arguments:

| Argument | Values |
| --- | --- |
| Protocol | `TLSv1.2`, `TLSv1.3` |
| Constraints | `default`, `application` |
| XDH AlgorithmParameters provider | `absent`, `configured` |

The reusable probe sources are already available at
[commit 75f8e417](https://github.com/re-thc/openjdk-jdk27u/tree/75f8e417e2d998ccf3e00a409900bfcf26d0e000/doc/testing/tls-xdh-qualification).
Use these exact files together:

| Source | SHA256 |
| --- | --- |
| `NativeClientHelloProbe.java` | `9d7915abe0626997d332ae34c4e4ade15bcc75e215bb01c7050ba02075c18223` |
| `NativeHandshakeProbe.java` | `f4b89dc09c8272533856407fcad88a20856067d3b819799817d48a6c84126216` |

Use `test/jdk/sun/security/ssl/NamedGroup/CustomXDHParameters.java` from
[commit ba3bb8e2](https://github.com/re-thc/openjdk-jdk27u/blob/ba3bb8e2c1622ca6c65eebf51fcb020b20ecb229/test/jdk/sun/security/ssl/NamedGroup/CustomXDHParameters.java)
and `test/jdk/javax/net/ssl/templates/SSLContextTemplate.java` from
[commit fe381d6f](https://github.com/re-thc/openjdk-jdk27u/blob/fe381d6f56c2cd2e7f02dd572ffa74116ba6293b/test/jdk/javax/net/ssl/templates/SSLContextTemplate.java).
The latter uses PKCS12, which is required after the JKS removal. The helper
SHA256 values are respectively
`4360561c70e7fbdb46298ca00e259de555ac793353c0e1fe9c19abe3846dfb4f` and
`e62bde69acd042760c6a48189c3e8dc6f8b10ea38923212e004502e1aa8e28ea`.

Place the four sources in a separate fixture directory. With `CANDIDATE_JDK`
pointing to a full candidate image and `CLASSES` to an external output directory:

```bash
"$CANDIDATE_JDK/bin/javac" -J-XX:ActiveProcessorCount=4 -implicit:none \
  -d "$CLASSES" NativeClientHelloProbe.java NativeHandshakeProbe.java \
  CustomXDHParameters.java SSLContextTemplate.java
```

Use identical compiled fixtures with both full images. Compare clean native
server release images built with the same boot JDK, reference compiler, JVM
features, optimization/link flags, SDK/deployment settings and configure options.
Review complete build specs; equal compiler version strings alone are insufficient.
Preserve each image's default CDS configuration and generated security properties.

For `absent`, use an empty supplemental security-properties file and an image
whose built-in providers do not supply XDH AlgorithmParameters. For `configured`,
append `security.provider.N=CustomXDHParameters$XDHProvider` in the supplemental
file, where `N` is the next unused index after the image's positive, unique,
contiguous provider entries. Preserve existing providers, including Apple on
macOS. Pass the file with a single `=` in `-Djava.security.properties=...`.

Run each protocol/constraint/provider mode with `-ea -esa` and
`-Dpr25.functionalSmoke=true` first. The expected output is exactly
`Passed <probe> <protocol> <constraints> <profile>` and exit zero. A smoke call
does not replace the relevant jtreg regression tests described in [testing.md](../../testing.md).

For an individual measured invocation, `JDK` selects one full image and
`SECURITY_PROFILE` selects the supplemental file matching the final argument:

```bash
LC_ALL=C /usr/bin/time -p "$JDK/bin/java" -XX:ActiveProcessorCount=4 \
  "-Djava.security.properties=$SECURITY_PROFILE" -cp "$CLASSES" \
  NativeClientHelloProbe TLSv1.3 application absent
```

Capture JSON stdout, time/stderr and exit status separately outside the source
and image directories. Stop on nonzero exit, malformed JSON, unexpected stderr,
wrong callbacks or failed protocol/group checks. Check the record immediately.

Process wall time covers Java launch through exit, including class/provider
initialization, TLS work, validation, formatting and shutdown. `total_ns` starts
after fixture static initialization and argument setup; it covers context/engine
setup and the first wrap or handshake/data/close loop. Callback-body time excludes
the preceding service lookup and SPI initialization. Neither wall-only gain nor
operation-only gain establishes an application's time-to-first-TLS readiness.

Choose the host/profile, finite sampling and decision rules before measurement.
Pair baseline/candidate invocations, alternate order and interleave baseline/
baseline controls. Retain all samples and native wall-clock precision. Fresh JVMs
do not imply cold filesystem caches. Keep campaign schedules, analysis controllers
and raw evidence outside the product PR. Before execution, verify the selected
runner's ordinary hard job limit and cancellation; a shell admission deadline or
operator interrupt does not provide an enforced overall bound.
