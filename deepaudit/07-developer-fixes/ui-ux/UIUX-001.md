# A. UIUX-001 — Mobile landing content clips inside a fixed-height nested scroller

## B. Severity

P2 — Medium. Core content and controls are partially obscured at required 320/375 px widths.

## C. Confirmation status

**CONFIRMED BY PLAYWRIGHT AT REQUIRED VIEWPORTS**

## D. Affected code locations

- [`public_html/assets/main-CtI7UfH3.css:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/main-CtI7UfH3.css#L1)
- [`public_html/assets/Welcome-BmApnjRa.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/Welcome-BmApnjRa.js#L1)
- [`public_html/assets/index-kBF0DTTH.js:12`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/index-kBF0DTTH.js#L12)

## E. Current implementation

At 320 px, `.rp-public-site` measured 381 px scroll width inside a 290 px wrapper; sampled descendants extended to ~522 px. At 375 px, 15 sampled descendants overflowed containment. The document remained viewport-width because overflow is clipped inside a roughly 20k-pixel fixed-height nested scroller.

## F. Reproduction evidence

Open home at 320×900/375×900, inspect wrapper/client/scroll widths and scroll through feature sections. Screenshots show clipped pill/text rows and oversized sticky header.

## G. Expected behavior

One document scroll container, no visible horizontal overflow/clipping, readable wrapping, and stable sticky navigation at all mandated widths.

## H. Root cause analysis

Viewport-height/overflow wrapper + flex/grid children without effective shrinking/wrapping + wide mobile header/content rows → overflow hidden inside nested scroll surface.

## I. Detailed technical solution

- Remove fixed viewport-height/nested overflow from public shell.
- Set `min-width:0` on flex/grid children and `max-width:100%` on media.
- Wrap feature/pill rows; use responsive grid and `overflow-wrap:anywhere`.
- Rebalance header logo/CTA/menu while maintaining 44×44 targets.
- Add containment-based visual/geometry regression at 320/375.

## J. Proposed patch / code-level repair

```css
.public-shell { min-height: 100dvh; height: auto; overflow: visible; }
.public-shell :where(.flex-child,.grid-child) { min-width: 0; }
.feature-row { display: flex; flex-wrap: wrap; }
img, svg { max-width: 100%; }
```

**Patch verification:** BLOCKED BY ARCH-001 for source repair; runtime measurements captured.

## K. Step-by-step developer implementation

1. Restore source and identify actual shell/row selectors.
1. Remove nested scroller incrementally.
1. Fix shrink/wrap/header rules.
1. Render every public section at five widths.
1. Add screenshot/geometry gates.

## L. Dependencies

ARCH-001; UIUX-003 target sizing.

## M. Regression analysis

Removing nested scroll can affect sticky positioning and scroll-based animations; test anchors/menu and reduced motion.

## N. Exact test cases

- UIUX-001-T1 — no visible element exceeds containing block >1px at 320/375.
- UIUX-001-T2 — document owns vertical scroll.
- UIUX-001-T3 — anchors/sticky header/menu work.
- UIUX-001-T4 — 768/1024/1440 baselines unchanged.

## O. Acceptance criteria

- No clipping/horizontal scroll at required widths.
- All content reachable by normal document scroll.
- Header controls remain usable/44px.
- Visual regression approved.

## P. Rollback plan

Disable problematic wide components on mobile while retaining accessible content; do not restore clipping.

## Q. Implementation effort

2–5 engineer-days.

## R. Residual risk

Localized third-party widgets may still need containment.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — Playwright and product/UI auditor.**
