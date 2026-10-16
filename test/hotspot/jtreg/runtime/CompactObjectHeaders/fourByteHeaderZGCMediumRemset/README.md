# Medium relocation parser inputs

`normal.txt` and `inplace.txt` are synthetic transcripts for
`FourByteHeaderZGCMediumRemsetParser`. They are parser inputs, not runtime
qualification evidence. The inputs cover different heap bases, page sequence
transitions, correlated medium-owner movement and hash growth, remembered-set
migration, and subsequent young-child movement.

`mutations.json` describes independent edits of these two inputs. Each mutation
starts from its original base; cases are never chained. The manifest contains
48 specifications, expanded over the named bases into 95 cases. With the two
base inputs, the parser test requires 97 outcomes: four acceptances (including
two delayed timer-completion summaries) and 93 rejections.

The edits cover incomplete or extra collections, missing and duplicate records,
wrong phases, source pages, GC IDs, generation tags, heap bases, field slots,
object sizes and hashes, unchanged child addresses, absent compiler directives,
and invalid small-page admission or selection.

The manifest defines exact edit-target counts. Its regular expressions use the
shared Java/Python subset; replacements use literal text and `\g<N>` group
references, translated by the test driver. Edit failures and unexpected parser
exceptions fail the test. Only an assertion raised by the evidence parser can
satisfy an expected rejection. Synthetic correlation output is captured and
never presented as runtime path evidence.

The parser test runs with jtreg using its default `test.src` data location. Its
main method also accepts an explicit path to this directory for standalone
offline validation. It does not invoke the runtime fixture or create child JVMs.
