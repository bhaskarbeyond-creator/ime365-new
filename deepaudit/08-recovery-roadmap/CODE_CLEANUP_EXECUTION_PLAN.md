# Code Cleanup Execution Plan

1. Generate route, schema, repository and asset manifests.
2. Add characterization tests at every candidate boundary.
3. Choose canonical owner using active behavior, strongest security and maintainability.
4. Route aliases/adapters through canonical service.
5. Observe usage/deprecation in staging/canary.
6. Remove one duplicate family per commit.
7. Run full regression, compare manifests, and perform rollback drill.
8. Archive evidence and update ADRs.

Never delete the SQL dump as “cleanup”; DATA-001 requires an incident/history process. Never delete hashed assets from the live directory by heuristic; CLEAN-001 requires a clean immutable build.
