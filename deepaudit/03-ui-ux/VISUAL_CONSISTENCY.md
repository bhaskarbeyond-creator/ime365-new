# Visual Consistency

## Positive observations

- Desktop typography, card radii, blue/indigo palette and spacing are broadly coherent.
- Current 51 template thumbnails are unique and share 993×1404 dimensions.
- Blog and legal pages inherit the main visual system.

## Inconsistencies

- The mobile sticky header consumes disproportionate width/height and compresses navigation.
- Horizontal feature/pill content clips rather than reflows.
- Auth appears as a bottom sheet visually but lacks the interaction semantics of one.
- Several template/admin cards use hover-only controls or clickable `div` elements.
- Generic renderer presets and separate legacy template components create an unverified risk that thumbnail, editor and export visuals diverge.

## Visual regression baseline

Capture route/component baselines at all five mandated widths plus print media. Template parity requires deterministic screenshots of editor, PDF, DOCX-converted preview and print, not only thumbnails.
