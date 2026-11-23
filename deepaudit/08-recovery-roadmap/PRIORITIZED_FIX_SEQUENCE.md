# Prioritized Fix Sequence

1. **DATA-001 incident containment** — freeze release, preserve evidence, assess notification/rotation, remove current blob and coordinate history rewrite.
2. **ARCH-001 + OPS-003 + OPS-004** — restore reproducible source, manifest and nonzero tests; without this, frontend fixes are unsafe.
3. **SEC-001 + SEC-002** — close privileged alternate control plane and make reset tokens at-most-once.
4. **SEC-004 + OPS-001 + OPS-002** — establish a secure, working deployment path.
5. **DB-002 + DB-001** — protect session invariants, then gate traffic on schema state.
6. **SEC-003** — isolate export before enabling PDF qualification.
7. **API-001** — correct webhook replay/idempotency.
8. **BUG-001 + BUG-002** — repair cover contract and exact-body persistence together.
9. **BUG-003** — central template policy across all surfaces.
10. **SEC-005/006/007** — dependency, diagnostic and export least-privilege hardening.
11. **EXPORT-001/002** — implement/certify 100 resume + four CV and print.
12. **UIUX-001–004 + BUG-004** — responsive, accessibility and recovery.
13. **ARCH-002/003 + DB-003 + CLEAN-001 + OPS-005** — consolidation after coverage.
14. **Full qualification and rollback drill.**

Parallel work is allowed only where shared source/build/schema contracts are stable.
