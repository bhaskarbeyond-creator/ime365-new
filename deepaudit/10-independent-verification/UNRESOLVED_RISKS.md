# Unresolved Risks

- Distribution of the sensitive SQL through clones, forks, caches and artifacts is unknown.
- Actual production gateway/firewall/process topology was not probed.
- Live MariaDB migration/restore integrity is untested.
- Firebase, payment, SMTP and AI provider behavior is untested.
- Authenticated editor, admin and export E2E remains blocked.
- PDF/DOCX/print visual parity for current and missing templates is unknown.
- Exact frontend source may be unavailable or mismatched.
- Browser coverage excludes Firefox/WebKit/Safari/physical devices.
- Static asset/module reachability may miss dynamic loading.
- Dependency advisories can change after publication.
- No audit guarantees discovery of every defect.
