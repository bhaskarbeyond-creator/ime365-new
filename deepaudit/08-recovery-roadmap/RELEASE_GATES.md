# Release Gates

| Gate | Pass condition |
|---|---|
| Incident | DATA-001 containment/history/rotation/privacy decision complete |
| Source | clean reproducible frontend/backend artifact and validated manifest |
| Tests | nonzero required suites; all green; no unmet dependency |
| Startup | PM2/direct/cluster selected path serves and drains correctly |
| Schema | empty/current/upgrade/failure states correct; readiness never false-green |
| Authorization | every privileged alias passes actor/target/MFA/freshness matrix |
| Reset | failure after identity update cannot reuse token |
| Export security | deny-by-default egress, TLS/sandbox, SSRF suite green |
| Gateway | private/TLS hop, restricted bind, correct spoof-resistant client IP |
| Dependencies | no unowned critical/high runtime advisory |
| Product | cover CRUD/AI exact-body/policy journeys green |
| Templates | all 104 matrix rows PASS, including multipage outputs |
| Accessibility | axe + keyboard + reduced-motion + target/landmark gates |
| Performance | agreed load/soak budgets met without error/resource leak |
| Rollback | application, schema forward-fix and immutable artifact drills pass |

Any failed P0/P1 gate produces **NO-GO**.
