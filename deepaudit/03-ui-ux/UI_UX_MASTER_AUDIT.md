# UI/UX Master Audit

## Executed browser coverage

The Playwright browser session reported Chromium `157.0.8103.79` on Windows 10/11 x64. It rendered the public application at 320×900, 375×900, 768×900, 1024×900 and 1440×900. Journeys covered home, templates, blog, privacy policy, enterprise redirect, login/register sheets, mobile navigation, keyboard Escape, reduced motion, DOM landmarks and control dimensions.

## Findings

| ID | Page/component | Actual behavior | Expected |
|---|---|---|---|
| UIUX-001 | Public landing mobile | 381 px inner surface inside 290 px wrapper at 320; content clips; fixed-height nested scroller | one document scroller; no horizontal clipping |
| UIUX-002 | Login/register sheet | no dialog/aria-modal, no Escape, no focus trap, mode link lacks href/button semantics, no required/invalid associations | accessible modal/form pattern |
| UIUX-003 | Landing | nested `main`; unlabeled FAQ search; preview clickable `div`; 30–40 sampled targets under 44 px; motion continues under reduced-motion | WCAG-aligned semantics, targets and motion |
| UIUX-004 | Cover builder | reset/navigation can discard dirty work; overlays lack robust focus semantics | dirty-state recovery and shared dialog |
| BUG-003 | Template selection | visual disabled/PRO configuration is not authoritative | consistent server-enforced policy |

Desktop presentation is visually coherent and no sampled horizontal overflow occurred at 768+ px. That strength does not offset the mobile and keyboard failures.

## Evidence

See [EVIDENCE_REGISTER.md](../00-governance/EVIDENCE_REGISTER.md) for local screenshot names and test conditions.
