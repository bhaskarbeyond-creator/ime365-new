# A. UIUX-003 — Reduced motion, target sizing, landmarks and preview semantics fail accessibility checks

## B. Severity

P2 — Medium. Multiple public controls/animations are inaccessible or difficult to operate.

## C. Confirmation status

**CONFIRMED BY PLAYWRIGHT**

## D. Affected code locations

- [`public_html/assets/index-kBF0DTTH.js:12`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/index-kBF0DTTH.js#L12)
- [`public_html/assets/main-CtI7UfH3.css:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/main-CtI7UfH3.css#L1)
- [`public_html/assets/Welcome-BmApnjRa.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/Welcome-BmApnjRa.js#L1)

## E. Current implementation

Under `prefers-reduced-motion:reduce`, the typed heading text still changed and cursor animation remained. Two visible `main` elements were nested. FAQ search had placeholder only. A floating preview was a clickable `div` with no role/tabindex/name. 30–40 sampled visible targets were under 44 CSS px.

## F. Reproduction evidence

Emulate reduced motion and compare heading over 1.2 seconds; inspect landmarks/accessibility names/geometry at required viewports.

## G. Expected behavior

Motion preference stops nonessential animation; exactly one main landmark; every input/control has accessible name/semantics; pointer targets meet WCAG 2.2 sizing or spacing exceptions.

## H. Root cause analysis

Visual interactions and layout were created without semantic primitives or automated accessibility geometry/media tests.

## I. Detailed technical solution

- Disable typewriter/cursor/scroll animations under reduced motion and render stable complete text.
- Keep one `main`; use sections/divs for nested content.
- Add persistent label or aria-label to FAQ search.
- Replace clickable preview div with button and accessible name/state.
- Increase target box or spacing to at least 44×44 where feasible; document valid exceptions.

## J. Proposed patch / code-level repair

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: 0.01ms !important; animation-iteration-count: 1 !important; scroll-behavior: auto !important; transition-duration: 0.01ms !important; }
}
```
Component logic must also stop timer-driven text changes.

**Patch verification:** BLOCKED BY ARCH-001; runtime reproduced.

## K. Step-by-step developer implementation

1. Inventory interactive elements/landmarks.
1. Refactor semantic primitives.
1. Add reduced-motion state to JS animations.
1. Adjust geometry/spacing.
1. Run axe, keyboard and media/viewport tests.

## L. Dependencies

ARCH-001, UIUX-001.

## M. Regression analysis

Global motion CSS can break progress indicators; preserve essential state change without decorative motion.

## N. Exact test cases

- UIUX-003-T1 — heading text stable/complete under reduce.
- UIUX-003-T2 — exactly one main landmark.
- UIUX-003-T3 — FAQ and preview have accessible names/keyboard activation.
- UIUX-003-T4 — target geometry passes or documented exception.
- UIUX-003-T5 — no regression under normal motion.

## O. Acceptance criteria

- Reduced-motion user sees no nonessential animation.
- One main landmark.
- All sampled controls semantic/named.
- Target-size gate passes.

## P. Rollback plan

Disable the animated/preview widgets while retaining equivalent text/action.

## Q. Implementation effort

2–5 engineer-days.

## R. Residual risk

Third-party widgets and dynamic admin/editor surfaces need the same audit after authentication is available.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — Playwright and product/UI auditor.**
