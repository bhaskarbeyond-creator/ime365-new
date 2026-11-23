# File Review Coverage

## Coverage classes

| Class | Method | Result |
|---|---|---|
| All tracked JavaScript | `node --check` in four bounded batches | PASS: 646/646 |
| All tracked PHP | `php -l` | PASS: 2/2 |
| SQL | Inventory, table/insert/migration state inspection | 39 files reviewed structurally; high-risk migrations deep-read |
| Compiled SPA | Active-entry reachability, string/symbol contract tracing, runtime DOM | 672 assets inventoried; 379 reachable / 293 unreferenced heuristic |
| Images/fonts | Path, dimensions/uniqueness for template thumbnails, reachability | 51 current thumbnails unique at 993×1404 |
| Routes | Declaration census and privileged/high-risk contract review | 459 declarations mapped by owning module |
| Tests | Manifest and path inspection plus command execution | FAIL: no tracked tests; runner missing/zero discovery |

## Deep-reviewed source families

- Authentication, policy, admin user mutation, reset-token store.
- Resume persistence, publication, PDF/DOCX exports and network interception.
- Platform/enterprise mounting, webhook replay and audit behavior.
- Migration runner, baseline migration, schema/authority repositories.
- PM2, cluster, startup, health/readiness and release markers.
- Compiled cover-letter, resume-builder, template catalog, admin settings, auth wrapper, toast and public landing bundles.

## Not equivalent to semantic review

A syntax pass proves parseability only. Asset reachability is a static entry-graph heuristic and cannot prove runtime deadness. Those limitations are carried into cleanup recommendations.
