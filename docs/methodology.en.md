# Research methodology (v0.1 draft)

## Scope

Test *end-to-end coding agents*, not just isolated HTTP chat completion. A quick chat probe, a tool-call probe, and a real task are three different evidence levels. Label each result accordingly.

## Version and environment metadata

For each test, note (without credentials): UTC timestamp, OS family/version, DSH version, dsh-camel version, FreeLLMAPI version, route ID, provider/model ID, config hash, known quota source/date, task ID chosen for a public synthetic fixture, and relevant workflow capabilities (tools/vision/streaming).

## Minimum task classes

1. Short: read a file, report a fact and execute a harmless tool; expected output is checkable.
2. Medium: change a small part of an example codebase, then run its tests.
3. Long: complete several independently verifiable stages and write a checkpoint after each.

Do not spend scarce quota on repeated probes when the provider advertises exhaustion or the gateway has no usable route.

## Events and labels

- **HTTP Chat PASS**: one ordinary API response. No claim about tools or agent workflows.
- **Tool PASS**: a valid tool-call/result exchange. No claim about complete tasks.
- **Agent attempted**: session started and sent at least one model request.
- **Agent reached tool**: session made at least one useful tool call.
- **Turn completed**: DSH recorded `turn/end=completed`; task acceptance may still fail.
- **Task accepted**: task-specific build/tests or human review confirm requirements.
- **Blocked**: permanent request or environment issue; document category and evidence.

## Diagnostic categories

`RATE_LIMIT`, `SERVER`, `TIMEOUT`, `TRANSPORT`, `INVALID_REQUEST`, `CONTEXT_WINDOW_EXCEEDED`, auth/quota/cooldown, missing/disabled model, bad tool-call arguments, missing file, file-modification conflict, Windows ACL/sandbox, interrupted/aborted. One reported status code may have more than one root cause; preserve raw type locally and record the interpretation with confidence.

## Data policy

Private logs may contain prompts, source code, tool outputs, secret names or values, workstation paths, and customer data. Default publication format is *counts, aggregate timings, version facts and synthetic reproduction steps*. Review sanitized output manually before a PR. Never automatically upload a raw log or SQLite database.

## Safe comparison

Test a similar task class under a fixed configuration and record manual interventions. If the upstream quota, model, OS, prompt or tested task differs, label the comparison observational, not a controlled experiment. A single passing run is not proof of stable reliability.

## Evaluation metrics

Task acceptance rate, time to first useful tool call, successful/failed model attempts, DSH retry counts vs Camel retry counts, retry wait time, long-task checkpoint integrity, unnecessary duplicate file reads, tool errors, real upstream calls (only if identifiable), and known token/credit cost.

## Publishable experiment

A valid report links a sanitized template, evidence count, method, version/date, observed behavior, alternative explanations and a short conclusion. Mark invalid or withdrawn findings with an explanation rather than deleting their history.
