# A. ARCH-002 — Duplicate/shadow routes and unreferenced router modules create contract drift

## B. Severity

P2 — Medium. Competing route owners produce middleware, audit and behavior divergence.

## C. Confirmation status

**CONFIRMED BY SOURCE**

## D. Affected code locations

- [`backend/index.js:425-437`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/index.js#L425-L437)
- [`backend/index.js:2314-2322`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/index.js#L2314-L2322)
- [`backend/routes/platform.js:1750-2020`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/routes/platform.js#L1750-L2020)
- [`backend/routes/exports.js:1-291`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/routes/exports.js#L1-L291)
- [`backend/routes/health.js:1-162`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/routes/health.js#L1-L162)

## E. Current implementation

The tree has 459 HTTP declarations, with 142 inline in `index.js`. Platform and enterprise routers are mounted more than once; platform contains duplicate configuration/payment/replay paths. Several route modules have no direct require reference. Repeated `/api` middleware is not assumed duplicate.

## F. Reproduction evidence

Run declaration/mount/reference census and compare effective method/path/owner tuples. Exact duplicates and unreferenced modules emerge.

## G. Expected behavior

One generated route registry declares effective path, owner, authentication, authorization, validation, audit, rate limit and response schema; aliases call the same service.

## H. Root cause analysis

Incremental migration between monolith and modular routers without contract registry/tests → old and new implementations coexist.

## I. Detailed technical solution

- Instrument/generate a runtime route registry.
- Snapshot current contracts and usage.
- Select canonical owner per exact duplicate based on active behavior and stronger controls.
- Route temporary aliases through one service; deprecate with telemetry.
- Remove only after parity and usage gates.

## J. Proposed patch / code-level repair

```text
routeRegistry.register({ method, path, owner, auth, policy, validator, audit, rateLimit, responseSchema })
CI rejects duplicate effective method+path unless explicitly declared aliasOf.
```

**Patch verification:** DESIGN ONLY; no route removed.

## K. Step-by-step developer implementation

1. Generate full runtime registry.
1. Add endpoint characterization tests.
1. Resolve exact duplicates one domain at a time.
1. Migrate callers/aliases.
1. Observe deprecation window.
1. Remove and regression-test.

## L. Dependencies

OPS-004; SEC-001; API-001/002.

## M. Regression analysis

Unreferenced modules may be deployment-specific; dynamic loading and operational scripts must be checked.

## N. Exact test cases

- ARCH-002-T1 — registry contains all 459 declarations/effective mounts.
- ARCH-002-T2 — duplicate tuple fails unless explicit alias.
- ARCH-002-T3 — aliases return identical auth/status/body/audit.
- ARCH-002-T4 — removed module has zero build/runtime references.

## O. Acceptance criteria

- No unexplained duplicate effective route.
- One canonical owner per operation.
- All removals have parity/usage evidence.
- Route registry is CI-enforced.

## P. Rollback plan

Restore alias routing to canonical service, not duplicate business logic.

## Q. Implementation effort

5–15 engineer-days.

## R. Residual risk

External undocumented clients can depend on aliases; observe and communicate deprecation.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — independently verified with scope caution.**
