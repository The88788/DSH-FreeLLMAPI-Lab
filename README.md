# DSH-FreeLLMAPI-Lab

**English** · [Русский](README.ru.md) · [简体中文](README.zh-CN.md)

Independent community research on real-world **DeepSeek Harness (DSH)**, **dsh-camel** and **FreeLLMAPI** reliability.

> **Status: EXPERIMENTAL, pre-v0.1.0.** Examples are starting points, not guaranteed provider limits or officially supported profiles. This project is independent of the upstream maintainers.

## Why this exists

An OpenAI-compatible API returning `200 OK` does not imply a coding agent can finish a task. Rate limits, duplicate retry layers, underestimated request limits, sandbox failures and tool-call issues can interrupt real workflows. We want reproducible, safe, and measurable experiments instead of unsupported compatibility claims.

## What's inside

- [Project roadmap and progress journal](ROADMAP.md) ([Russian overview](ROADMAP.ru.md))
- [Experiment and evaluation methodology](docs/methodology.md)
- [Sanitized baseline: 33 DSH sessions](research/2026-10-16-baseline.md)
- [Experimental DSH gateway example](examples/dsh/gateway-minimal.example.yml)
- [Experimental dsh-camel profile example](examples/camel/desktop-profile.patch.example.yml)
- [Contribution rules](CONTRIBUTING.md) and [data security policy](SECURITY.md)

## Quick start

1. Read [SECURITY.md](SECURITY.md) before collecting or sharing any data.
2. Install and configure DSH, FreeLLMAPI and optionally dsh-camel using their own official instructions.
3. **Merge**, don't replace, the relevant `llm-pi-ai` or `camel` row in your own profile. Never commit your private profile or credential files.
4. Select a task with verifiable acceptance criteria and use the [experiment template](templates/experiment.example.json).
5. Record real tool calls, errors and task acceptance; do not equate a completed turn with a completed project task.

## Contribute

We welcome tested configurations, quota observations with a source/date, reproducible issues, compatibility research, safety improvements and translations. Native speakers are especially welcome to review machine-assisted Chinese translations and maintain additional languages.

**Please submit aggregate results or synthetic fixtures only.** Do not upload raw session exports, prompts, proprietary source code, credentials or identifying information.

Start with [CONTRIBUTING.md](CONTRIBUTING.md). This project is MIT-licensed.