# Frontend Audit

## Baseline

The committed frontend is a compiled artifact set: 500 JavaScript chunks among 672 public assets, with no JSX/TSX/TypeScript source, source maps, frontend manifest, lockfile, or build configuration. The active HTML entry references `index-kBF0DTTH.js` and a stale release marker.

## Confirmed behavior

| Surface | Result | Evidence / issue |
|---|---|---|
| Public home | Renders in Chromium | five viewport captures |
| Blog | Loads and requests categories/posts | browser journey |
| Privacy page | Loads | browser journey; claims compliance while DATA-001 exists |
| Enterprise route | Redirects to login | browser journey |
| Cover list | Named `getCovers` export is valid | direct chunk import |
| Cover save/delete | Broken default import contract | BUG-001 |
| AI cover auto-save | Reads pre-update state | BUG-002 |
| Resume template catalog | 51 registrations | EXPORT-001 |
| Template disabled/PRO state | Not enforced across consumers | BUG-003 |
| Auth modal | Mouse-visible but accessibility contract fails | UIUX-002 |

## Repair boundary

Do not patch minified hashed files by hand. Recover source and reproduce the exact current artifact first. Add bundle-contract tests that import every lazy chunk and assert its expected named/default exports; then repair source, generate a new immutable build, and atomically update the revision manifest.
