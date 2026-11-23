# Red Team Reconciliation

| Disagreement | Resolution |
|---|---|
| PM2 defect P0 vs P1 | P1: checked config is certainly broken, but actual production use is unverified; DATA-001 is the sole confirmed P0 |
| Platform audit bypass P1 vs P2 | P2: generic denied/failed telemetry is bypassed, but several operations have stronger transactional audits |
| Proxy public exposure certain vs conditional | P1 design defect; external reachability remains topology-dependent |
| Template visual mismatch confirmed vs suspected | High-risk inference only; parity requires deterministic output screenshots |
| Four Cover layouts count as four CVs | Rejected: source/admin labels them cover letters, not CV templates |
| Dependency presence equals exploitability | Rejected: advisories are confirmed; path exploitability remains qualified |

The independent verifier approved the data incident, deployment/readiness/test/provenance/cluster/webhook/migration/dependency findings, elevated missing frontend source to P1, and required impact qualifications recorded above.
