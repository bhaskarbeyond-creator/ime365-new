# Consolidated Issue Register

This is the canonical register. Symptoms that share one root cause are cross-referenced rather than duplicated.

| ID | Sev | Status | Title | Canonical fix |
|---|---|---|---|---|
| DATA-001 | P0 | Confirmed by source/public visibility | Public repository tracks production-style SQL records | [Fix](07-developer-fixes/security/DATA-001.md) |
| OPS-001 | P1 | Confirmed by source | PM2 entry point resolves to a nonexistent file | [Fix](07-developer-fixes/operations/OPS-001.md) |
| OPS-002 | P1 | Confirmed by source | Cluster workers never invoke the HTTP listener | [Fix](07-developer-fixes/operations/OPS-002.md) |
| OPS-003 | P1 | Confirmed by source | Stale build markers can falsely report verified parity | [Fix](07-developer-fixes/operations/OPS-003.md) |
| OPS-004 | P1 | Confirmed by reproduction | Missing and zero-discovery tests create false confidence | [Fix](07-developer-fixes/operations/OPS-004.md) |
| OPS-005 | P2 | Confirmed by source | Canonical URLs and deployment hosts contain stale/local values | [Fix](07-developer-fixes/operations/OPS-005.md) |
| DB-001 | P1 | Confirmed by source/runtime | Readiness ignores schema state and races bootstrap | [Fix](07-developer-fixes/database/DB-001.md) |
| DB-002 | P1 | Confirmed by source | Failed migration can leak disabled FK checks into pool | [Fix](07-developer-fixes/database/DB-002.md) |
| DB-003 | P2 | Confirmed by source | Schema authorities and retired dual-store code diverge | [Fix](07-developer-fixes/database/DB-003.md) |
| API-001 | P1 | Confirmed by source | Webhook replay fabricates processed success | [Fix](07-developer-fixes/api/API-001.md) |
| API-002 | P2 | Confirmed by source | Early platform mount shadows generic audit middleware | [Fix](07-developer-fixes/api/API-002.md) |
| SEC-001 | P1 | Confirmed by source | Duplicate privileged APIs bypass canonical step-up controls | [Fix](07-developer-fixes/security/SEC-001.md) |
| SEC-002 | P1 | Confirmed by source | Password-reset token can be reused after successful change | [Fix](07-developer-fixes/security/SEC-002.md) |
| SEC-003 | P1 | Confirmed by source | Export renderer permits stored remote-image SSRF | [Fix](07-developer-fixes/security/SEC-003.md) |
| SEC-004 | P1 | Confirmed by source; topology conditional | Proxy transport and trusted-IP controls are inconsistent | [Fix](07-developer-fixes/security/SEC-004.md) |
| SEC-005 | P1 | Confirmed by fresh audit | Runtime dependency security gate fails | [Fix](07-developer-fixes/security/SEC-005.md) |
| SEC-006 | P2 | Confirmed by source/runtime | Public health APIs disclose internal topology/errors | [Fix](07-developer-fixes/security/SEC-006.md) |
| SEC-007 | P2 | Confirmed by source | users.read grants a complete private-user export | [Fix](07-developer-fixes/security/SEC-007.md) |
| ARCH-001 | P1 | Confirmed by inventory | Frontend source/build system is absent | [Fix](07-developer-fixes/architecture/ARCH-001.md) |
| ARCH-002 | P2 | Confirmed by source | Duplicate routes and unreferenced routers drift | [Fix](07-developer-fixes/architecture/ARCH-002.md) |
| ARCH-003 | P2 | Confirmed by source | Unclassified repository reads default to write semantics | [Fix](07-developer-fixes/architecture/ARCH-003.md) |
| BUG-001 | P1 | Confirmed by bundle contract | Cover save/delete dynamic import is broken | [Fix](07-developer-fixes/functional/BUG-001.md) |
| BUG-002 | P1 | Confirmed by source bundle | AI cover save reads stale state and lacks terminal error handling | [Fix](07-developer-fixes/functional/BUG-002.md) |
| BUG-003 | P1 | Confirmed by bundle/source | Template disabled/PRO controls are not authoritative | [Fix](07-developer-fixes/functional/BUG-003.md) |
| BUG-004 | P2 | Confirmed by bundle/source | Signup validation/copy/provisioning behavior is inconsistent | [Fix](07-developer-fixes/functional/BUG-004.md) |
| EXPORT-001 | P1 | Confirmed requirement gap | 100-resume/4-CV target is unmet and parity is unproved | [Fix](07-developer-fixes/exports/EXPORT-001.md) |
| EXPORT-002 | P2 | Confirmed by bundle | Resume builder has no user-facing print action | [Fix](07-developer-fixes/exports/EXPORT-002.md) |
| CLEAN-001 | P2 | Confirmed by reachability analysis | 293 compiled assets are unreferenced from active entry | [Fix](07-developer-fixes/cleanup/CLEAN-001.md) |
| UIUX-001 | P2 | Confirmed by Playwright | Mobile content clips inside a nested fixed-height scroller | [Fix](07-developer-fixes/ui-ux/UIUX-001.md) |
| UIUX-002 | P2 | Confirmed by Playwright/bundle | Auth sheet violates dialog and form accessibility contracts | [Fix](07-developer-fixes/ui-ux/UIUX-002.md) |
| UIUX-003 | P2 | Confirmed by Playwright | Reduced motion, target size, landmarks and preview semantics fail | [Fix](07-developer-fixes/ui-ux/UIUX-003.md) |
| UIUX-004 | P2 | Confirmed by bundle | Cover reset/navigation can discard unsaved work | [Fix](07-developer-fixes/ui-ux/UIUX-004.md) |

## Traceability rule

Every row maps to one fix, exact tests in [ACCEPTANCE_CRITERIA_MATRIX.md](09-test-strategy/ACCEPTANCE_CRITERIA_MATRIX.md), and a release gate in [RELEASE_GATES.md](08-recovery-roadmap/RELEASE_GATES.md). “Confirmed” describes the defect at the audited revision; it does not imply the proposed fix has been implemented.
