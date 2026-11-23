# Database Audit

## Authority

Three schema representations disagree: migrations define 66 unique tables, `schema.sql` 64, and the tracked dump 79. Retained Firestore/sync/fencing/tombstone modules conflict with MariaDB-only ownership comments. Migrations must become the sole authoritative schema, with generated snapshots.

## Integrity findings

- DATA-001: the checked-in dump contains personal/operational data.
- DB-001: readiness can succeed while schema state is pending/failed/mismatched.
- DB-002: baseline disables `FOREIGN_KEY_CHECKS`; runner releases the session after failure without guaranteed restoration.
- DB-003: authority and table inventories diverge.
- SEC-001: Firebase and MariaDB privileged-user state can split when identity errors are swallowed.
- SEC-002: reset-token state is not atomic with external identity mutation.

## Required disposable-database tests

1. Apply all migrations from an empty schema.
2. Verify expected schema checksum/version.
3. Inject failure after FK checks are disabled; assert connection destruction or restored value.
4. Run upgrade from every supported prior release.
5. Exercise rollback/forward-fix policy.
6. Verify tenant/user isolation, cascades, uniqueness, orphan prevention and concurrent writes.
7. Restore a backup into a clean server and compare row/table constraints.
