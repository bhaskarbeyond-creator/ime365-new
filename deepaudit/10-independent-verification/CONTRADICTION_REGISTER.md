# Contradiction Register

| Topic | Competing claims | Resolution |
|---|---|---|
| PM2 severity | P0 startup blocker / P1 config defect | P1; production usage unverified |
| Platform audit | no audit / transactional audit exists | generic denied/failed gap only; P2 |
| Proxy exposure | publicly exposed / topology unknown | checked cleartext design P1; reachability conditional |
| Missing DB env in PM2 | certainly absent / externally injected possible | document/validate, do not claim absence |
| SSRF impact | arbitrary RCE / remote request path | stored SSRF confirmed; no RCE claimed |
| Cover AI persistence | stale body persisted / CRUD always fails first | stale attempt confirmed; persistence currently masked |
| Four CVs | Cover1–4 satisfy / cover letters differ | do not count cover letters as CVs |
| Current templates | visually mismatched / only risk | parity INCONCLUSIVE until matrix |
| Zero-test command | exit 0 means pass / zero means failure | classified FAIL by quality policy |
