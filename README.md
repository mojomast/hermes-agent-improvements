# Hermes Agent Improvements Patch Set

This repository intentionally contains **only the improvement artifacts**, not a full copy of the Hermes Agent source tree.

The previous contents accidentally mirrored the entire Hermes repo. This corrected repo is a compact patch-set repository that can be applied to an upstream/full Hermes checkout.

## Contents

- `patches/*.patch` — git-format-patch files for the scoped Hermes improvements.
- `patches/series` — patch application order.
- `IMPROVEMENTS.md` — summary of each improvement slice and focused verification.
- `apply-patches.sh` — helper to apply the patch series to a Hermes checkout.

## Apply to a Hermes checkout

From a clean Hermes Agent checkout:

```bash
/path/to/hermes-agent-improvements/apply-patches.sh /path/to/hermes-agent
```

Or manually:

```bash
cd /path/to/hermes-agent
git am /path/to/hermes-agent-improvements/patches/*.patch
```

## Patch list

```text
0001-feat-add-trace-episodes-and-semantic-coding-primitiv.patch
0002-fix-harden-self-improvement-privacy-redaction.patch
0003-feat-add-training-episode-replay-eval.patch
0004-feat-add-episode-retrieval-behavioral-hints.patch
0005-routing-add-deterministic-task-router-evaluation-har.patch
0006-delegate-centralize-child-toolset-scoping.patch
0007-context-default-skills-prompt-to-lazy-loading.patch
0008-web-add-local-duckduckgo-search-fallback.patch
0009-telemetry-record-prompt-budget-token-buckets.patch
```

## Notes

- No generated artifacts are included.
- No vendored Hermes source tree is included.
- The original upstream/full-repo history is not required to browse this patch set.
