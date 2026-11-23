# Administration Functionality Audit

## Authorization

The platform operator routes correctly model recent SUPER_ADMIN authentication, MFA and protected-superadmin constraints. Active alternate routes in `adminUsers.js` permit ordinary ADMIN users to create or promote ADMIN accounts, remove MFA, and bulk-suspend targets under weaker controls. Bulk identity failures can be swallowed while database status is updated and reported successful. This is SEC-001.

## Template administration

Admin persists `proCvTemplates`, `disabledCvTemplates`, `proCoverTemplates`, and `disabledCoverTemplates`. The current editor and cover-letter bundles do not consume these controls; dashboard selection only filters/badges client-side; export endpoints enforce global entitlement rather than per-template policy. This is BUG-003.

## Audit and operations

The first `/api/platform` mount occurs before generic admin-audit middleware, making the later mount unreachable for generic denied/failed telemetry. Several route/service operations still write stronger transactional audit rows, so this is P2 API-002 rather than a total audit absence.

## Required admin matrix

Test every mutation across actor role, target role, fresh/stale authentication, MFA present/absent, self/other target, Firebase failure, database failure and retry. Template policy tests must cover picker, direct URL, save, preview, PDF, DOCX and print for free, PRO, disabled and overlapping configuration states.
