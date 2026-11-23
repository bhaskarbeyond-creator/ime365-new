# Dead Code Report

## High-confidence unreferenced modules

Static direct-require analysis found route modules including `cmsPages.js`, `employer.js`, `exports.js`, `health.js`, `messaging.js`, `oauth.js`, and `payments.js` without direct composition references. Some may be loaded indirectly or retained for deployment variants; they are **REQUIRES INVESTIGATION**, not approved deletion.

## Compiled assets

From the active `index.html` seed, static import traversal found 293 assets (about 36.4 MB) not referenced, including nine prior index bundles and repeated hashed component generations. Dynamic string imports and runtime URLs can evade static traversal.

## Proof before removal

1. Restore frontend source/build inputs.
2. Build cleanly into an empty output directory.
3. Emit a bundler manifest and compare runtime network traces across journeys.
4. Run unit/API/E2E/export/visual suites.
5. Remove only files absent from both build manifest and runtime trace.
6. Retain the previous immutable artifact for rollback.
