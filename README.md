# thesis-template-typst

This is a template for the Typst typesetting system for a bachelor's thesis at the Faculty of Education, Charles University.

## Requirements

- [Typst compiler][typstrepo]
- Text editor (recommended VSCode or [VSCodium][VSCodiumwww] with Tinymist Typst extension)

## Compiling into PDF

**Ensure you are in a root(where main.typ is) and then run:**

```bash
  typst compile -f pdf --pretty --pdf-standard a-2u main.typ thesis.pdf
```

## Resources

- [ISO 690 biblatex style](https://ftp.cvut.cz/tex-archive/macros/latex/contrib/biblatex-contrib/biblatex-iso690/biblatex-iso690.pdf)
- [ISO 690 biblatex examples](https://github.com/michal-h21/biblatex-iso690/blob/master/biblatex-iso690-examples.bib)
- [LaTeX template used as inspiration](https://github.com/pedf-uk/thesis-template-latex/)

  ---

### Faculty regulations and template

- [Dean's Regulations](https://wwwmod.pedf.cuni.cz/udeska/files/opatreni_dekana/opad_28_2024_prace_opr.pdf)
- [Template](https://wwwmod.pedf.cuni.cz/udeska/files/opatreni_dekana/opad_28_2024_priloha_1_bakalarska_prace.docx)

[typstrepo]: https://github.com/typst/typst
[VSCodiumwww]: https://vscodium.com/
