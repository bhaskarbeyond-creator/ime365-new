# A. DATA-001 — Public repository contains production-style personal and operational data

## B. Severity

P0 — Critical and release blocking. The repository is public and the tracked SQL contains user, resume, job, tenant, audit and security records; exposure persists beyond deletion through clones and caches.

## C. Confirmation status

**CONFIRMED BY SOURCE AND PUBLIC VISIBILITY**

## D. Affected code locations

- `database/ime365_live_database.sql:59` — direct permalink intentionally omitted to avoid amplifying exposed personal data.
- `database/ime365_live_database.sql:1173` — direct permalink intentionally omitted to avoid amplifying exposed personal data.
- `database/ime365_live_database.sql:1601` — direct permalink intentionally omitted to avoid amplifying exposed personal data.
- `database/ime365_live_database.sql:1893` — direct permalink intentionally omitted to avoid amplifying exposed personal data.
- `database/ime365_live_database.sql:2584` — direct permalink intentionally omitted to avoid amplifying exposed personal data.
- `database/ime365_live_database.sql:2779` — direct permalink intentionally omitted to avoid amplifying exposed personal data.
- `database/ime365_live_database.sql:3248` — direct permalink intentionally omitted to avoid amplifying exposed personal data.

## E. Current implementation

A 235,247-byte, 3,264-line SQL dump is tracked on the public main branch. Structural review found 23 INSERT statements across administrative audit, enterprise membership/tenant, job tracker, resume, security audit and user tables, plus 158 email occurrences. Identifiers are deliberately not reproduced here.

## F. Reproduction evidence

At the audited SHA, `git ls-files database/ime365_live_database.sql` returns the file. A redacted structural scan counts the inserts and email-like values. GitHub repository visibility was independently observed as Public. No value was copied into audit documentation.

## G. Expected behavior

Source control contains schema migrations and synthetic fixtures only. Real or production-derived personal/operational records never enter Git. Any exposure is handled through the formal incident process.

## H. Root cause analysis

Production-style export → committed to a public repository → durable distribution through Git objects, clones and caches → privacy/security incident.

## I. Detailed technical solution

- Preserve hashes, timestamps and access evidence before mutation; restrict evidence to incident responders.
- Notify the security/privacy owner and follow applicable breach-assessment and notification procedures.
- Remove the current-tree blob, then coordinate a reachable-history rewrite across every branch/tag with force-push freeze and contributor instructions.
- Assess forks, clones, CI artifacts, package/deploy archives and search-engine/cache exposure; a rewrite is not retraction.
- Review the dump for credentials, reset tokens, sessions and provider identifiers without publishing them; rotate/invalidate anything exposed.
- Replace it with generated schema snapshots plus deterministic synthetic fixtures and add pre-commit/CI data-loss-prevention scanning.

## J. Proposed patch / code-level repair

```diff
- database/ime365_live_database.sql   # remove from current tree and coordinated reachable history
+ database/schema.generated.sql       # generated from authoritative migrations, schema only
+ backend/test/fixtures/synthetic.sql # deterministic fictitious records
+ .gitleaks.toml                       # repository-specific PII/secret rules
```

History rewrite commands must be authored and peer-reviewed by the incident lead after refs/remotes/forks are inventoried; they are intentionally not prescribed as a blind one-liner.

**Patch verification:** SOURCE-REVIEWED INCIDENT DESIGN ONLY; no deletion or history rewrite was executed.

## K. Step-by-step developer implementation

1. Open an incident and assign incident commander, privacy lead and Git history owner.
1. Freeze pushes and preserve evidence.
1. Remove the blob on a dedicated incident branch and validate the replacement contains no data rows.
1. Inventory all refs and coordinate `git filter-repo` or equivalent history rewrite.
1. Force-update authorized refs, invalidate old CI/deploy artifacts, and require fresh clones.
1. Rotate affected credentials/sessions based on contents review.
1. Install CI/pre-commit scanning and verify a synthetic fixture workflow.

## L. Dependencies

No prerequisite. This precedes all ordinary recovery work.

## M. Regression analysis

History rewriting breaks old commit references and requires every contributor/automation checkout to be replaced. Schema-only replacement must still support clean database bootstrap.

## N. Exact test cases

- DATA-001-T1 — scan all reachable refs and assert the blob hash/path is absent.
- DATA-001-T2 — scan replacement SQL and assert zero production identifiers/data INSERTs.
- DATA-001-T3 — bootstrap a disposable database from migrations plus synthetic fixtures.
- DATA-001-T4 — seed a prohibited identifier in a test commit and assert CI blocks it.

## O. Acceptance criteria

- Current default branch and every authorized reachable ref no longer contain the blob.
- Privacy/security owner documents clone/cache/fork assessment and notification decision.
- All exposed credentials/tokens/sessions are rotated or explicitly ruled out with evidence.
- Schema bootstrap succeeds from migrations and synthetic fixtures.
- CI fails on representative secret/PII fixtures.

## P. Rollback plan

Do not restore the sensitive blob. If schema/bootstrap regresses, restore a sanitized schema-only artifact from restricted incident evidence, never the original data.

## Q. Implementation effort

3–10 engineer-days plus incident/legal coordination; distribution and credential scope determine duration.

## R. Residual risk

Existing clones, forks, caches and screenshots may remain outside repository control.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — independently verified by `/root/independent_verifier`; immediate incident action required.**
