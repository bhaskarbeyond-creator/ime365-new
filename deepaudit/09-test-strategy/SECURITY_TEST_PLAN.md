# Security Test Plan

- Scan all reachable Git refs/artifacts for secrets and personal-data fixtures.
- Verify least privilege for every admin/control-plane route alias.
- Inject Firebase/DB split failures and reconcile.
- Exercise reset token concurrent/replay/finalization failures.
- Run export SSRF fixtures: IPv4/IPv6 loopback/private/link-local/metadata, redirects, encodings, DNS rebinding and self-signed TLS.
- Verify Chromium sandbox, nonroot container, resource limits and deny-by-default egress.
- Test XFF/Forwarded spoofing across the exact proxy chain and direct-port denial.
- Fuzz request bodies, sizes and content types on parsers.
- Verify CORS, bearer/session behavior, OAuth state/PKCE and sanitizer URL policies.
- Enforce dependency/SBOM/license scanning and time-bound exceptions.
- Confirm public health/export errors contain no topology, stack, secrets or personal data.

Tests run only in authorized isolated environments.
