# A. EXPORT-002 — Resume builder exposes print styles but no user-facing print action

## B. Severity

P2 — Medium. The target explicitly requires print output, yet only cover letters expose a print flow.

## C. Confirmation status

**CONFIRMED BY ACTIVE BUNDLE**

## D. Affected code locations

- [`public_html/assets/BuildResume-RXLA08Lm.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/BuildResume-RXLA08Lm.js#L1)
- [`public_html/assets/BuildResume-RXLA08Lm.js:373`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/BuildResume-RXLA08Lm.js#L373)
- [`public_html/assets/TemplateRenderer-CUJ_jyCX.css:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/TemplateRenderer-CUJ_jyCX.css#L1)
- [`public_html/assets/CoverLetter-AwzPaQPi.js:3`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/CoverLetter-AwzPaQPi.js#L3)

## E. Current implementation

Resume rendering CSS contains print rules, but BuildResume has no `window.print`/print action. CoverLetter implements print. Therefore users cannot intentionally invoke canonical resume print from the editor.

## F. Reproduction evidence

Search active BuildResume for print action and inspect visible controls; none exists. Compare CoverLetter handler and print CSS.

## G. Expected behavior

A visible keyboard-accessible Print action flushes pending saves, renders the canonical template, opens print preview, and preserves page sizes/margins/content.

## H. Root cause analysis

Print styling was implemented at renderer level but not integrated into resume editor workflow.

## I. Detailed technical solution

- Add semantic Print button in restored source.
- Flush/confirm unsaved state before rendering.
- Use the same canonical renderer/catalog as preview/PDF.
- Apply print media page size/margins and hide editor chrome.
- Record print telemetry without document contents.

## J. Proposed patch / code-level repair

```js
async function handlePrint() {
  await flushPendingSave();
  setPrintMode(true);
  await nextPaint();
  window.print();
  setPrintMode(false);
}
```

**Patch verification:** BLOCKED BY ARCH-001; source contract only.

## K. Step-by-step developer implementation

1. Restore source.
1. Add print state/action.
1. Integrate save flush and renderer.
1. Add print CSS/afterprint cleanup.
1. Run all-template parity.

## L. Dependencies

ARCH-001, EXPORT-001, BUG-003.

## M. Regression analysis

Print can race unsaved edits or use browser headers/margins; document supported settings.

## N. Exact test cases

- EXPORT-002-T1 — action keyboard accessible.
- EXPORT-002-T2 — pending edit appears in print.
- EXPORT-002-T3 — editor chrome absent.
- EXPORT-002-T4 — one/multipage fixtures for all templates.
- EXPORT-002-T5 — cancel returns editor state.

## O. Acceptance criteria

- Visible Print action exists.
- Canonical current data/template rendered.
- All 104 template print rows pass.
- No data loss/state corruption after cancel/complete.

## P. Rollback plan

Hide print action and clearly mark unsupported; do not expose inconsistent browser shortcut as a certified feature.

## Q. Implementation effort

2–5 engineer-days plus matrix runtime.

## R. Residual risk

Browser/printer differences remain; publish supported-browser guidance.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — product/UI auditor; P2 independent gate not mandatory.**
