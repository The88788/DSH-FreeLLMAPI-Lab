# Security and data-handling policy

**Do not commit or post raw agent sessions.** DSH JSONL records can contain model inputs, tool results, local file contents, client context and secrets. Never assume a small ZIP is safe to publish.

Private-by-default data: `.env`, `*.key`, credentials, full DSH session JSONL/Zstd/ZIP exports, FreeLLMAPI operational SQLite databases, customer/user data, source of private projects, exact local workstation paths, auth headers, request bodies, token-bearing URLs, and complete prompts.

Only explicitly reviewed **aggregate statistics** and synthetic fixtures belong in public research. Before publishing, check: direct strings, nested tool payloads, filenames, code blocks, repository remotes, URL query strings, usernames and stable IDs. Replace identifying data with generic terms. Do not rely on naive regex alone to remove all secrets.

The initial `scripts/init-trial.ps1` writes a **private local template outside the repository**. It does not upload or parse sessions. Future analyzers must be opt-in, default to local-only output, and never change production DSH/FreeLLMAPI config without approval.

Report accidental disclosures through a private maintainer channel rather than a public issue. Do not include the secret value in your report. Revoke or rotate exposed credentials promptly according to the provider's process.