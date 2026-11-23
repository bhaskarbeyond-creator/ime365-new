# A. CLEAN-001 — Compiled public directory contains multiple unreferenced hashed generations

## B. Severity

P2 — Medium. Stale assets enlarge deployment and obscure provenance; unsafe deletion can break dynamic imports.

## C. Confirmation status

**CONFIRMED BY STATIC REACHABILITY; DEADNESS REQUIRES RUNTIME/BUILD PROOF**

## D. Affected code locations

- [`public_html/index.html:40-80`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/index.html#L40-L80)
- [`public_html/assets/index-kBF0DTTH.js:1-12`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/index-kBF0DTTH.js#L1-L12)

## E. Current implementation

Static import traversal from active HTML seeds found 379 reachable assets (~27.4 MB) and 293 unreferenced assets (~36.4 MB), including nine older index bundles and repeated component generations.

## F. Reproduction evidence

Parse static import/dynamic-import literals recursively from active entry. Compare to all asset files. This heuristic cannot see arbitrary runtime URL/string loading.

## G. Expected behavior

Deployment output is produced into an empty directory from restored source, contains only its manifest plus intentional static assets, and old generations are retained only in immutable rollback artifacts.

## H. Root cause analysis

Successive builds were copied over the same public directory without clean output/manifest pruning → generations accumulate.

## I. Detailed technical solution

- Restore deterministic frontend build.
- Build into a new empty staging directory; emit asset manifest.
- Exercise route/E2E/export network traces and compare loaded assets to manifest.
- Package atomically; archive prior complete build outside live web root.
- Delete stale files only from the new build/package process, not ad hoc path lists.

## J. Proposed patch / code-level repair

```text
CI:
  create empty dist/<release-id>
  build --outDir dist/<release-id>
  verify every file is in manifest or approved-static allowlist
  atomically switch release symlink/directory
  retain previous immutable release for rollback
```

**Patch verification:** ANALYSIS ONLY; no asset deleted.

## K. Step-by-step developer implementation

1. Complete ARCH-001.
1. Create clean-output build.
1. Generate manifest and runtime trace.
1. Compare full journey matrix.
1. Deploy atomically to staging.
1. Remove unmanifested files only in release package.
1. Rollback drill.

## L. Dependencies

ARCH-001, OPS-003/004.

## M. Regression analysis

String-based dynamic imports, service worker/cache references and external links may use apparently unreferenced files.

## N. Exact test cases

- CLEAN-001-T1 — clean build contains only manifest/allowlist.
- CLEAN-001-T2 — all routes/lazy chunks load without 404.
- CLEAN-001-T3 — browser/network/export matrix passes.
- CLEAN-001-T4 — previous release rollback restores exact assets.

## O. Acceptance criteria

- Live web root equals one release manifest.
- No stale index generation shipped.
- No missing dynamic asset across tests.
- Previous immutable release is recoverable.

## P. Rollback plan

Atomically switch back to prior complete release directory.

## Q. Implementation effort

2–5 engineer-days after source restoration.

## R. Residual risk

Long-lived client caches can request old chunks; use release-aware cache strategy and retain compatible assets/CDN window.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — cleanup finding; deletion remains gated.**
