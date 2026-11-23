# Dependency Cleanup

A fresh production audit reported 16 advisories. `npm ls --depth=0` also reported missing `supertest@^7.1.4`. Locked affected packages include `proxy-addr 2.0.7`, `body-parser 2.3.0`, direct `nodemailer 9.0.5`, and optional `@grpc/grpc-js 1.14.4`.

## Safe process

1. Restore a working test installation; resolve the missing direct dependency.
2. Record current dependency graph and Node compatibility.
3. Upgrade direct packages through compatible supported releases; regenerate lockfile in implementation phase.
4. Re-run API body parsing, proxy/IP trust, email, Firebase/grpc, rate-limit and abuse tests.
5. Review transitive resolutions; do not use broad overrides without compatibility evidence.
6. Enforce CI audit policy with an explicit temporary exception file containing owner/expiry/rationale for any accepted advisory.

No dependency manifest was modified by this audit.
