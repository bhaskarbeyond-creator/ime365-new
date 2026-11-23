# Acceptance Criteria Matrix

| Issue | Primary acceptance gate | Required test IDs |
|---|---|---|
| DATA-001 | sensitive blob absent from all authorized refs; incident/rotation decision complete | DATA-001-T1..T4 |
| OPS-001 | configured process starts and becomes ready | OPS-001-T1..T4 |
| OPS-002 | direct/cluster listeners start once and drain | OPS-002-T1..T4 |
| OPS-003 | artifact manifest matches exact source/digests | OPS-003-T1..T4 |
| OPS-004 | clean install, nonzero required tests, failures fail CI | OPS-004-T1..T4 |
| OPS-005 | no local/unsafe host in production package | OPS-005-T1..T3 |
| DB-001 | readiness 200 only on current schema | DB-001-T1..T4 |
| DB-002 | no released connection with FK checks off | DB-002-T1..T4 |
| DB-003 | migrations are sole verified schema authority | DB-003-T1..T4 |
| API-001 | replay invokes shared idempotent processor | API-001-T1..T5 |
| API-002 | one platform mount with correct telemetry | API-002-T1..T4 |
| SEC-001 | all privileged aliases share step-up/hierarchy and reconciliation | SEC-001-T1..T6 |
| SEC-002 | reset token is at-most-once under failure/concurrency | SEC-002-T1..T5 |
| SEC-003 | renderer egress restricted and sandboxed | SEC-003-T1..T6 |
| SEC-004 | secure private hop, bind, IP and limiter semantics | SEC-004-T1..T5 |
| SEC-005 | no unowned critical/high advisory; regressions pass | SEC-005-T1..T5 |
| SEC-006 | public health minimal; details protected | SEC-006-T1..T4 |
| SEC-007 | read roles cannot full-export users | SEC-007-T1..T4 |
| ARCH-001 | clean deterministic frontend build | ARCH-001-T1..T4 |
| ARCH-002 | no unexplained duplicate route owner | ARCH-002-T1..T4 |
| ARCH-003 | all repository methods explicitly classified | ARCH-003-T1..T4 |
| BUG-001 | cover CRUD exact contract round-trip | BUG-001-T1..T5 |
| BUG-002 | exact AI body saved once with terminal UI state | BUG-002-T1..T5 |
| BUG-003 | server template policy consistent across all paths | BUG-003-T1..T5 |
| BUG-004 | submit/config/provisioning consistent/recoverable | BUG-004-T1..T5 |
| EXPORT-001 | all 104 rows pass complete parity | EXPORT-001-T1..T6 |
| EXPORT-002 | resume print action/parity works | EXPORT-002-T1..T5 |
| CLEAN-001 | live assets equal clean manifest; rollback works | CLEAN-001-T1..T4 |
| UIUX-001 | no mobile clipping/nested scroll | UIUX-001-T1..T4 |
| UIUX-002 | auth dialog/form keyboard and axe pass | UIUX-002-T1..T5 |
| UIUX-003 | motion/landmark/semantics/targets pass | UIUX-003-T1..T5 |
| UIUX-004 | dirty work guarded/recoverable | UIUX-004-T1..T5 |
