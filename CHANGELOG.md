# Changelog

All notable changes to this template are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this template adheres to [Semantic Versioning](https://semver.org/).

## [2.0.1] - 2026-05-25

### Added
- Expanded the acronyms/glossary example to match the Typst version: a new
  acronym "OS" (without a glossary entry) and the term "Free software" (without
  an acronym), in addition to the existing GUL and UC3M.

### Changed
- Cover: the Creative Commons logo is now smaller and placed to the left of the
  license notice, with the text at ~10 pt so it does not stand out.
- The code listing caption label is now `Code` (instead of the default `Listing`).

### Fixed
- The lists (contents, figures and tables) now flow continuously, with no blank
  pages inserted between them.

## [2.0.0] - 2026-05-22

Major overhaul of the template: deposit-ready output (PDF/A), modern fonts and
emojis, expanded chapters and examples, PDF metadata, and bilingual
documentation and comments.

### Added
- **PDF/A-2b** output for the e-Archivo deposit through the `\pdfaOutput` switch
  in `tfg_main.tex` (`\DocumentMetadata`, sRGB OutputIntent and PDF 1.7).
  Validated with veraPDF.
- In PDF/A mode, **hyperlinks are coloured** (blue) so they remain
  distinguishable.
- **Vector colour emojis** with OpenMoji via `\emoji{...}`; embedded as glyphs
  and valid in PDF/A.
- A **`tfglandscape`** environment for genuinely landscape pages (A4
  horizontal), keeping the body header and footer, valid in PDF/A too.
- A **`\showDemoChapter`** switch to show or hide the demo chapter without
  commenting anything out in `tfg_main.tex`.
- **Template metadata** in the PDF (Creator field and custom `Template.*`
  properties: URL, Author, Contributors, Version, Date, Comments), in the new
  `tfg_template_info.tex` file.
- **Per-language code highlighting**: a single `listings` scheme colours Python,
  C, C++, Java, HTML, SQL, bash...; just set `language=...` (JavaScript is
  predefined).
- Expanded demo chapter (`chapters/00_examples.tex`): text, lists, raster and
  SVG images, subfigures, tables (`tabularx`, `\resizebox` and a rotated table
  with `\rotatebox`), a landscape page, footnotes, code, equations, emojis,
  glossary/acronyms and citations.
- **Section skeletons and guidance comments** in every chapter
  (`chapters/01`–`09`), typical of a thesis report.
- Reference examples in `bibliography/bibliography.bib`: article, book and online
  resource.
- A **credits and acknowledgements** section in the README and in the header of
  `tfg_uc3m.sty`.

### Changed
- **Compiler standardised on LuaLaTeX + Biber** (recommended and documented).
- Fonts managed with `fontspec` (TeX Gyre Heros and TeX Gyre Cursor), fully
  embedded in the PDF to guarantee portability.
- Normal PDF version forced to **1.7** (LuaTeX defaults to 1.5).
- **Bilingual, reviewed comments** across all files (English in this repository,
  Spanish in `uc3m_tfg_latex_template_es`).
- README rewritten: structure, customisation, PDF/A generation and notes.
- Template metadata moved from `tfg_vars.tex` to `tfg_template_info.tex` to
  separate what students edit from what the template maintainer updates.

### Removed
- Unused packages: `pdflscape`, `rotating` and `floatrow`. Their roles are
  covered by the `tfglandscape` environment, by `\rotatebox` (from `graphicx`)
  and by `float`.
