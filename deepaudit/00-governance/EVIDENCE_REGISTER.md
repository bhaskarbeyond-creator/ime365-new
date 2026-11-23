# Evidence Register

Evidence is redacted and excludes secrets or personal identifiers.

| Evidence ID | Type | Command/condition | Result |
|---|---|---|---|
| EV-GIT-001 | Git | `git rev-parse HEAD` | `df5902dd897ff8e7955a738ac580f2a0d0263d0d` |
| EV-INV-001 | Inventory | `git ls-files` census | 993 tracked files |
| EV-SYN-001 | Syntax | four batches of `node --check` | PASS, 646 files |
| EV-SYN-002 | Syntax | `php -l` tracked PHP | PASS, 2 files |
| EV-TEST-001 | Test | `npm test` | FAIL, missing configured runner |
| EV-TEST-002 | Test | `npm run test:enterprise` | FAIL by policy: 0 tests/0 suites |
| EV-DEP-001 | Dependency | `npm audit --omit=dev --json` | FAIL: 16 advisories |
| EV-DEP-002 | Install state | `npm ls --depth=0` | FAIL: `supertest` unmet |
| EV-HTTP-001 | Isolated runtime | `GET /healthz`, `GET /api/healthz` | 200 |
| EV-HTTP-002 | Isolated runtime | `GET /readyz` with DB deliberately unavailable | 503 |
| EV-HTTP-003 | Authorization | `GET /api/admin/settings` without bearer | 401 |
| EV-HTTP-004 | Validation | empty public export payload | 400 |
| EV-HTTP-005 | Authorization | unauthenticated DOCX export | 401 |
| EV-CORS-001 | Preflight | allowed development origin / hostile origin | 204 with ACAO / no ACAO |
| EV-UI-320 | Screenshot/DOM | Chromium 320×900 | mobile clipping/nested scroll |
| EV-UI-375 | Screenshot/DOM | Chromium 375×900 | clipping and auth sheet |
| EV-UI-768 | Screenshot/DOM | Chromium 768×900 | no sampled horizontal overflow |
| EV-UI-1024 | Screenshot/DOM | Chromium 1024×900 | no sampled horizontal overflow |
| EV-UI-1440 | Screenshot/DOM | Chromium 1440×900 | no sampled horizontal overflow |
| EV-A11Y-001 | Browser | reduced-motion emulation | animated heading still changed |
| EV-A11Y-002 | Browser | enterprise auth route | no dialog/aria-modal; Escape did not close |
| EV-ASSET-001 | Static graph | imports from active HTML entry | 379 reachable (~27.4 MB), 293 unreferenced (~36.4 MB) |
| EV-DATA-001 | Source/public check | tracked SQL and public repository visibility | P0 incident confirmed; values not reproduced |

Browser automation reported Chromium `157.0.8103.79` with user agent family Chrome/157 on Windows x64. The repository's backend dependency separately declares Playwright `1.62.1`; that package version is not represented as the browser-automation client version.

## Local artifacts

Screenshots and scroll captures remain under:

`%USERPROFILE%\Desktop\review\ime365-deepaudit-final-002\evidence\`

They include `home-{320,375,768,1024,1440}.png`, mobile scroll captures, and `login-modal-375.png`. Local paths are evidence pointers, not portable repository links. Publication documents contain descriptions rather than the sensitive pixel artifacts.

| Local artifact | Bytes | SHA-256 |
|---|---:|---|
| `home-320.png` | 95,366 | `33365bc80cf9341d398c690d519a97656d0c9b08b47f84481f762ab192981543` |
| `home-375.png` | 110,901 | `82db882dd1d17682e6ea7fdb8046b83291ee7c0f9ed6ae852c5e7285266ac8c7` |
| `home-768.png` | 181,097 | `70d3cb92b5d4520ba158e736d373b07249e2044a0c96dbc0f84d1ac4d47480d4` |
| `home-1024.png` | 216,930 | `d3dd39dd448e1c3c3a7e0a10cc3b5319a65e537a377200982ded5fa73a85f3bc` |
| `home-1440.png` | 1,329,524 | `c4d35d216b1054159f134abbdc5403b74a5a27e1c036d43707b4a38c22cbc576` |
| `login-modal-375.png` | 67,705 | `899ebbbe252f5d24d9df72dcfc44f0aebaeaf9a4c70ac7ce7cae826193fe4697` |
| `home-320-scroll-{7000,12000,16500,19000}.png` | 45,390–58,349 | hashes retained with the local evidence set |
