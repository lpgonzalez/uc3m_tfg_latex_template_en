# uc3m_tfg_latex_template_en

LaTeX template for **Bachelor's theses (TFG)** at Universidad Carlos III de
Madrid (UC3M). English version. A Spanish version is available at
`uc3m_tfg_latex_template_es`.

The template follows the UC3M formatting rules (A4 paper, 2.5 cm top/bottom and
3 cm left/right margins, 1.15 line spacing) and produces a PDF with embedded
metadata (title, author, subject, keywords).

---

## Requirements

This template **must be compiled with LuaLaTeX** (it uses `fontspec`,
`microtype`, `emoji` and `svg`) and **Biber** for the bibliography. The default
body font is *TeX Gyre Heros* (a free Arial/Helvetica-compatible font shipped
with TeX Live and Overleaf), so no font file needs to be installed.

---

## How to compile

### On Overleaf (recommended)

1. Upload the project (or import it from GitHub).
2. Open **Menu → Settings** and set:
   - **Compiler:** `LuaLaTeX`
   - **Main document:** `tfg_main.tex`
   - **TeX Live version:** a recent one.
3. Press **Recompile**. Biber runs automatically.

> The `svg` package needs Inkscape and shell-escape; both are available on
> Overleaf, so SVG figures work out of the box (the first compilation may be
> slower).

### Locally

You need a recent TeX distribution (TeX Live / MiKTeX), **Biber**, and
**Inkscape** (for the `svg` package). A `.latexmkrc` file is included, so you
can simply run:

```bash
latexmk           # builds tfg_main.pdf with LuaLaTeX + Biber
latexmk -c        # removes auxiliary files
latexmk -C        # removes auxiliary files and the PDF
```

Or, without latexmk:

```bash
lualatex --shell-escape tfg_main
biber tfg_main
lualatex --shell-escape tfg_main
lualatex --shell-escape tfg_main
```

---

## Project structure

```
tfg_main.tex            Main document (orchestration only)
tfg_vars.tex            Your data: title, author, advisor, license, etc.
tfg_template_info.tex   Template metadata (version/provenance); not edited by students
tfg_uc3m.sty            Style package: packages, layout, fonts, metadata
tfg_coverpage.sty       Cover page (\makecover)
.latexmkrc              Local build configuration (LuaLaTeX + Biber)
OpenMoji-color-glyf_colr_0.ttf   Vector colour emoji font (OpenMoji); see Notes

bibliography/
  bibliography.bib      Your references (BibLaTeX)

chapters/
  00_examples.tex       Demo chapter (delete it for the final version)
  01_introduction.tex
  02_soa.tex            State of the art
  03_method.tex
  04_validation.tex
  05_resultsanddiscussion.tex
  06_projectmanagement.tex
  07_conclusions.tex
  08_futurelines.tex
  09_annexes.tex

others/
  acks.tex              Acknowledgments / dedication
  abstract.tex          Abstract (English)
  resumen.tex           Resumen (Spanish) - remove if not required
  glossary.tex          Glossary and acronym entries

images/
  coverpage/            UC3M and license logos
  examples/             Images used by the demo chapter
```

---

## How to customise

1. **Your data:** edit `tfg_vars.tex` (title, author, advisor, degree,
   academic year, place and date, keywords). These values also feed the PDF
   metadata.
2. **License:** set `\licenseType` to `cc` (Creative Commons, recommended) or
   `reserved` (all rights reserved).
3. **Bibliography style:** set `\bibStyle` to `ieee` or `apa`. Add your
   references to `bibliography/bibliography.bib`.
4. **Font:** the body font is set in `tfg_uc3m.sty`. To use a Times-like serif
   font, replace `TeX Gyre Heros` with `TeX Gyre Termes`.
5. **Colours:** the colour values are in the *COLOURS* section at the end of
   `tfg_vars.tex` (most users will not need to change them).
6. **Content:** write each chapter under `chapters/` (they ship with a section
   skeleton and guidance comments typical of a TFG report) and the summaries
   under `others/`. To hide the demo chapter before submitting, set
   `\showDemoChapter` to `false` in `tfg_vars.tex` (you may also delete
   `00_examples.tex`).

---

## PDF/A output for deposit (e-Archivo)

The UC3M repository (e-Archivo) asks for a PDF/A file, a long-term archival
format with embedded fonts and metadata. To produce one:

1. Set `\showDemoChapter` to `false` in `tfg_vars.tex` to hide the demo chapter
   (it is example content) and write your real content.
2. At the very top of `tfg_main.tex`, set `\pdfaOutput` to `true`.
3. Recompile. The title, author, subject and keywords from `tfg_vars.tex` are
   embedded as XMP metadata automatically.
4. Validate the result with [veraPDF](https://verapdf.org) or Adobe Preflight
   before submitting.

We use level **A-2b** (not the stricter A-1b) because it allows the
transparency present in the SVG logos. Keep it disabled while drafting and
enable it only for the final file.

## Notes

- Use `\gls{...}` for acronyms/glossary terms defined in `others/glossary.tex`.
- Cross-reference chapters with their ASCII labels, e.g. `\ref{ch:introduction}`.
- Highlight source code: set the language on each block, e.g.
  `\begin{lstlisting}[language=Python]` (also C++, Java, HTML, SQL, bash...).
  A single colour scheme highlights every language; JavaScript is predefined.
- For wide tables you have `tabularx` (line wrapping),
  `\resizebox{\textwidth}{!}{...}` (rescaling) and `\rotatebox{90}{...}` (rotate
  a table in place). For a **landscape page** (horizontal), wrap the content in
  `\begin{tfglandscape} ... \end{tfglandscape}`: it works for wide tables,
  figures or text, keeps the header and footer, and is valid in PDF/A too. The
  demo chapter has examples of all of these.
- All fonts (emojis included) are embedded in both the normal and PDF/A files,
  so the document is portable and looks identical in any viewer or device.
- Emojis use the vector colour font OpenMoji (`OpenMoji-color-glyf_colr_0.ttf`
  in the project root); keep and upload that file, or the template falls back
  to the bitmap Noto Color Emoji.
- The PDF metadata records the template: set `\templateRepo`,
  `\templateAuthor`, `\templateContributors`, `\templateVersion`,
  `\templateDate` and `\templateComments` in `tfg_template_info.tex`. They appear as
  custom `Template.*` properties (Adobe → Document Properties → Custom); the URL
  is also in the Creator field.
- The demo chapter shows text, lists, images (raster and SVG), tables, source
  code, equations, emojis, glossary terms and citations.
- Convention: parameterised pieces live in `others/` and the `.sty` files;
  free-prose chapters and extra annexes live in `chapters/`. To add an annex
  other than the AI declaration, create a file in `chapters/` and `\input` it
  in `tfg_main.tex` after `chapters/09_annexes`.

---

## Credits and acknowledgements

Template based on the official UC3M Bachelor's Thesis template, with influences
from other templates, publicly available LaTeX snippets, original development,
and suggestions and improvements contributed by former students, plus various
optimisations.

To all students —past, present and future— who trusted, trust and will trust me
as their BSc/MSc thesis advisor, and who inspired me to rescue, refactor and
improve this template to its current state, to make developing their final
project easier. Thanks also to the LaTeX community for its extensive support, to
the tools and platforms that make collaborative LaTeX editing possible, and to
the creators of LaTeX.
