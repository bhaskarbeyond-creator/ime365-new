# Production Readiness Scorecard

## Decision

**18/100 — NO-GO.** This is a readiness score for the audited product, not an audit-quality score.

| Domain | Weight | Score | Weighted | Evidence |
|---|---:|---:|---:|---|
| Security and privacy | 20 | 1/10 | 2.0 | Public data incident; privilege and reset-token defects |
| Reliability/operations | 15 | 1/10 | 1.5 | PM2 and cluster startup failures; stale provenance |
| Data integrity | 15 | 2/10 | 3.0 | Schema-readiness race; FK session leak; authority drift |
| Functional completeness | 15 | 3/10 | 4.5 | Cover persistence broken; template target unmet |
| Testing/regression | 15 | 1/10 | 1.5 | No tracked tests; missing runner; zero discovery |
| Maintainability/reproducibility | 10 | 1/10 | 1.0 | Frontend source/build inputs absent |
| UI/accessibility | 5 | 4/10 | 2.0 | Public surface works but mobile/auth defects remain |
| Performance/scalability | 5 | 5/10 | 2.5 | Not load-tested; large stale asset inventory |
| **Total** | **100** |  | **18.0** |  |

## Automatic blockers

- Any unresolved P0.
- Any privileged authorization bypass.
- Public reset tokens not provably at-most-once.
- Deploy definition cannot start and pass readiness.
- Readiness can succeed with an invalid schema.
- Test discovery is zero.
- Frontend artifacts are not reproducible.
- Core save/delete flow is broken.
- Required template inventory/parity is incomplete.

A score increase requires executed evidence, not document completion.
