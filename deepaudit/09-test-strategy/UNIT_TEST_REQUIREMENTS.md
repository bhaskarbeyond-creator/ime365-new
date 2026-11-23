# Unit Test Requirements

| Suite | Representative assertions |
|---|---|
| Privileged policy | actor role, target role, MFA, auth age, self/last-superadmin |
| Reset token | atomic state transitions, replay, expiry, concurrent begin |
| Template policy | free/pro/disabled, overlap, grandfathering, every action |
| Repository descriptor | exhaustive method classification and unknown-method failure |
| Release manifest | digest, mismatch, missing/tampered/dirty status |
| Cover facade | named exports, response ID, template field, error normalization |
| AI cover state | explicit generated body, abort/out-of-order behavior |
| Validators | signup, resume/cover payloads, export fields |
| Webhook state | signature evidence, idempotency, retries and transitions |
| Rendering transforms | deterministic data mapping, optional/Unicode/long content |

Tests use synthetic data only and must be fast/deterministic.
