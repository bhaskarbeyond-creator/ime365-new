# A. ARCH-003 — Unclassified repository methods default to write semantics

## B. Severity

P2 — Medium. Read calls can acquire write-path behavior, reducing availability and obscuring intent.

## C. Confirmation status

**CONFIRMED BY SOURCE**

## D. Affected code locations

- [`backend/repositories/ResilientRepository.js:130-176`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/repositories/ResilientRepository.js#L130-L176)

## E. Current implementation

ResilientRepository maintains method classification sets, but every unclassified name falls through `_write`. At least 20 public methods are unclassified; read examples include `getAdminAuditLog`, `getCustomPageById`, `getFavourites`, `getReviews`, `getTrackedJobs`, `getTrustedById`, and `isFavourite`.

## F. Reproduction evidence

Enumerate public repository methods and subtract read/write sets. Invoke a known read and instrument dispatch; it follows the write fallback.

## G. Expected behavior

Every repository method has one explicit descriptor; unknown methods fail startup/test instead of silently choosing semantics.

## H. Root cause analysis

Manually divergent method-name sets plus permissive write default → interface additions silently inherit wrong policy.

## I. Detailed technical solution

- Create one exhaustive descriptor map with operation kind, consistency, retry/idempotency and fallback policy.
- Validate descriptors against repository prototype/interface at startup and test.
- Fail closed on unknown method.
- Generate wrappers/types where feasible without stack migration.

## J. Proposed patch / code-level repair

```js
const operations = {
  getReviews: { kind: 'read', consistency: 'eventual' },
  createReview: { kind: 'write', idempotency: 'keyed' },
};
if (!operations[method]) throw new Error(`Unclassified repository method: ${method}`);
```

**Patch verification:** SOURCE-REVIEWED ONLY.

## K. Step-by-step developer implementation

1. Inventory interface methods.
1. Assign reviewed descriptors.
1. Replace separate sets/fallback.
1. Add startup/CI exhaustiveness check.
1. Exercise retry/failover behavior.

## L. Dependencies

DB-003.

## M. Regression analysis

Correcting reads may change fallback/consistency behavior; characterize call sites.

## N. Exact test cases

- ARCH-003-T1 — every public method classified exactly once.
- ARCH-003-T2 — adding method without descriptor fails.
- ARCH-003-T3 — named read examples dispatch read path.
- ARCH-003-T4 — write retry/idempotency unchanged.

## O. Acceptance criteria

- Zero unclassified methods.
- Unknown method never defaults to write.
- Descriptor is the only authority.
- Read/write failover tests pass.

## P. Rollback plan

Use an explicit temporary descriptor for any disputed method; never restore permissive fallback.

## Q. Implementation effort

2–4 engineer-days.

## R. Residual risk

Semantic misclassification is still possible; domain owners review descriptors.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — independently verified.**
