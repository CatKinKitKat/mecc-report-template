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
