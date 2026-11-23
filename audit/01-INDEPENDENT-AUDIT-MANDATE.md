# Directive AUD-001 — Independent, Adversarial, Production-Readiness Audit

## Mission

Review every relevant component of the actual committed IME365 application, identify reproducible defects and meaningful gaps, and deliver detailed fix instructions as Markdown directly in GitHub. Do **not** implement fixes in application code during this audit.

## Constraints — non-negotiable

- GitHub API/connector only for reading and committing documentation. No local machine installation, checkout, clone, downloads, scratch files, caches, persisted archives or workspace mirrors.
- Read source at a pinned commit, inspect CI history and PRs when useful. If no source is present, stop at the repository blocker.
- Documentation-only changes in `audit/`. Use an isolated audit branch / pull request when feasible.
- Never make unfounded statements: distinguish static inspection from executed tests, and `NOT TESTED` from `PASS`.
- Never include tokens, connection strings, private user data or secrets in Markdown.

## Audit coverage

1. **Inventory and architecture:** full tree inventory, entrypoints, runtime boundaries, dependency graph, dead code, duplicate logic, inconsistent contracts, maintainability, config and feature completeness.
2. **Backend/APIs:** correctness, validation, routing, status codes, errors, timeouts, concurrency, idempotency, rate limiting, authentication, authorization, pagination, transactions, file handling and abuse cases.
3. **Data:** schema, migrations, foreign keys, indexes, constraints, tenancy/user isolation, backups, retention, transaction safety and data integrity.
4. **Security/privacy:** secrets exposure, supply-chain risk, access controls, OWASP categories, XSS, SQLi, CSRF, SSRF, CORS, upload validation, session handling, encryption and sensitive-data logging.
5. **UI/UX:** navigation flows, visual consistency, information architecture, design tokens, layout alignment, overflow, truncation, forms, loading/empty/error states, keyboard behavior, accessibility/WCAG, responsive behavior, touch interactions, discoverability and affordances.
6. **IME365-specific workflows (validate against product requirements):** resumes and Master CV; intended 100 resume templates and four CV templates; thumbnail/editor/print/PDF/DOCX parity; font/layout fidelity; AI suggestion popup and real request/response integration; user accounts, saving, duplication, import/export, and admin controls. Treat stated targets as *requirements*, not as verified code capabilities.
7. **Reliability/performance:** startup, health checks, race conditions, resource leaks, N+1 queries, caching, large document performance, retry behavior, degradation, observability and recovery.
8. **Delivery/release:** build, dependencies, reproducibility, CI gates, environment separation, migrations, rollback, monitoring, alerting, deployment hardening, backup recovery and operational runbooks.
9. **Testing:** missing unit/integration/e2e tests, contract tests, security tests, visual regression, responsive coverage, cross-browser behavior and export fidelity.

## UI/UX verification matrix

Review at minimum five defined viewport widths, mobile through desktop, and record actual pixel dimensions. Validate keyboard-only and screen-reader fundamentals, high-zoom and narrow-screen reflow, touch target sizes, color contrast and focus order. For each critical workflow cover happy path, empty state, loading, permission-denied, invalid form input and failed network. Where browser execution is unavailable, state `NOT TESTED — browser evidence required` and provide an exact test plan rather than invent screenshots.

## Workflow

**Phase 0:** Verify contents, branch, commit SHA and reviewability.  
**Phase 1:** Enumerate files/modules and map cross-module feature flows.  
**Phase 2:** Multi-perspective static audit: systems, security, data, frontend UX/accessibility, test/release; challenge each finding independently.  
**Phase 3:** Evidence-based issue confirmation with source path/lines, rationale and conditional reproduction steps.  
**Phase 4:** Developer-ready fix specifications including preferred solution, alternatives, risks and exact acceptance tests.  
**Phase 5:** Rank P0–P3, establish dependency order and release-blocking gates.  
**Phase 6:** Commit only `.md` outputs to GitHub, verify they can be fetched and link each report in the master index.

## Final deliverables

`audit/INDEX.md` (comprehensive navigation + status), `audit/EXECUTIVE-SUMMARY.md`, `audit/SOURCE-INVENTORY.md`, `audit/ARCHITECTURE.md`, `audit/UI-UX-REVIEW.md`, `audit/SECURITY-REVIEW.md`, `audit/TEST-GAP-ANALYSIS.md`, `audit/PRODUCTION-READINESS.md`, `audit/REMEDIATION-ROADMAP.md`, `audit/VERIFICATION-MATRIX.md`, and `audit/findings/AUD-XXXX-*.md` for each independently supported finding.

**Auditor sign-off is conditional**: no fabricated `10/10` ratings; certify only after all P0/P1 gates pass and necessary execution evidence exists. A specification can target high quality without proving the software is production ready.
