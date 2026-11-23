# API Integration Tests

The [API contract matrix](../01-architecture/API_CONTRACT_MATRIX.md) inventories 459 declarations. A generated runtime registry must drive tests for effective prefix and middleware.

## Required dimensions

- authentication: none, invalid, expired, valid;
- authorization: every actor/target role and step-up state;
- validation: absent, malformed, boundary, oversized, unknown fields;
- response: status, content type, stable error code/schema;
- rate limiting: pre-auth IP and post-auth UID;
- audit: success, denial, failure and correlation ID;
- idempotency/concurrency for writes;
- database/provider failures and retry semantics.

## Critical cases

- admin role/MFA/bulk status across every alias;
- reset consume with failure after Firebase update;
- webhook live/replay/duplicate/concurrent signed fixtures;
- cover/resume CRUD and template policy;
- PDF/DOCX auth, policy and SSRF boundaries;
- health minimal public vs protected internal details;
- CORS allowed/denied origin and forwarded-header spoofing.
