# Accessibility Issues

| Failure | Evidence | Repair | Test |
|---|---|---|---|
| Auth modal has no dialog semantics | runtime `role=dialog` count 0, `aria-modal` count 0 | shared Dialog with labelled title/description | axe + role assertions |
| Escape does not close | Playwright Escape left modal visible | close on Escape unless blocking operation | keyboard E2E |
| Focus not trapped/restored | bundle has no trap; active focus can reach page | focus first field, cycle inside, restore trigger | Tab/Shift+Tab E2E |
| Form validity not exposed | visible inputs `required=false`, no `aria-invalid/describedby` | native required plus linked errors | invalid submit assertions |
| Click-only mode switch | anchor without href/role | semantic button | keyboard activation |
| Toast not announced | no live role | `role=status` or `alert` by urgency | accessibility-tree assertion |
| Focus outline removed | auth CSS | visible `:focus-visible` ring | screenshot + computed style |
| Nested `main` landmarks | two visible main elements | exactly one page main | landmark assertion |
| FAQ search lacks accessible name | placeholder only | persistent label or aria-label | name assertion |
| Preview is clickable `div` | no role/tabindex | button with accessible name | keyboard click |
| Reduced motion ignored | animated text changed under reduce | disable typing/cursor animation | time-stability test |
| Small targets | 30–40 visible controls sampled under 44 px | 44×44 target box/spacing | geometry gate |
