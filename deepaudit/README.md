# IME365 Deep Forensic Audit

**Directive:** IME365-DEEPAUDIT-FINAL-002
**Audited source:** `df5902dd897ff8e7955a738ac580f2a0d0263d0d` on `main`
**Audit date:** 2026-11-24 (Asia/Calcutta)
**Verdict:** **NO-GO — not production ready**

This directory is a documentation-only recovery package. No application source, configuration, database schema, dependency manifest, test, or user-facing asset was changed by the audit.

## Start here

1. [Executive summary](EXECUTIVE_SUMMARY.md)
2. [Master audit report](MASTER_AUDIT_REPORT.md)
3. [Canonical issue register](CONSOLIDATED_ISSUE_REGISTER.md)
4. [Production scorecard](PRODUCTION_READINESS_SCORECARD.md)
5. [Recovery sequence](08-recovery-roadmap/PRIORITIZED_FIX_SEQUENCE.md)
6. [Release gates](08-recovery-roadmap/RELEASE_GATES.md)
7. [Independent verdict](10-independent-verification/FINAL_AUDIT_VERDICT.md)

## Critical action

[DATA-001](07-developer-fixes/security/DATA-001.md) is a confirmed P0 incident: a public Git repository tracks a production-style SQL dump containing personal and operational records. Preserve evidence, engage the privacy/security owner, remove the current blob, coordinate a reachable-history rewrite, assess clones/caches, and rotate exposed credentials or sessions. Do not mistake a history rewrite for retraction from existing copies.

## Coverage map

| Area | Primary document |
|---|---|
| Governance and evidence | [00-governance](00-governance/REPOSITORY_INVENTORY.md) |
| Architecture and contracts | [01-architecture](01-architecture/ARCHITECTURE_AUDIT.md) |
| Functional behavior | [02-functional](02-functional/FRONTEND_AUDIT.md) |
| Browser/UI/accessibility | [03-ui-ux](03-ui-ux/UI_UX_MASTER_AUDIT.md) |
| Redundancy and cleanup | [04-cleanup](04-cleanup/ZERO_REDUNDANCY_ROADMAP.md) |
| Adversarial reviews | [05-red-team](05-red-team/REDTEAM_RECONCILIATION.md) |
| SWOT and risk | [06-swot](06-swot/COMPLETE_SWOT_ANALYSIS.md) |
| Developer fix specifications | [07-developer-fixes](07-developer-fixes/architecture/ARCH-001.md) |
| Recovery roadmap | [08-recovery-roadmap](08-recovery-roadmap/MASTER_RECOVERY_PLAN.md) |
| Test strategy and 104-template matrix | [09-test-strategy](09-test-strategy/TEMPLATE_TEST_MATRIX.md) |
| Independent challenge | [10-independent-verification](10-independent-verification/INDEPENDENT_REVIEW.md) |

## Evidence convention

Source links are pinned to the audited SHA. Local screenshots are intentionally not committed because they can contain environment metadata; their hashes and paths are recorded in [EVIDENCE_REGISTER.md](00-governance/EVIDENCE_REGISTER.md). Test outcomes use only `PASS`, `FAIL`, `BLOCKED`, `NOT EXECUTED`, or `INCONCLUSIVE`. A proposed patch is not represented as implemented or verified.
