# Export Engine Audit

## Paths

- PDF/public export builds HTML and runs Playwright Chromium.
- DOCX maps template identifiers to `docx` themes.
- Browser print CSS exists for the renderer; cover letters expose print, resume builder does not.

## Results

| Check | Result | Evidence |
|---|---|---|
| Empty public export | 400 | isolated runtime |
| Unauthenticated DOCX | 401 | isolated runtime |
| Remote image boundary | FAIL by source | any HTTPS image/font/stylesheet allowed; SEC-003 |
| Chromium isolation | FAIL by source | `--no-sandbox`, TLS errors ignored |
| Template coverage | FAIL | mappings stop at Cv51 |
| PDF visual parity | BLOCKED | no authenticated deterministic run |
| DOCX structure/parity | BLOCKED | no authenticated deterministic run |
| Print action | FAIL | no resume UI action |
| Multi-page/long text | NOT EXECUTED | fixture environment unavailable |

## Correct qualification

For each of 104 required templates, render the same synthetic one-page and multipage fixture to editor preview, PDF raster, DOCX converted preview, and print PDF. Compare text inventory, order, fonts, margins, page breaks, overflow and image placement. A 2xx response is not a rendering pass.
