# End-to-End User Journeys

| ID | Journey | Expected |
|---|---|---|
| E2E-01 | Register with weak/valid password, verification off/on | correct validation/copy and complete profile |
| E2E-02 | Login, forgot/reset, reuse token | one successful reset; replay denied |
| E2E-03 | Create/edit/reorder/save/reload/delete/clone resume | exact durable state and conflict handling |
| E2E-04 | Generate/accept/reject/undo/save AI suggestion | exact accepted text, no stale overwrite |
| E2E-05 | Create/edit/duplicate/delete cover | exact body/template/ID round trip |
| E2E-06 | Basic/paid select free/pro/disabled template | server-consistent decision |
| E2E-07 | PDF/DOCX/print one-page and multipage | content/visual parity |
| E2E-08 | ADMIN vs SUPER_ADMIN role/MFA/status changes | canonical step-up/hierarchy |
| E2E-09 | Mobile public/auth at 320 and 375 | no clipping; keyboard/accessibility pass |
| E2E-10 | Provider/database outage during save/export/payment | recoverable error, no false success/partial state |
| E2E-11 | Dirty cover reset/back/refresh | confirmation and recovery |
| E2E-12 | Deploy/reload/rollback | readiness, zero request loss, exact provenance |

Authenticated journeys were not executed in this audit and remain release gates.
