# Risk Matrix

| Risk | Likelihood | Impact | Rating | Owner | Primary control |
|---|---|---|---|---|---|
| Public personal-data exposure | Certain | Critical | Extreme | Security/privacy | DATA-001 incident plan |
| Privileged control bypass | High | Critical | Extreme | Security/backend | SEC-001 |
| Reset token replay after partial failure | Medium | Critical | High | Identity/backend | SEC-002 |
| Export SSRF/renderer escape | Medium | Critical | High | Export/security | SEC-003 |
| Deployment non-start | High | High | High | Operations | OPS-001/002 |
| Traffic on invalid schema | Medium | High | High | Data/operations | DB-001/002 |
| Core cover save failure | High | High | High | Frontend | BUG-001/002 |
| Entitlement/policy bypass | High | High | High | Product/backend | BUG-003 |
| Unreproducible frontend | Certain | High | High | Engineering | ARCH-001 |
| Mobile/accessibility exclusion | High | Medium | High | Frontend/design | UIUX-001–003 |
| Stale asset accidental removal | Medium | Medium | Medium | Build/release | CLEAN-001 gates |
