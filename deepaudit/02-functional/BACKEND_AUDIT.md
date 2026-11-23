# Backend Audit

## Strengths

The backend applies Helmet, origin-aware CORS, bearer authentication, policy helpers, parameterized repository operations, provider abstraction, rate limiting, and explicit health/readiness endpoints. Reviewed HTML sanitization uses DOMPurify with restrictive tags/URLs; no evidence-backed SQL injection or ordinary CSRF bypass was confirmed.

## Release blockers

| Area | Root cause | Issue |
|---|---|---|
| Startup | PM2 path invalid; cluster requires guarded entry | OPS-001, OPS-002 |
| Readiness | connection-only predicate, bootstrap not awaited | DB-001 |
| Privileged users | duplicated routes with different step-up/hierarchy rules | SEC-001 |
| Password reset | token finalized after external mutation then released on error | SEC-002 |
| Exports | untrusted stored image sources reach Chromium | SEC-003 |
| Proxy/IP | topology and trust model disagree | SEC-004 |
| Webhooks | replay path reads/audits but does not process | API-001 |
| Tests | scripts reference missing/empty suites | OPS-004 |

## Scale/maintainability

`backend/index.js` is 6,243 lines and directly declares 142 routes. `MySQLRepository.js` is 3,099 lines. Route modules contain another 317 declarations. Breakup should follow stable domain services and contract tests, not arbitrary line-count refactoring.
