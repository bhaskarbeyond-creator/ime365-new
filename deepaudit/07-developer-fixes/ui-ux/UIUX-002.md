# A. UIUX-002 — Authentication sheet violates dialog, keyboard and form accessibility contracts

## B. Severity

P2 — Medium. Keyboard and assistive-technology users cannot reliably understand or operate a critical entry journey.

## C. Confirmation status

**CONFIRMED BY PLAYWRIGHT AND ACTIVE BUNDLE**

## D. Affected code locations

- [`public_html/assets/AuthWrapper-qqowgFnh.js:2`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/AuthWrapper-qqowgFnh.js#L2)
- [`public_html/assets/AuthWrapper-ChD4Z5uf.css:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/AuthWrapper-ChD4Z5uf.css#L1)
- [`public_html/assets/Toats-LqHsJ7yV.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/Toats-LqHsJ7yV.js#L1)

## E. Current implementation

Runtime found zero `role=dialog`/`aria-modal`; Escape left the sheet open; visible fields lacked native required, `aria-invalid` and `aria-describedby`; mode switches include anchors without href; toast has no live role; CSS removes submit focus outline.

## F. Reproduction evidence

Navigate unauthenticated to `/enterprise`, inspect accessibility tree, press Escape, enumerate visible inputs and no-href anchors. The 375 px screenshot records the sheet.

## G. Expected behavior

A labelled modal traps/restores focus, closes on Escape when safe, uses semantic controls, exposes required/invalid/error relationships, announces outcomes, and has visible focus.

## H. Root cause analysis

Visual overlay was implemented without a shared dialog/form accessibility state machine.

## I. Detailed technical solution

- Build/reuse an accessible Dialog primitive with title/description IDs, aria-modal, portal/inert background, focus trap and restore.
- Use button for mode switches/close; preserve route semantics as needed.
- Apply native required/autocomplete and linked field errors.
- Use `role=status` for success and `role=alert` for blocking errors.
- Restore `:focus-visible` styling and test zoom/mobile.

## J. Proposed patch / code-level repair

```jsx
<Dialog open={open} onClose={close} aria-labelledby="auth-title" aria-describedby="auth-help">
  <h1 id="auth-title">Register</h1>
  <input required aria-invalid={!!errors.email} aria-describedby="email-error" />
  <button type="button" onClick={showLogin}>Login</button>
  <div role="alert" id="email-error">{errors.email}</div>
</Dialog>
```

**Patch verification:** BLOCKED BY ARCH-001; runtime behavior reproduced.

## K. Step-by-step developer implementation

1. Restore source.
1. Implement shared Dialog.
1. Refactor login/register/forgot flows.
1. Wire validation and live regions.
1. Add keyboard/axe/zoom tests.
1. Verify focus restore across route redirects.

## L. Dependencies

ARCH-001, BUG-004.

## M. Regression analysis

Route-driven modal close/next redirect behavior can change; preserve intended navigation and prevent closing during irreversible submission.

## N. Exact test cases

- UIUX-002-T1 — one labelled dialog/aria-modal.
- UIUX-002-T2 — Tab/Shift+Tab remain inside; Escape closes; trigger focus restored.
- UIUX-002-T3 — required errors linked/announced.
- UIUX-002-T4 — all actions keyboard operable with visible focus.
- UIUX-002-T5 — axe has zero serious/critical violations.

## O. Acceptance criteria

- Dialog semantics/focus behavior pass.
- No click-only anchor.
- Form state announced and visible.
- Focus outline meets contrast.
- All auth modes pass keyboard journey.

## P. Rollback plan

Use a dedicated accessible auth page instead of modal until primitive is ready.

## Q. Implementation effort

3–6 engineer-days.

## R. Residual risk

Provider-hosted widgets may add accessibility issues; test them separately.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — product/UI auditor; P2 independent gate not mandatory.**
