# Integration Audit

| Integration | Static contract | Runtime evidence | Result | Required gate |
|---|---|---|---|---|
| SPA → public config | repeated `/api/platform/public-config` consumers | 200 in isolated runtime | Partial pass | cache/dedupe and schema contract |
| SPA → cover CRUD | wrapper expects default `saveCover/deleteCover`; chunk exports named `getCovers` only | direct ES import confirmed key set | FAIL | create/update/delete/reload E2E |
| SPA → admin | bearer-protected endpoints | unauthenticated request 401 | Partial pass | role/action/target matrix |
| Apache/PHP → Node | hard-coded cleartext upstream | local PHP probe aborted to avoid external target | FAIL by design | loopback/TLS deployment test |
| Node → MariaDB | mysql2/repository/migrations | deliberate unavailable DB gives readiness 503 | BLOCKED | disposable MariaDB migration/integrity suite |
| Node → Firebase | Admin SDK and browser auth | no live credential mutation | BLOCKED | emulator/staging identity suite |
| Node → AI providers | provider routing/availability | no provider secrets used | BLOCKED | authorized sandbox contract tests |
| Node → PDF | Chromium HTML render and remote resource interception | unauthenticated export rejected | BLOCKED | isolated SSRF + visual matrix |
| Node → DOCX | docx theme mapping through Cv51 | unauthenticated export rejected | BLOCKED | 104-template structural/visual matrix |
| Node → payments/webhooks | provider routes and stored events | replay path source-traced | FAIL | signed fixture/idempotency/replay tests |
| Node → email | Nodemailer direct dependency | not executed | BLOCKED | sandbox SMTP delivery/failure suite |

“Partial pass” never establishes end-to-end production readiness.
