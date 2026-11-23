# Red Team 3 — Product and UI/UX

**Executing reviewer:** `/root/product_ui_audit` (separate agent, read-only)

## Findings

- Cover save/delete wrappers call methods absent from the imported chunk.
- AI-generated cover text is immediately persisted from stale component state.
- Template disabled/PRO configuration is not enforced by editor/export surfaces.
- Only 51 resume registrations exist against 100 + four CV target.
- Auth overlays lack dialog, keyboard, form-state and live-feedback semantics.
- Signup validation and verification copy do not match configuration/state.
- Cover reset/navigation lacks dirty recovery.
- Resume has print CSS but no print action.
- Generic renderer versus legacy component parity is high-risk but unconfirmed.
- Frontend artifact provenance prevents maintainable repair.

Playwright corroborated mobile overflow, nested scrolling, reduced-motion, target-size, landmark and auth-modal failures.
