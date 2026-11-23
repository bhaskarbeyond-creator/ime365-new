# Audit Limitations

- No production or live-user mutation was performed.
- Local `.env` values were treated as confidential and never published.
- No live MariaDB server/client was available; schema findings are source-grounded.
- No Firebase, payment, email, or AI-provider credential was exercised.
- Authenticated resume/editor/export journeys were blocked by the isolated identity/database environment.
- PDF, DOCX, and print visual parity across all templates remains unverified.
- Chromium was used for UI execution; Firefox, WebKit, Safari, and physical mobile devices were not executed.
- The frontend source/build inputs are missing, so compiled-bundle behavior can be reproduced but maintainable source patches cannot be syntax-tested.
- The repository is shallow; the audited local object set does not establish the complete remote history.
- Dependency advisory presence was freshly verified; exploitability is qualified per call path rather than assumed.
- Static asset reachability can miss dynamic string-based loads; no deletion should rely on it alone.
- An audit cannot prove the absence of undiscovered defects.
