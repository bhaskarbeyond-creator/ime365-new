# Template Parity Analysis

## Inventory

- Active catalog: 51 `Cv1–Cv51` resume templates.
- Cover-letter catalog: four `Cover1–Cover4` layouts.
- Target: 100 resume templates plus four distinct CV templates.
- Missing: 49 resume templates and four CV templates. Cover letters are not CVs.
- Current thumbnails: 51 unique 993×1404 JPGs.

## Renderer risk

The generic `TemplateRenderer` routes all current IDs through archetype/preset composition while separate legacy `Cv*` component chunks also exist. Without source provenance and deterministic cross-output screenshots, visual mismatch is a high-risk inference, not a confirmed defect.

## Parity definition

A template passes only if definition, registration, thumbnail, picker, editor, preview, PDF, DOCX, print, data binding, optional sections and multipage output represent the same design and content. See [TEMPLATE_TEST_MATRIX.md](../09-test-strategy/TEMPLATE_TEST_MATRIX.md).
