# Responsive Issues

## UIUX-001 — clipped mobile layout

At 320 px, `.rp-public-site` had `scrollWidth=381` while its containing wrapper had `clientWidth=290`; sampled descendants extended to approximately x=522. At 375 px, 15 sampled descendants exceeded their containment. The document itself stayed viewport-width because the overflow is clipped inside a nested fixed-height wrapper, masking normal horizontal-scroll diagnostics.

### Repair

- Remove viewport-height locking from the public-page wrapper and let the document own vertical scroll.
- Apply `min-width:0` to flex/grid children.
- Change feature/pill rows to wrapping grids at mobile breakpoints.
- Constrain images/text with `max-width:100%` and `overflow-wrap:anywhere`.
- Reduce sticky header action footprint; preserve a 44×44 menu target.
- Add 320/375 visual tests that fail when any visible element exceeds its containing block by more than 1 CSS px.

At 768, 1024 and 1440 px no sampled horizontal overflow was observed.
