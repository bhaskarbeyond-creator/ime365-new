# Duplication Report

| Candidate | Evidence | Classification | Canonical owner | Safety gate |
|---|---|---|---|---|
| Platform router mount | `backend/index.js:435,2322` | CONSOLIDATE | one mount after intended middleware | route/audit contract snapshot |
| Enterprise router mount | duplicate mounts in composition root | CONSOLIDATE | one documented mount | endpoint parity |
| Platform configuration/payment/replay handlers | exact local-path duplicates in `platform.js` | CONSOLIDATE | one handler/service per operation | signed webhook/admin tests |
| Privileged user mutations | platform + adminUsers controls | REFACTOR IN PLACE | shared service + recent-superadmin guard | role/action/target matrix |
| Health route modules vs inline health | active inline plus unreferenced router | REQUIRES INVESTIGATION | generated route registry decides | runtime manifest |
| Export routes vs inline exports | multiple implementations; some unreferenced | REQUIRES INVESTIGATION | verified active engine | output parity |
| Hashed frontend generations | 293 assets unreachable from active entry | REMOVE AFTER VERIFICATION | current deterministic build | clean-build asset manifest |
| Firestore/sync/fencing/tombstone | retained after MariaDB authority shift | REMOVE AFTER VERIFICATION | MariaDB/migrations | backup/failover proof |

Repeated `app.use('/api', ...)` is not automatically duplication because middleware can be intentionally layered.
