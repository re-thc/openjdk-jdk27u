# Adler32 call selection

Adler32 uses the configured ZIP backend through three distinct call paths:

- A C1 intrinsic emits a native leaf call inside the compiled method.
- A default native invocation can pass through the c2i adapter to the interpreter
  Adler32 entry, which calls the `ZIP_Adler32` leaf.
- With `-XX:-UseAdler32Intrinsics`, the native invocation uses the JNI function.

Apple AArch64 C1 uses the same runtime-leaf lowering as other AArch64 CPUs.
`call_runtime` selects the C argument convention; `LIR_OpRTCall` is marked as a
call, and linear scan creates clobber intervals for all 32 FP registers from
`FrameMap`. The allocator therefore treats every FP register as clobbered at the
call. The C function must still obey the platform ABI for
reserved registers and stack alignment; this is not a custom register convention.
The `ZIP_Adler32` leaf calls that backend without entering Java or safepointing.

Disabling `UseZipIntrinsics` does not select an Adler32 call path.

A compiler log that reports a native-method decline does not establish the
machine-level entry address. Comparisons must distinguish the C1 leaf,
interpreter-entry and JNI paths rather than treating them as equivalent.

## Regression coverage

The tests in `test/hotspot/jtreg/compiler/intrinsics/zip/` cover:

- `TestC1DirectAdler32`: literal and volatile lengths, including 4095, 4096 and
  4097 bytes and smaller boundaries; offsets, seeds, incremental checksums and
  floating-point values retained across method-handle calls.
- `TestZlibNGAdler32`: public heap and direct-buffer updates, read-only buffers,
  positions and limits, nonzero seeds, boundary sizes and concurrent GC.
- `TestC1DirectAdler32CallShape`: a public direct-buffer update in the C1
  compilation holding floating-point values. Its Apple-specific configuration
  forces wrapper inlining with `C1MaxInlineSize=300` and `C1InlineStackLimit=100`.
  It requires a direct `invokestatic` intrinsic in the Adler-enabled C1 FP
  compilation and a native-method decline in the Adler-disabled JNI control.
  Outlined, wrong-route and method-handle call shapes fail. Parser
  fixtures run independently on all platforms.

The call-shape configuration is separate from the default-policy correctness
controls. A level-1 compilation assertion alone does not establish target
inlining. Compilation-log checks also do not prove a particular FP register,
spill sequence or machine-level native entry; those require code and relocation
inspection. Correctness tests do not measure performance.

## Running the tests

Build the JDK with jtreg configured, then set `JDK_CONF` to the build configuration
name and run from the repository root:

```sh
make CONF="$JDK_CONF" test \
  TEST="hotspot_jtreg:compiler/intrinsics/zip/TestC1DirectAdler32.java \
hotspot_jtreg:compiler/intrinsics/zip/TestC1DirectAdler32CallShape.java \
hotspot_jtreg:compiler/intrinsics/zip/TestZlibNGAdler32.java"
```

Run against release and fastdebug configurations as needed. The Apple call-shape
case requires native macOS AArch64 with C1 enabled; its parser tests are portable.
The test declarations include Adler-enabled and disabled checked-JNI cases.
