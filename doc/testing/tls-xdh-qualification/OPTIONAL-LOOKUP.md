# Optional XDH parameter lookup prototype

This source-only prototype removes the exception and backtrace created for an
ordinary missing XDH AlgorithmParameters service at each application constraint
check. It also avoids the legacy two-element Object array on successful optional
lookups. It retains live provider discovery, fresh parameters and application
callbacks. It does **not** establish that the application-constraints startup
regression is resolved. The potentially dominant cold provider initialization
remains, and this prototype has not been built, tested or timed.

## Compared sources and existing evidence

The comparison uses three pinned source revisions:

| Source | Commit | Relevant behavior |
| --- | --- | --- |
| Historical measurement baseline | [`6d264328aefdc3ceff659360ead6567a8e36190c`](https://github.com/re-thc/openjdk-jdk27u/commit/6d264328aefdc3ceff659360ead6567a8e36190c) | NamedGroup constructor attempts XDH parameters, falling back to KeyAgreement; permission checks reuse the constructor result. |
| Current upstream jdk27u, inspected 2026-10-16 | [`51e3f083cf7221cea633e80df6d3b8d7f82f55e8`](https://github.com/openjdk/jdk27u/commit/51e3f083cf7221cea633e80df6d3b8d7f82f55e8) | NamedGroup, AlgorithmParameters and GetInstance are byte-identical to the historical baseline files. |
| Qualified consolidation, parent of this prototype | [`75f8e417e2d998ccf3e00a409900bfcf26d0e000`](https://github.com/re-thc/openjdk-jdk27u/commit/75f8e417e2d998ccf3e00a409900bfcf26d0e000) | Default constraints avoid XDH parameter discovery; available XDH groups perform ordinary JCA discovery and initialize fresh parameters for each application check. |

The saved PR25 description reports a first-ClientHello difference of +6.8 ms
[+3.3, +19.7] against the historical baseline, from 30 alternating paired fresh
JVMs on a shared four-vCPU machine with equivalently configured release images.
It separately reports improvements to default context initialization, supported
parameters and a complete loopback handshake. Those are different operations;
they cannot be added to infer an application-constraints total. The historical
implementation retained a per-group lookup result. Neither those measurements
nor their confidence interval describe the later per-call qualified source or
this prototype. The original per-sample result packet is referenced by its saved
hash but is not available in this checkout, so no new statistical attribution
is made.

The completed GCC 14.2.0 fastdebug qualification belongs to production/test tree
`168bc21b7beb48774d49ee52ea506cc849f0f3f4`, consolidated by the parent above.
It includes all 116 selected jtreg descriptions, 16 functional cases, four
provider-load observations, callback-update and eight transformation cases.
Those results are recorded in [README.md](README.md); none qualify this changed
production/test tree. The provider-load observations are class-definition
observations, without timings or proof that every provider constructor succeeded.
Application constraints defined all seven observed late provider classes in the
absent profile. Default constraints defined none. No new runtime batch has run
for this prototype.

## Actual call path and cost

ClientHello production in `SupportedGroupsExtension.CHSupportedGroupsProducer`
checks configured groups using `NamedGroup.isPermitted`. Handshake activation
and selection can also call the same permission method through
`NamedGroup.isActivatable` and `getPreferredGroup`. The existing per-type
activation status map in HandshakeContext is unchanged.

`NamedGroup.isPermitted` first invokes the application's group-name constraint
callback. If it permits the group, the algorithm-level callback receives the
result of `getKeAlgParams`. Java evaluates that argument before entering the
callback, so a callback-body timer excludes provider discovery, SPI construction
and parameter initialization. The historical manual probe's callback-body
metric cannot locate those costs. Its context setup, engine setup and first-wrap
boundaries also distinguish a phase shift from a change in end-to-end work.

For an available XDH group under application constraints, the qualified source
calls:

```
AlgorithmParameters.getInstance("XDH")
  Security.getImpl -> Security.getSpiClass
  GetInstance.getInstance
    Providers.getProviderList
    ProviderList.getService (preferred entries, then configured providers)
    absent: construct NoSuchAlgorithmException and fill its backtrace
  NamedGroup catches the exception and supplies null to the callback
```

The prototype uses:

```
SharedSecrets.getJavaSecurityAlgorithmParametersAccess().getInstanceOrNull("XDH")
  AlgorithmParameters.getInstanceOrNull
  Security.getImplOrNull -> unchanged Security.getSpiClass
  GetInstance.getInstanceOrNull
    same provider-list snapshot, first-service lookup and fallback sequence
    absent: return null
    present: construct and validate a fresh SPI
  construct the exact AlgorithmParameters base class for a selected SPI
  NamedGroup initializes it with this group's specification, then calls constraints
```

The public AlgorithmParameters factories remain unchanged. The no-provider
GetInstance entry point shares the nullable implementation and still throws the
same missing-algorithm exception/message when its caller requires a result.
That adds a small wrapper invocation to other users of that entry point; its
cold-start impact has not been measured. No service queries are added or removed.
Construction failure still uses the original ProviderList snapshot and skips the
first failed Service object by identity. A null result means the initial service
lookup advertised no service; malformed or failing advertised services retain
normal construction failover and exceptions.

| Work | Prototype effect |
| --- | --- |
| Cold configured-provider discovery and constructor execution | Preserved. A constructor or initial class transformer may supply XDH. |
| Per-callback virtual getService, ordering, aliases and preferred entries | Preserved, including a service that changes without registration mutation. |
| Ordinary-miss exception, message and native backtrace | Removed from the optional path. |
| Two-element Object array from Instance.toArray | Avoided on successful optional lookup only; the old miss path never allocated it. |
| Fresh wrapper/SPI, group-specific initialization, application callbacks | Preserved. |
| Internal bridge | One new interface and SharedSecrets field; one existing accessor class/object is replaced, not supplemented. |

Security registers the same fieldless private static SecurityAccess instance for
both its existing properties secret and the new parameters secret. The new
getter initializes Security, not AlgorithmParameters. AlgorithmParameters gains
no static initializer or accessor allocation, so ordinary EC parameter use does
not register a second object. The accessor and both interfaces contain no fields,
consistent with SharedSecrets' stateless AOT requirement. Security.getSpiClass
and its existing Class.forName initialization are preserved; using a class
literal would change initialization timing. These are source observations,
not executed CDS/AOT or cold-start verification.

## Semantic boundaries and rejected alternatives

No positive or negative discovery result, parameter object or constraint decision
is cached. Provider-list identity does not capture mutable services/aliases or a
virtual getService override. A miss retained even for one ClientHello would hide
a provider installed by an earlier callback, as callback-update demonstrates.
A successful parameter object also carries mutable initialized SPI state and
must not be reused across groups or callers.

A whitelist of known JDK provider names, modules or services cannot safely avoid
cold discovery. The existing initial-transformation fixture adds XDH inside the
real SunSASL constructor in an unpatched module. Provider identity and module
location therefore cannot prove absence. Eager discovery would move this cost
back to default startup and would still not replace subsequent live queries.

A preliminary service-presence scan followed by the public factory would query
providers twice. An iterator-only rewrite would alter the established first
lookup/fallback sequence for dynamic providers. A lazy parameter proxy or
AlgorithmParameters subclass would change null/non-null observations or the
runtime class exposed to application constraints. None is used.

An InvalidParameterSpecException during initialization still supplies null and
does not select another provider. Advertised-service construction failures keep
NoSuchAlgorithmException failover. Unchecked provider failures propagate. Group
availability remains the existing initialization-time decision; this change does
not add dynamic group availability.

## Added regression tests and validation status

The new tests are source-only and **unrun**:

- `sun/security/jca/AlgorithmParameters/OptionalParameters.java` compares public
  and optional virtual-service query/construction traces; checks changing
  virtual services, malformed SPI failover, unchecked construction exceptions,
  same-list fallback after a constructor changes the current list, aliases,
  exact runtime class, fresh initialized instances and thread-local provider lists.
- `OptionalParametersExceptions.java` uses the JFR JavaExceptionThrow event,
  with an unchanged public-factory miss as a positive control, to detect a
  discarded missing-algorithm exception in the optional path. It has no timing
  assertion and requires JFR.
- `ChangingXDHParameters dynamic-service` changes a virtual service without
  provider/service registration, including during an earlier callback of the
  same ClientHello. Existing callback-update, mutable alias/service, preferred,
  concurrency, availability, error, provider fallback and eight transformation
  cases remain required.

Static internal review and `git diff --check` do not substitute for compilation
or jtreg. Future qualification needs a newly authorized runtime budget and a new
image from this exact candidate tree. With the managed boot JDK, jtreg and
reference compiler described in README.md, include these additional selectors:

```
test/jdk/sun/security/jca/AlgorithmParameters/OptionalParameters.java
test/jdk/sun/security/jca/AlgorithmParameters/OptionalParametersExceptions.java
```

Then repeat every mode in the five focused descriptions and the recorded
functional/secondary selections, using assertions and preserving nested skips.
The new ChangingXDHParameters mode makes the parent branch's focused action
count obsolete for this candidate. Existing parent images must not be used to
claim the new internal API compiled or the tests passed. NativePRNGFallback
remains unrun under the existing device/security restrictions; this prototype
needs no restricted device action.

The recommendation is to qualify this narrow prototype before integration. It
removes avoidable absence handling while preserving the required live work.
Whether it materially improves the application-constraints startup regression
requires separate, explicitly authorized matching-compiler measurements against
the pinned baseline and qualified parent, with context/engine/wrap/total scopes
reported separately. No speedup, matched-compiler performance result or final
startup-regression resolution is claimed here.
