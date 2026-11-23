# Developer Remediation Standard and Release Acceptance Gates

## Required finding format

Each `audit/findings/AUD-XXXX-short-title.md` must contain:

1. Stable ID, descriptive title, severity (P0/P1/P2/P3), confidence, state and impacted workflow.
2. Exact pinned Git SHA, repository-relative paths and line ranges, or verified runtime/CI evidence links. No invented line references.
3. Reproduction prerequisites and ordered steps; expected versus actual behavior; evidence, scope and user impact.
4. Root-cause analysis supported by code or tests; separate confirmed facts from hypotheses.
5. Concrete design-level solution: source-level change map, interface/data contracts, migration/compatibility notes, edge cases, security implications and rollback.
6. Acceptance criteria in checkable Given/When/Then form, with positive/negative and regression scenarios.
7. Tests to add or modify, execution commands when known, and evidence required. If not executed: **NOT TESTED**.
8. Dependencies, estimated effort range clearly labeled as estimate, implementation order, reviewer independence and status history.

## Severity

- **P0:** critical security/data-loss outage, blocked core functionality or unrecoverable production risk.
- **P1:** major functionality, security or release safety deficiency.
- **P2:** important but non-blocking malfunction, accessibility or usability gap.
- **P3:** polish, low-risk maintainability, minor visual inconsistencies.

Prioritize evidenced risk, not the number of bug reports.

## Proposed readiness gates (must all be demonstrated)

- No unresolved P0/P1 issues or unapproved critical risks.
- Core user journeys verified end-to-end with authenticated and unauthorized roles, and failure/edge paths.
- Document template counts and rendering fidelity independently reconciled against signed-off requirements.
- Template thumbnail, editable view, export to PDF/DOCX and Print show required layout/content parity across supported templates; use an explicit comparison rubric.
- AI suggestions are discoverable, functional and properly secured; graceful degradation verified.
- Responsive and accessibility criteria validated at documented sizes/browser versions.
- Security and dependency checks pass, with documented threat model and exception process.
- Data lifecycle, backup/restore, migrations and rollback rehearsal evidenced.
- CI gates reproducible, automated tests meaningful, and evidence tied to an exact commit.
- Production monitoring, alerting, incident response and release procedures documented and tested.

## Developer handoff protocol

Implement fixes in dependency order on separate branches/PRs. Link each change to its `AUD-XXXX` report. Require independent review and reproducible test evidence before marking resolved. Auditor must re-check the implementation and update the finding status in GitHub.

## Current disposition

**BLOCKED** because application source does not exist in this repository at audit start (see `00-REPOSITORY-ACCESS-BLOCKER.md`). No application behavior has been verified. The above is a remediation and verification standard, not a completed audit or certification.
