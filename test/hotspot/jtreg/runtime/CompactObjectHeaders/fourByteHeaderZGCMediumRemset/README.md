# Medium relocation parser inputs

`normal.txt` and `inplace.txt` are synthetic transcripts for
`FourByteHeaderZGCMediumRemsetParser`.

`mutations.json` describes independent edits of these two inputs. Each mutation
starts from its original base; cases are never chained.

Edit-target count errors and unexpected exceptions fail the test. Only an
assertion raised by the evidence parser can satisfy an expected rejection.
