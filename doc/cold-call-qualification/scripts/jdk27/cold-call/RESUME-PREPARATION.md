# Exact pre-measurement launcher repair

This portable continuation is source for independent review. Do not execute it
before the review release. It creates no new build and changes no workload,
measurement count, sample duration, source revision or acceptance gate.

The original controller stopped only at `installed-jtreg-version`, after all
three matched builds and full image inventories. The installed jtreg shell
launcher tests the literal path `java` when no selector is set. The sole host
configuration correction adds `JTREG_JAVA`, pointing to the same installed boot
JDK 27. The original frozen configuration and stopped evidence remain intact.

`resume_preparation.py` accepts only the exact SHA256-bound stopped manifest,
old configuration, repaired configuration and three full image inventories.
Those private identities live only in a separate local receipt, whose SHA256
must be pinned by the independent release. `resume-receipt.example.json` defines
its schema with placeholders; it contains no host records or usable approval.
The receipt and host configurations are never included in source publication.
It rechecks every historical command log, image file/symlink, release metadata,
generated spec, original source head/cleanliness and frozen qualification source.
It uses the original ordinary worktrees in place, with explicit aliases in a
fresh output directory solely for the unchanged diagnostic layout. It copies
no image and never invokes configure or make. The old failure remains visible
in the immutable parent and is referenced by the new controller.

The original UTC deadline remains **2026-10-17T14:31:01.403725+00:00**. The same
host's previously recorded monotonic deadline is retained as an additional
upper bound. Prior command time is debited from stage caps; repeated entry to
the current preparation phase cannot reset its clock, and completed stages
cannot be reentered. Source repair/review time is consumed by the original UTC
window. No deadline, matrix or stage-cap override exists. An exclusive claim in
the historical directory prevents two continuations from using this stop.

After independent GO, run once from the committed codec checkout:

```sh
python3 -u -B scripts/jdk27/cold-call/resume_preparation.py \
  --parent "$STOPPED_OUTPUT/campaign.json" \
  --config "$REPAIRED_FROZEN_CONFIG" \
  --receipt "$REVIEWED_LOCAL_RECEIPT" \
  --receipt-sha256 "$REVIEWED_RECEIPT_SHA256" \
  --output "$NEW_CONTINUATION_OUTPUT"
```

Keep the original published source checkout named by the stopped configuration
unchanged: its recorded head and manifest are historical sealed inputs. Copy
this complete published `scripts/jdk27` source directory into the clean codec
checkout, commit the qualification-only change with the required identity, and
review that commit before execution. Do not replace the old source checkout or
change any host-configuration field other than the explicit `JTREG_JAVA` fix.

The remaining orchestration is unchanged: readiness/provenance, corpus/helper
preparation, 15 safety selectors, six correctness/code captures, evidence-bound
pre-timing review, 81 throughput processes, 18 resource processes, four separate
source-profile diagnostics, and evidence-bound final review. The same original
twenty-minute combined review limit and all numerical/resource gates apply.
Historical and current provenance are rechecked at both gates. No stopped or
partial continuation is automatically resumed. No publication or CI follows.

Offline tests use only the standard library; subprocess creation is prohibited:

```sh
python3 -B -m unittest discover -s scripts/jdk27/cold-call -p 'test_*.py' -v
```
