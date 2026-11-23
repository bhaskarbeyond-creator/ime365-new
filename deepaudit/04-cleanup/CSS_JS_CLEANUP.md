# CSS and JavaScript Cleanup

## CSS

- Consolidate auth/modal focus, overlay and dialog styles behind an accessible shared primitive.
- Remove fixed-height public-page scrolling and normalize mobile flex/grid min-width behavior.
- Add reduced-motion overrides that stop typewriter/cursor transitions.
- Preserve print rules, then bind them to a resume print action.
- Do not globally reformat minified output; changes belong in restored source.

## JavaScript

- Replace cover dynamic-import default/named drift with an explicit typed API module.
- Replace duplicate template arrays with one catalog contract.
- Remove stale hashed generations only from clean build output.
- Create bundle-contract tests that import every lazy chunk and assert exports.
- Create route and repository descriptors that fail on unclassified additions.

Compiled output is generated code; manual edits would be non-maintainable and are not proposed.
