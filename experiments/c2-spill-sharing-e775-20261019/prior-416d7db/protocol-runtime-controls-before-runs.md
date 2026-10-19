# Runtime-control diagnosis, fixed before new measurements

The independent confirmation preserved a dense-decoder gain: +4.338%, 95%
interval +1.727% to +6.396%. All 24 original/confirmation pairs give +5.917%,
stratified interval +4.942% to +7.171%. Array copy remains -1.941%, interval
-4.695% to -0.729%; retain this adverse observation.

The actual JMH array-copy C2 loop is identical after masking relocations:
154 nonpadding instructions, four stack reads, fifteen stack writes, ten
mov-family register moves and an 80-byte frame. Register operands, stack
offsets and small constants match. Both call jbyte_disjoint_arraycopy_stub.
No additional allocator transport explains the copy result.

Two observed runtime differences are the separate generated CDS archives
and unequal installation-path lengths (69 versus 70 characters for java).
Both archives load successfully. Diagnose these nuisance factors instead
of selecting more favorable pairs under the original setup.

Copy each complete release image without modifying its files to equal-length
matched-a and matched-b installation paths. Verify every file hash and every
symlink against its source. Run exactly twelve new independent paired JVMs
per cell for dense decode and array copy in each of two fixed settings:
- CDS required on: -Xshare:on.
- CDS disabled: -Xshare:off.

Retain all other JVM/JMH/input settings: affinity 0-3, one thread, SerialGC,
512 MiB heap, ActiveProcessorCount=4, three one-second warmups and five
one-second measurements. Interleave the two cells by pair and alternate
AB then BA. Execute the CDS-on setting first, CDS-off second; each has six
AB and six BA pairs per cell. Exactly 96 new forks; no retries or score-based
extensions. Analyze each setting separately with the existing median paired
ratio and paired bootstrap estimator. Do not pool these different settings
with the original default-CDS observations or hide their adverse control.

This is a different runtime setup, not a compiler revision or an application
change. It tests whether the observed decoder benefit survives removal of
runtime-layout differences, and whether the untouched copy control follows
those differences. It does not establish a hardware-level cause by itself.
