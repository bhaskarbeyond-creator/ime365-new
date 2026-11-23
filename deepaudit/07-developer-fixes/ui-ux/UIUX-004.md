# A. UIUX-004 — Cover reset and navigation can discard unsaved work without recovery

## B. Severity

P2 — Medium. A document-authoring workflow can lose user text during reset/back/refresh/navigation.

## C. Confirmation status

**CONFIRMED BY ACTIVE BUNDLE**

## D. Affected code locations

- [`public_html/assets/CoverLetter-AwzPaQPi.js:1`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/CoverLetter-AwzPaQPi.js#L1)
- [`public_html/assets/CoverLetter-AwzPaQPi.js:49`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/CoverLetter-AwzPaQPi.js#L49)
- [`public_html/assets/BuildResume-RXLA08Lm.js:373`](https://github.com/bhaskarbeyond-creator/ime365-new/blob/df5902dd897ff8e7955a738ac580f2a0d0263d0d/public_html/assets/BuildResume-RXLA08Lm.js#L373)

## E. Current implementation

Cover reset immediately clears state. No dirty snapshot, `beforeunload`, route blocker or recoverable autosave is present. Resume builder contains unsaved-change handling, demonstrating an available pattern. Cover overlays also lack a robust shared dialog focus pattern.

## F. Reproduction evidence

Enter unsaved cover content and invoke reset/refresh/dashboard navigation in a source-equivalent test; state is discarded with no confirmation/recovery.

## G. Expected behavior

Dirty documents are autosaved locally/server-side or guarded by accessible confirmation; reset is intentional, and a recoverable snapshot survives crashes/navigation.

## H. Root cause analysis

Cover workflow lacks an explicit clean/dirty/saving/error state machine and does not reuse the resume guard pattern.

## I. Detailed technical solution

- Track a content hash/revision and dirty state.
- Debounce local draft snapshot; optionally autosave server-side with revision conflict control.
- Block destructive reset/navigation with accessible confirmation.
- Flush or preserve snapshot on route change/beforeunload; restore with user choice.
- Use shared Dialog primitive for reset/delete confirmations.

## J. Proposed patch / code-level repair

```js
const dirty = hash(currentDraft) !== lastSavedHash;
if (dirty && action.isDestructive) openConfirmDialog();
useDraftSnapshot({ key: coverId, revision, data: currentDraft, dirty });
```

**Patch verification:** BLOCKED BY ARCH-001; bundle behavior reviewed.

## K. Step-by-step developer implementation

1. Restore source.
1. Model draft states/revisions.
1. Add local snapshot and conflict-safe save.
1. Guard reset/navigation.
1. Add restore/discard UI.
1. Run data-loss and accessibility tests.

## L. Dependencies

ARCH-001, BUG-001/002, UIUX-002.

## M. Regression analysis

Storing sensitive resume data locally has privacy implications; encrypt/minimize, expire and clear on sign-out/shared devices.

## N. Exact test cases

- UIUX-004-T1 — dirty reset prompts; cancel preserves.
- UIUX-004-T2 — refresh/crash offers recovery.
- UIUX-004-T3 — successful save clears dirty snapshot.
- UIUX-004-T4 — sign-out clears protected local data.
- UIUX-004-T5 — concurrent revision conflict does not overwrite silently.

## O. Acceptance criteria

- No destructive action silently loses dirty work.
- Recovery works after refresh/crash.
- Snapshots have retention/privacy controls.
- Dialog keyboard semantics pass.

## P. Rollback plan

Disable reset/navigation controls while dirty and instruct explicit save/download until recovery is available.

## Q. Implementation effort

3–6 engineer-days.

## R. Residual risk

Browser storage can be cleared; communicate guarantees and prefer durable server revisioning.

## S. Independent fix review

**APPROVED FOR IMPLEMENTATION DESIGN — product/UI auditor; P2 independent gate not mandatory.**
