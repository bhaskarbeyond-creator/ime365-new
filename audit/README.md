# IME365 Independent Audit — Index

**Audit date:** 2026-11-23  
**Repository:** https://github.com/bhaskarbeyond-creator/ime365-new  
**Status:** BLOCKED — no application source committed  
**Audit type:** GitHub-native, read-only application inspection; documentation-only writes.

## Mandatory audit integrity rules

1. Never mark untested behavior as PASS, and never fabricate findings, screenshots, line numbers, scores, tests, or verification evidence.
2. Distinguish **CONFIRMED**, **SUSPECTED**, **NOT TESTED**, **NOT APPLICABLE**, and **BLOCKED**.
3. For every confirmed bug document its path and line references, reproduction, intended behavior, observed behavior, root cause, fix specification, regression tests, dependencies, severity, and acceptance criteria.
4. No installation, cloning, checkout, file creation, cache, download, or storage on the auditor's **local machine**. Read directly via GitHub API/connector; write Markdown only via GitHub API/connector.
5. No application source changes, commits to production code, merges, or deployment during the audit.
6. If a verification requires executing code, browser interaction, screenshots, test infrastructure or credentials not accessible with permitted GitHub-only tools, record **NOT TESTED** or **BLOCKED**. Never silently bypass the limitation.
7. Prefer a separate audit branch and pull request once source exists; do not rewrite application files.
8. Follow sensitive-data minimization: no secret values, passwords, personal records or access tokens in reports.

## Current documents

- [00 — Verified blocker](00-REPOSITORY-ACCESS-BLOCKER.md)
- [01 — Full audit mandate](01-INDEPENDENT-AUDIT-MANDATE.md)
- [02 — Developer remediation template and exit gates](02-DEVELOPER-REMEDIATION-STANDARD.md)

## Future deliverables once code is available

Create a navigable inventory and separate Markdown reports for architecture, route and API inventory, database, security, authentication/authorization, frontend UI/UX, responsive behavior, accessibility, resume-template parity, document exports, AI assistance, admin controls, deployment configuration, dependencies, tests/CI, observability, performance, privacy and production rollout. Add one evidence-backed file per individual finding under `audit/findings/`, with a master severity-ranked index.

**This repository is not certified production ready.**
