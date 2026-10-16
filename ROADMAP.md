# Project roadmap and progress log

> **Canonical project plan.** Status last reviewed: **2026-10-17** (UTC+05).  
> Maintainer: **The88788**. Project: **DSH-FreeLLMAPI-Lab**.  
> This file is intended to live in the GitHub repository and be updated with every completed milestone.  
> Russian companion: [ROADMAP.ru.md](ROADMAP.ru.md). English is the canonical status source; translations should track it.

## Mission

Build a reproducible, independent community lab for improving **DeepSeek Harness (DSH) + dsh-camel + FreeLLMAPI** reliability, especially when provider quotas are restrictive or unpredictable. Measure **actual coding-task completion**, not only whether a short API request succeeds. Make diagnostics reproducible, configurations safe to copy, and community findings verifiable.

### Ground rules

- **Evidence before status.** `tested` means a reproducible check with stated limitations; `experimental` means the configuration is not yet proven on a real agent workflow.
- **Never publish raw DSH sessions, source code, credentials, private prompts, absolute private paths, or provider-account identifiers.** Publish only reviewed aggregate results and sanitized examples.
- **No unapproved deployments.** Configuration generators must only propose patches and show diffs; the maintainer decides whether to apply them.
- **Rate limits are multidimensional.** Distinguish per-request context/output caps from RPM, ITPM/TPM, daily quotas, wallet balance, cooldown, and provider failures.
- **A `completed` agent turn is not evidence that the task's acceptance criteria passed.** The task owner must verify the result.
- **Avoid provider churn.** Prioritize diagnosing and fixing request policy before recommending a new model.
- **Compatibility is versioned.** State DSH, Camel, FreeLLMAPI and operating-system versions whenever known; use `unknown` otherwise.

## Work board

### Stage 0: Baseline and scope (existing work)

- [x] Capture and analyze a historical dataset of **33 DSH sessions, 4,028 events**, covering 2026-10-15/16; identify layered retry, `RATE_LIMIT`, tool errors, and request-size failures. See [sanitized baseline](research/2026-10-16-baseline.md).
- [x] Confirm the installed Camel profile loads **8 adaptive route overrides**, with `retry.enabled: false` and no task-local override, using `/camel status` on 2026-10-17.
- [ ] Verify that the **active DSH provider retryPolicy** is the intended fail-fast or bounded variant after applying the revised DSH config. Camel status alone does not prove this.
- [ ] Run a small number of **real coding tasks** under the revised settings; record acceptance-test results and any manual model switching.

### Stage 1: Public v0.1 foundation

- [x] Draft the repository charter, progress file, templates, safety guidance, and sample configurations locally (2026-10-17).
- [x] Create the public GitHub repository **The88788/DSH-FreeLLMAPI-Lab** and upload the starter files (2026-10-17).
- [ ] Verify all links, Markdown files, example YAML, and README language navigation on GitHub.
- [ ] Review the English and Russian guides; ask a native Chinese reader to review the Chinese draft.
- [ ] Mark all initial configurations **EXPERIMENTAL** until real coding-task verification.
- [ ] Publish release/tag `v0.1.0` only after the public GitHub repository passes these checks.

**Exit criteria:** public repository is accessible, no secrets or private logs have been committed, multilingual landing pages work, methodology is documented, and the testable configs are clearly labelled experimental.

### Stage 2: Local session collection and analysis (v0.2)

- [ ] Implement `dsh-collect`: discover sessions from the configured DSH root (default `%USERPROFILE%\\.dsh\\sessions`), include `.jsonl` and `.jsonl.zstd` generations, avoid the known mistake of filtering **only** by last modification time, and track collection state.
- [ ] Add portable, reproducible **Zstandard decoding** and supported session schema/version checks. On unsupported formats, fail clearly instead of guessing.
- [ ] Implement redaction at the ingestion boundary: credentials, user prompts, source code, tool payloads and identifying paths never enter exported public reports by default.
- [ ] Implement `dsh-analyze` to count model attempts, tool calls, retry scheduling vs execution, time-to-first-tool, rate-limit classes, error taxonomy, cancellations, and per-session outcomes.
- [ ] Preserve distinguishability of errors caused by FreeLLMAPI cooldown vs real upstream requests when data allows; mark uncertainty otherwise.
- [ ] Add fixtures with **synthetic sanitized logs**, unit tests, and repeatable CLI commands.

**Exit criteria:** for a synthetic fixture and at least one private sample, local analysis produces reproducible aggregate summaries, no raw text leaks into public output, and reruns do not duplicate sessions.

### Stage 3: Configuration proposals and experiments (v0.3)

- [ ] Build `dsh-config` to inspect effective DSH/Camel configuration and emit **candidate patches plus a diff**, never silently overwrite live profiles.
- [ ] Validate YAML and schema compatibility for the detected DSH/Camel versions.
- [ ] Track actual effective `(DSH provider, model)` identities, including `gateway:<model id>` instead of inferring provider from a display name.
- [ ] Propose adaptive per-route request pacing from observed quota evidence; do not extrapolate from a single `429`.
- [ ] Separate hard request/input caps, context windows, output `maxTokens`, and RPM/TPM/RPD limits.
- [ ] Add `baseline -> candidate -> controlled real-task run -> compare -> accept/reject` workflow.
- [ ] Provide rollback guidance and maintain backups before local edits.

**Exit criteria:** candidate patch and rollback are reproducible; no config change happens automatically; at least one controlled run is compared with a baseline.

### Stage 4: FreeLLMAPI correlation (v0.4)

- [ ] Add opt-in import of sanitized FreeLLMAPI request logs / SQLite **read-only exports**.
- [ ] Correlate events using timestamps, model IDs, and permitted request metadata with confidence levels; do not claim that a match is proven without a stable identifier.
- [ ] Separate gateway-generated errors, provider errors, DSH request errors, and tool execution errors.
- [ ] Produce a provider/model reliability matrix with evidence count, test depth, measured quotas, and freshness date.

**Exit criteria:** at least one multi-layer incident is reconstructed without exposing secrets, and matching uncertainties are explicit.

### Stage 5: Community workflow and translations (v0.5)

- [ ] Add Issue forms for reproducible session failures, verified configuration reports, translation requests, and documentation bugs.
- [ ] Add CI checks: Markdown links, YAML sample structure, Python/PowerShell scripts, synthetic analyzer fixtures, and secret scans where possible.
- [ ] Publish an English source-of-truth glossary plus Russian and Simplified Chinese translations, with visible review state.
- [ ] Define compatibility and contributor evidence rules: environment/version/quota source/log excerpt redacted/test acceptance.
- [ ] Welcome additional language maintainers and record human reviews by version.
- [ ] Open a **small documentation PR** in FreeLLMAPI's `docs/en/clients/01-agent-clients.md`, if maintainers consider an independent community guide appropriate. Ensure the PR contributes useful DSH version-specific corrections, not only self-promotion.

**Exit criteria:** external contributors can submit comparable results with no access to private logs; translations and PRs have review instructions.

### Stage 6: Public stable methodology (v1.0)

- [ ] Demonstrate consistent, reproducible task-level improvements across several workloads and multiple runs.
- [ ] Publish stable/experimental configuration classification criteria and support matrix.
- [ ] Document limitations, upstream service terms, and fallback/rollback scenarios.
- [ ] Ship tagged v1.0 with tested installation, data safety, and contribution workflows.

## Initial validation protocol (proposed)

1. **Freeze baseline**: record sanitized DSH/Camel/FreeLLMAPI versions; store a private copy of the original configuration, plus the config checksum and date of change.
2. **Capture a task definition** with unambiguous acceptance criteria (e.g., modified files, unit tests, build checks). Record actual start/end and human interventions.
3. **Run a small test set**: short tool-use task, medium code-edit task, one longer task requiring checkpoints. Avoid sending the same expensive request through dozens of failing providers.
4. **Collect after each task**, locally: whether accepted, LLM failures grouped by code, DSH vs Camel retries, total wait, first useful tool latency, number of model switches, tool failures, and cost if measurable.
5. **Compare under similar conditions**. Distinguish changed model/quota/environment from the configuration change itself; don't call a single successful task statistically reliable.
6. **Approve or reject** the candidate. Record justification and whether a rollback is needed. Publish only sanitized aggregate results with limitations.

### Metric definitions

- **Task success rate**: tasks passing explicit human/automated acceptance checks ÷ assessed tasks. Do **not** substitute `turn/end: completed`.
- **Time to first tool**: from first agent model request to first useful tool call; missing first tool is separately classified.
- **Retry overhead**: number of retried requests, total wait time and provider calls where actually known; never infer upstream calls from local cooldown response counts.
- **Wasteful repetition**: duplicate failing tool calls without changed preconditions and retry of known permanent errors.
- **Token/cost efficiency**: per accepted task, only where input/output usage and pricing/credits are reliably available.

## Progress journal (append one dated item whenever evidence is ready)

| Date (UTC+05) | Status | Item | Evidence / next action |
|---|---|---|---|
| 2026-10-15/16 | Completed | Historic DSH incident analysis | 33 sessions; 4,028 events; 166 retry events; outcomes require task-level verification. Source private, statistics sanitized. |
| 2026-10-17 | Completed | Camel loading check | User-provided `/camel status`: 8 route overrides, `retry.enabled=false`, taskOverride=null; runtime pacing effectiveness not yet evaluated. |
| 2026-10-17 | Completed | Repository initialized with 18 starter files | Published initial docs, MIT license, samples and sanitized baseline; verify live links and begin post-config task tests. |

## How to maintain this file

- Update a checkbox **only after** its explicit exit condition is satisfied.
- Add a short progress-journal line for every completed or blocked milestone: date, result, evidence and next action.
- Link GitHub Issues/PRs/commits when they exist, rather than rewriting their full discussions here.
- Update **Last reviewed** and the relevant translation after meaningful changes.
- Never add raw logs, IPs, credentials, exact private session IDs, user identities or confidential task titles to this file.