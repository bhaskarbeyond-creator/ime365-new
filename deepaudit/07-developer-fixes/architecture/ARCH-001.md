# A. ARCH-001 — Frontend source and reproducible build system are absent

## B. Severity

P1 — High and release blocking. The shipped UI cannot be safely rebuilt, source-reviewed, tested or repaired from this repository.

## C. Confirmation status

**CONFIRMED BY REPOSITORY INVENTORY**

## D. Affected code locations

- [`public_html/index.html:40-80`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/index.html#L40-L80)
- [`public_html/assets/index-kBF0DTTH.js:1-12`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/index-kBF0DTTH.js#L1-L12)
- [`public_html/assets/BuildResume-RXLA08Lm.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/BuildResume-RXLA08Lm.js#L1)
- [`public_html/assets/CoverLetter-AwzPaQPi.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/CoverLetter-AwzPaQPi.js#L1)

## E. Current implementation

Git contains approximately 500 compiled JS chunks but zero JSX, TSX, TypeScript, source maps, frontend package manifest/lockfile, or build configuration. The active compiled revision marker differs from HEAD.

## F. Reproduction evidence

Inventory tracked extensions/configs and attempt to locate a frontend package/build entry. Only immutable-like hashed artifacts exist.

## G. Expected behavior

Exact source, lockfile, build configuration, assets and tests produce the deployed frontend deterministically from a clean checkout.

## H. Root cause analysis

Generated output was committed without its authoritative inputs → artifact becomes unmaintainable and provenance cannot be established.

## I. Detailed technical solution

- Recover the exact source revision and build inputs from trusted history/artifact owner.
- Verify a clean, network-controlled install and build reproduces the active artifact behavior.
- Commit source/config/test inputs according to repository policy; generate public assets in CI.
- Emit manifest/digests and fail on untracked manual edits.
- Only then implement compiled-UI fixes in source.

## J. Proposed patch / code-level repair

```text
frontend/package.json + lockfile
frontend/src/**
frontend/vite-or-rolldown.config.*
frontend/test/**
CI: clean install -> test -> build -> manifest/digest -> package
```
Do not reverse-engineer and hand-maintain minified chunks as the source of truth.

**Patch verification:** BLOCKED BY MISSING SOURCE; restoration provenance must be independently verified.

## K. Step-by-step developer implementation

1. Identify artifact owner/build pipeline and retrieve source.
1. Verify licensing/secret hygiene.
1. Build in isolated clean checkout.
1. Compare route, DOM, API and visual baselines.
1. Commit/publish source through reviewed process.
1. Enable deterministic artifact/revision gates.

## L. Dependencies

DATA-001 incident review before importing historical archives; OPS-003/004.

## M. Regression analysis

Recovered source may not match deployed artifacts. Do not replace output until behavior/digest comparison and rollback are ready.

## N. Exact test cases

- ARCH-001-T1 — clean checkout installs and builds.
- ARCH-001-T2 — two clean builds yield identical manifest/digests or documented nondeterminism.
- ARCH-001-T3 — active route/API/visual baselines match.
- ARCH-001-T4 — manual asset mutation fails CI.

## O. Acceptance criteria

- Maintainers can reproduce every shipped chunk from tracked inputs.
- Source SHA and artifact manifest are linked.
- Frontend tests run nonzero in CI.
- No manual production-bundle editing is required.

## P. Rollback plan

Redeploy previous immutable artifact while retaining restored source branch for diagnosis.

## Q. Implementation effort

3–15 engineer-days depending on source availability.

## R. Residual risk

If exact source is lost, controlled reconstruction becomes a major project and current artifact behavior remains only partially knowable.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — independent verifier elevated this to P1.**
