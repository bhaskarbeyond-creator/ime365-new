# User Journey Analysis

| Journey | Result | Blocking evidence |
|---|---|---|
| Land → browse templates | Partial pass | public catalog redirects `/templates` to `#templates`; 51 available |
| Land → blog/legal | Pass in isolated public runtime | pages and API calls rendered |
| Enterprise unauthenticated | Pass | redirected to login with next parameter |
| Login/register keyboard | Fail | modal semantics/focus/Escape defects |
| Create/edit/save resume | BLOCKED | no safe auth/DB; frontend source missing |
| Generate/save cover | Fail by bundle contract | BUG-001 and BUG-002 |
| Configure template as admin | Fail end-to-end policy | BUG-003 |
| Export PDF/DOCX | BLOCKED | auth/DB plus SEC-003 prerequisite |
| Print resume | Fail requirement | no action |
| Recover unsaved cover work | Fail by source | no dirty snapshot/guard |

The public runtime emitted no new console warnings/errors during the clean route checks. Stripe’s script and telemetry endpoint were observed during non-checkout public navigation; whether this is legally “strictly necessary” must be decided by the privacy owner and then aligned with consent copy and lazy loading.
