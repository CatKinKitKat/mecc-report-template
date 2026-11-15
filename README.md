# IPBeja academic report template

XeLaTeX starter for academic work, aligned with the IPBeja 2024 norms supplied with this project. The companion `mecc-beamer-template` is for presentations; slide decks are not academic reports.

## Compile

Use XeLaTeX and Biber (Overleaf: Menu → Compiler → XeLaTeX; bibliography tool Biber):

```sh
latexmk -xelatex main.tex
```

## Start a document

1. Edit the metadata macros near the top of `main.tex` (school, programme, course, title, author, supervisor, year).
2. Replace the cover, abstract, keywords and sample chapter text with your work.
3. Split chapters into separate `.tex` files under `pages/` and `\\input{pages/name}` from `main.tex` as needed.
4. Add sources to `main.bib`; cite them with `\\parencite{key}` or `\\textcite{key}`. The sample entries are placeholders and must be corrected to the actual source metadata before submission.
5. Add optional jury, acknowledgements, glossary, appendices or annexes only when applicable. Generate category indexes only when relevant (the norms recommend them for more than five items).

## Norms represented

- A4, 12 pt Garamond (EB Garamond, then system Garamond; TeX Gyre Pagella fallback), 1.5 line spacing, 1.27 cm paragraph indent.
- 3 cm top/bottom and 2 cm left/right margins.
- Roman-numbered front matter and Arabic-numbered main matter; chapter starts on odd pages.
- Lower-right page number in 8 pt.
- Portuguese APA author–date citations and alphabetically sorted references, printed under “Referências Bibliográficas”.
- Cover fields include IPBeja, school/programme, course, title, full student name and Beja/year; no decorative cover artwork.
- Summary and abstract placeholders note the 100–250 word range; keywords placeholders note 3–6 semicolon-separated terms.

Check each course's instructions before submission; the norms permit requirements specific to a curricular unit. Cover and title-page line spacing/layout can need local adjustment to match the official visual model.

## Markdown → PDF with Pandoc

The repo includes `pandoc-template.tex`, a Pandoc-facing copy of the template with all cover/front-matter variables wired to Markdown front matter and a `$body$` insertion point for the Markdown content. Use it from the repository root so relative paths (`fonts/`, `resources/`, `main.bib`) resolve.

```sh
pandoc report.md \
  --from=markdown \
  --to=latex \
  --standalone \
  --template=pandoc-template.tex \
  --top-level-division=chapter \
  --syntax-highlighting=none \
  --biblatex \
  --output=report.tex

latexmk -xelatex -interaction=nonstopmode -halt-on-error report.tex
```

### Required Markdown front matter

```markdown
---
title: "Título do trabalho"
subtitle: "Subtítulo opcional"
author:
  - "Nome completo do/a estudante"
degree: "Ciclo de estudos"
course: "Unidade curricular"
supervisor: "Orientador/a (opcional)"
year: "2026"
institution: "Instituto Politécnico de Beja"
school: "Escola Superior de Tecnologia e Gestão"

abstract-pt: |
  Resumo em português (100–250 palavras).

keywords-pt:
  - "Palavra-chave 1"
  - "Palavra-chave 2"

abstract-en: |
  Abstract in English (100–250 words).

keywords-en:
  - "Keyword 1"
  - "Keyword 2"
---

# Introdução

Conteúdo do primeiro capítulo...

## Secção

Mais conteúdo...
```

### Notes

- `--top-level-division=chapter` makes `#` headings become `\chapter`, matching the `book` class.
- `--biblatex` produces LaTeX citations for the existing BibLaTeX/Biber setup; add sources to `main.bib` and cite with `[@key]` or `[@key, p. 12]` in Markdown.
- Fonts and logo are loaded via relative paths; run from the repo root.
- The template adds minimal Pandoc support packages (`longtable`, `caption`, `\tightlist`, etc.). Complex Markdown (multi-page tables, raw LaTeX) may need more definitions—compare with `pandoc --print-default-template=latex` when needed.
