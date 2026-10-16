# Contributing

Thank you for helping make AI coding-agent behavior measurable and reproducible.

Contributions welcome: realistic tests, corrected config examples, verified quota data with a date/source, analyzer improvements, documentation, synthetic fixtures, and human-reviewed translations.

## Evidence requirements

Provide the relevant DSH/Camel/FreeLLMAPI versions, OS, exact non-secret model/route identifiers, steps to reproduce, expected vs actual behavior, the number of runs, and whether the **task passed acceptance criteria**. A dashboard/chat success alone is not evidence of an agent workflow pass.

For quotas, distinguish officially documented limits from experimental observations. State whether an apparent limit is per key, account, model, or unknown. Report the source and observation date. Don't publish quotas inferred from a single error as fact.

## Data safety

Never attach raw DSH exports, API keys, cookies, complete prompts, user code, proprietary repositories, absolute private paths, user identifiers, or an unredacted SQLite database. Use sanitized summaries and synthetic test fixtures. See [SECURITY.en.md](SECURITY.en.md).

## Pull requests

Keep PRs small and scoped. A PR changing adaptive pacing must explain its logic and include a reproducible test. A PR translating docs should identify its source version, target locale, and whether it was reviewed by a native speaker. Documentation may use AI-assisted drafts; human reviewers remain responsible for factual and linguistic accuracy.

## Work tracking

Use GitHub Issues to discuss problems. Update [ROADMAP.en.md](ROADMAP.en.md) only when milestone evidence supports a change. Every finished stage gets a dated line in the progress journal.

## External projects

This independent project is not an official part of DeepSeek Harness, dsh-camel or FreeLLMAPI. Respect upstream projects' licenses and contribution guidelines.