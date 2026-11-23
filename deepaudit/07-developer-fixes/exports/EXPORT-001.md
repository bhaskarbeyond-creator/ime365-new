# A. EXPORT-001 — 100-resume/4-CV requirement is unmet and existing output parity is unproved

## B. Severity

P1 — High requirement/release blocker. Only 51 resume/CV layouts are evidenced; four cover-letter layouts cannot satisfy a distinct four-CV cohort.

## C. Confirmation status

**CONFIRMED REQUIREMENT GAP; EXISTING VISUAL QUALITY INCONCLUSIVE**

## D. Affected code locations

- [`public_html/assets/themePresets-BPAo3w_S.js:2`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/themePresets-BPAo3w_S.js#L2)
- [`public_html/assets/templateCatalog-cMlOoY0x.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/templateCatalog-cMlOoY0x.js#L1)
- [`public_html/assets/Admin-Cn7HBNw9.js:27`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/Admin-Cn7HBNw9.js#L27)
- [`backend/index.js:2093-2096`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/index.js#L2093-L2096)
- [`backend/services/docxThemes.js:107-160`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/backend/services/docxThemes.js#L107-L160)

## E. Current implementation

The active catalog creates `Cv1–Cv51`; backend comments/validation and admin treat these as 51 resume/CV templates. `Cover1–Cover4` are explicitly cover letters. DOCX themes stop at Cv51. All 51 thumbnails exist and are unique, but editor/PDF/DOCX/print parity was not executed.

## F. Reproduction evidence

Import active catalog and count entries: 51. Inventory Cover assets/admin labels: four cover letters. Compare to directive target 100 resume + four CV. The complete matrix marks 49 resume and four CV entries missing.

## G. Expected behavior

One canonical typed catalog contains 100 resume and four distinct CV templates; every entry passes definition, registration, thumbnail, editor, preview, PDF, DOCX, print, binding and multipage parity.

## H. Root cause analysis

Product target expanded beyond the implemented 51-item catalog, while cover-letter layouts were a separate feature and no automated parity gate prevents incomplete cohorts.

## I. Detailed technical solution

- Restore frontend source/build first.
- Define taxonomy (`resume`, `cv`, `cover-letter`) and one 104-entry resume/CV catalog with stable IDs.
- Design/implement 49 missing resume and four CV layouts with unique product-approved designs.
- Generate thumbnails from the canonical renderer rather than hand-maintained imagery.
- Implement matching DOCX themes and PDF/print renderer paths.
- Run deterministic one-page/multipage parity matrix for all entries; do not bulk-clone cosmetic variants to satisfy count.

## J. Proposed patch / code-level repair

```ts
interface TemplateDefinition {
  id: string;
  kind: 'resume' | 'cv';
  renderer: RendererId;
  docxTheme: DocxThemeId;
  thumbnailDigest: string;
  policy: 'free' | 'pro' | 'disabled';
  version: number;
}
assertCatalog({ resume: 100, cv: 4 });
```

**Patch verification:** IMPLEMENTATION SPECIFICATION ONLY. Exact 53 new designs require product/design inputs; existing visual parity is unverified.

## K. Step-by-step developer implementation

1. Approve taxonomy and distinct design acceptance.
1. Restore source and canonical renderer/catalog.
1. Implement missing entries in reviewable batches.
1. Generate thumbnails and DOCX mappings.
1. Run automated structural and visual matrices.
1. Independent design/accessibility/export review.
1. Enable only passing entries.

## L. Dependencies

ARCH-001, BUG-003, SEC-003, EXPORT-002, OPS-004.

## M. Regression analysis

Template additions can break document persistence, IDs, multipage layout, font licensing, ATS extraction and billing policy.

## N. Exact test cases

- EXPORT-001-T1 — catalog asserts exactly 100 resume + 4 CV unique IDs.
- EXPORT-001-T2 — every entry has unique/product-approved thumbnail and renderer.
- EXPORT-001-T3 — editor/PDF/DOCX/print text inventories match synthetic fixture.
- EXPORT-001-T4 — long content has no clipping/overlap and stable page breaks.
- EXPORT-001-T5 — optional/Unicode/RTL/special-character fixtures.
- EXPORT-001-T6 — policy matrix for free/pro/disabled.

## O. Acceptance criteria

- 104 required entries exist with correct taxonomy.
- All 104 rows PASS every mandatory column.
- No cover-letter layout counted as CV.
- Existing 51 regressions remain zero.
- Independent product/export review approves each design family.

## P. Rollback plan

Feature-flag only passing templates; retain stable IDs and fall back documents to their last validated renderer, never silently change design.

## Q. Implementation effort

20–60 engineer/design-days depending on originality and DOCX complexity.

## R. Residual risk

Visual comparison tolerances and office-suite rendering vary; maintain reference environments.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — independent verifier confirmed at least 49 resume and four CV gaps; effective gap may be larger because current quality is unverified.**
