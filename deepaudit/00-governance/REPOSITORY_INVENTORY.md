# Repository Inventory

**Revision:** `df5902dd897ff8e7955a738ac580f2a0d0263d0d`

| Area | Tracked files | Purpose | Review state |
|---|---:|---|---|
| `public_html/` | 781 | Apache entry, compiled SPA, fonts/images, PHP proxy | Inventoried; active entry and reachable assets analyzed |
| `backend/` | 209 | Express API, repositories, migrations, workers, export/provider integrations | All JS syntax checked; high-risk paths deep-reviewed |
| `database/` | 1 | Production-style SQL dump | P0 incident confirmed |
| Root config | 2 | Git ignore and PM2 process definition | Reviewed |

## Extension census

| Extension | Count |
|---|---:|
| JavaScript | 646 |
| CSS | 79 |
| PNG | 79 |
| JPG | 69 |
| SQL | 39 |
| WOFF2 | 36 |
| TTF | 20 |
| JSON | 6 |
| SVG | 4 |
| PHP | 2 |
| HTML | 2 |
| Other | 11 |

## Key sub-inventories

- 145 backend JavaScript files.
- 672 files under `public_html/assets/`.
- 33 SQL migration files.
- 459 syntactic Express `app/router` route declarations.
- 0 tracked `*.test.*` or `*.spec.*` files.
- 0 JSX, TSX, TypeScript, frontend package manifest, frontend lockfile, source map, or frontend build configuration.

## Ownership and entry points

| Entry | Owner | Dependencies/callers | Risk IDs |
|---|---|---|---|
| `public_html/index.html` | Web frontend | Active hashed JS/CSS, Apache SPA fallback | ARCH-001, OPS-003 |
| `public_html/api/index.php` | Web/API gateway | Apache rewrite; Node upstream | SEC-004, OPS-005 |
| `backend/index.js` | API/runtime | Direct Node start; incorrectly required by cluster | OPS-002, DB-001 |
| `backend/cluster.js` | Multi-process supervisor | PM2/Node invocation | OPS-002 |
| `ecosystem.config.js` | Deployment | PM2 | OPS-001 |
| `backend/database/migrations/` | Schema authority candidate | Migration runner | DB-001, DB-002, DB-003 |
| `database/ime365_live_database.sql` | Unknown/unsafe | Git/public consumers | DATA-001 |

Binary assets were inventoried by path/size/hash relationships rather than semantically decoded one by one. Generated vendor/minified code was contract-traced at integration boundaries.
