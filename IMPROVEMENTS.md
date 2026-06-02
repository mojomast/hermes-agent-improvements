# Improvement Slices

These patches were extracted from committed Hermes self-improvement work and are meant to be applied to a full Hermes Agent checkout.

| Patch | Original commit | Slice | Summary |
|---|---:|---|---|
| `0001-feat-add-trace-episodes-and-semantic-coding-primitiv.patch` | `e56de502c` | Trace episodes / semantic coding | Adds trace episode and code-analysis primitives for self-improvement workflows. |
| `0002-fix-harden-self-improvement-privacy-redaction.patch` | `4238a7bad` | Privacy hardening | Hardens privacy redaction in self-improvement paths. |
| `0003-feat-add-training-episode-replay-eval.patch` | `92503c3bf` | Training replay eval | Adds evaluation support for training episode replay. |
| `0004-feat-add-episode-retrieval-behavioral-hints.patch` | `df7349aa7` | Episode retrieval hints | Adds behavioral hints to improve episode retrieval. |
| `0005-routing-add-deterministic-task-router-evaluation-har.patch` | `6c601d298` | Task router eval | Adds deterministic task-router evaluation tooling, fixtures, and tests. |
| `0006-delegate-centralize-child-toolset-scoping.patch` | `a11d40cd0` | Delegate scoping | Centralizes child toolset scoping and adds regression tests. |
| `0007-context-default-skills-prompt-to-lazy-loading.patch` | `d7cffad4a` | Lazy skills prompt | Defaults skills context toward lazy loading / lean prompt behavior. |
| `0008-web-add-local-duckduckgo-search-fallback.patch` | `438115413` | Local web fallback | Adds local DuckDuckGo/keyless web fallback with focused tests. |
| `0009-telemetry-record-prompt-budget-token-buckets.patch` | `7d34e5999` | Prompt budget telemetry | Records prompt-budget token buckets while avoiding persisted prompt content. |

## Focused verification previously run

Representative focused checks included:

```bash
venv/bin/python -m pytest tests/agent/test_prompt_budget.py tests/test_diagnostic_telemetry.py -q -o 'addopts='
venv/bin/python -m pytest tests/tools/test_local_web_tools.py tests/tools/test_web_tools_config.py::TestBackendSelection tests/tools/test_web_tools_config.py::TestCheckWebApiKey tests/tools/test_web_tools_config.py::TestWebSearchErrorHandling -q -o 'addopts='
venv/bin/python -m pytest tests/agent/test_prompt_builder.py tests/run_agent/test_run_agent.py -q -o 'addopts='
venv/bin/python -m pytest tests/tools/test_delegate_toolset_scope.py -q -o 'addopts='
venv/bin/python -m pytest tests/agent/test_task_router.py tests/agent/test_task_router_eval.py -q -o 'addopts='
```

Apply the patches in a clean full checkout and rerun the relevant targeted tests for the slices you use.
