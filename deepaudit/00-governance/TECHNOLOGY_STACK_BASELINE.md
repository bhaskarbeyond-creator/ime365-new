# Technology Stack Baseline

| Layer | Observed technology | Version/evidence | Preservation rule |
|---|---|---|---|
| Frontend | Compiled React-style SPA/Vite-Rolldown chunks | JSX runtime and hashed ES modules; source absent | Restore its exact source/build toolchain; no framework migration |
| Gateway | Apache `.htaccess` + PHP cURL proxy | PHP 8.2.12 locally | Retain or safely configure current gateway topology |
| Backend | Node.js + Express | Local Node 24.18.0; Express 5.2.1 | Preserve Node/Express |
| Database | MariaDB/MySQL via `mysql2` | mysql2 3.24.2; migrations | Make migrations authoritative |
| Identity | Firebase Admin/browser auth | firebase-admin 14.2.0 | Preserve, unify authorization controls |
| PDF | Playwright/Chromium | Playwright 1.62.1 | Preserve with network and sandbox hardening |
| DOCX | `docx` | 9.5.1 | Preserve; prove template parity |
| Payments | Stripe and other provider routes | stripe 22.5.0; compiled Checkout chunks | Preserve configured providers, centralize webhook state |
| Email | Nodemailer | 9.0.5 | Upgrade compatibly and regression-test |
| Process | PM2 config + optional cluster supervisor | Checked config is defective | Repair existing model, do not replace stack |

## Environment discovery

Composer and MySQL command-line clients were not installed locally. The audit therefore did not create or mutate a MariaDB instance. A controlled in-memory repository mode was used only for unauthenticated API behavior and did not prove database integrations.
