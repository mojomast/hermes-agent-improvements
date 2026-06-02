# Hermes Agent Improvements

A focused patch-set repo for the Hermes Agent self-improvement work: local-first web search, safer delegation, leaner prompts, deterministic routing evals, prompt-budget telemetry, and training-episode infrastructure.

This repository is designed for maintainers who want to review or apply the improvements as scoped commits without pulling in generated artifacts or unrelated worktree state.

## What is included

### Local-first web search fallback

- Adds a keyless DuckDuckGo/local web-search fallback path.
- Lets Hermes keep web research available when paid/API-backed providers are unavailable.
- Includes focused tests for backend selection, no-key behavior, local fallback execution, and error handling.

Patch:

```text
0008-web-add-local-duckduckgo-search-fallback.patch
```

### Prompt budget telemetry

- Records prompt/token-budget bucket counts for diagnostics.
- Persists aggregate counts rather than prompt/message content.
- Adds database/state coverage and focused telemetry tests.

Patch:

```text
0009-telemetry-record-prompt-budget-token-buckets.patch
```

### Lazy skills / lean prompt defaults

- Changes default skills context toward lazy loading.
- Reduces prompt bloat while keeping skills discoverable when needed.
- Updates prompt-builder, config, and run-agent defaults with regression coverage.

Patch:

```text
0007-context-default-skills-prompt-to-lazy-loading.patch
```

### Safer delegate/subagent tool scoping

- Centralizes child-agent toolset narrowing in one helper.
- Prevents capability scoping logic from being duplicated across delegate paths.
- Adds targeted regression tests for allowed, inherited, narrowed, and empty child toolsets.

Patch:

```text
0006-delegate-centralize-child-toolset-scoping.patch
```

### Deterministic task-router evaluation harness

- Adds a reusable task-router evaluation module.
- Includes JSONL fixtures plus CLI/benchmark scripts for routing experiments.
- Provides targeted tests for classification, configuration evaluation, and deterministic scoring.

Patch:

```text
0005-routing-add-deterministic-task-router-evaluation-har.patch
```

### Trace episodes and semantic coding primitives

- Adds primitives for capturing training/self-improvement episodes.
- Introduces semantic coding structures that can support later analysis and retrieval workflows.
- Establishes infrastructure used by later replay/evaluation work.

Patch:

```text
0001-feat-add-trace-episodes-and-semantic-coding-primitiv.patch
```

### Privacy-hardened self-improvement paths

- Strengthens redaction behavior around self-improvement data flows.
- Reduces risk of leaking sensitive local paths, credentials, or user-specific details into persisted/evaluated artifacts.

Patch:

```text
0002-fix-harden-self-improvement-privacy-redaction.patch
```

### Training episode replay evaluation

- Adds evaluation support for replaying and checking training episodes.
- Helps turn prior agent traces into measurable behavior/regression checks.

Patch:

```text
0003-feat-add-training-episode-replay-eval.patch
```

### Episode retrieval behavioral hints

- Adds behavioral hints to improve training-episode retrieval and reuse.
- Supports better matching between current task context and prior useful episodes.

Patch:

```text
0004-feat-add-episode-retrieval-behavioral-hints.patch
```

## Apply the patches

From a clean Hermes Agent checkout:

```bash
/path/to/hermes-agent-improvements/apply-patches.sh /path/to/hermes-agent
```

Or manually:

```bash
cd /path/to/hermes-agent
git am /path/to/hermes-agent-improvements/patches/*.patch
```

Patch application order is recorded in:

```text
patches/series
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

## Focused verification

Representative targeted checks for these slices:

```bash
venv/bin/python -m pytest tests/agent/test_prompt_budget.py tests/test_diagnostic_telemetry.py -q -o 'addopts='
venv/bin/python -m pytest tests/tools/test_local_web_tools.py tests/tools/test_web_tools_config.py::TestBackendSelection tests/tools/test_web_tools_config.py::TestCheckWebApiKey tests/tools/test_web_tools_config.py::TestWebSearchErrorHandling -q -o 'addopts='
venv/bin/python -m pytest tests/agent/test_prompt_builder.py tests/run_agent/test_run_agent.py -q -o 'addopts='
venv/bin/python -m pytest tests/tools/test_delegate_toolset_scope.py -q -o 'addopts='
venv/bin/python -m pytest tests/agent/test_task_router.py tests/agent/test_task_router_eval.py -q -o 'addopts='
```

After applying patches in a full checkout, rerun the focused tests for the slices you apply.

## Repository layout

```text
README.md          This overview
IMPROVEMENTS.md    Patch-by-patch summary and verification notes
apply-patches.sh   Helper script for applying the series
patches/           git-format-patch files plus patches/series
```

## Notes

- The repo is intentionally compact and reviewable.
- Generated artifacts are not included.
- Each improvement remains split into a scoped patch for selective review or application.
