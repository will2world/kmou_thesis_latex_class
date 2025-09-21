# KMOU Thesis LaTeX Class

A minimal LaTeX class (`kmou_thesis.cls`) for writing theses at  
**Korea Maritime & Ocean University (KMOU)**.  
This repository provides a structured template including cover pages, table of contents, abstract, main chapters, acknowledgments, and references.

## 📂 Repository Structure
kmou_thesis_latex_class/
├── figs/ # Example figures
│ └── tsne_2d.pdf
├── elsarticle-harv.bst # Elsevier Harvard-style reference format
├── elsarticle-num.bst # Elsevier numbered reference format
├── kmou_thesis.cls # Thesis class file
├── README.md # Project introduction
├── refs.bib # Sample bibliography file
├── sample_thesis.pdf # Compiled example thesis
└── sample_thesis.tex # Example thesis source file

## ✨ Features

- Custom thesis class `kmou_thesis.cls`  
- Sample `.tex` file demonstrating:
  - Cover and approval pages
  - Table of contents, list of tables, list of figures
  - Abbreviations section
  - Abstract
  - Chapters with equations, figures, and tables
  - Acknowledgments and bibliography
- Preconfigured with:
  - `natbib` for citations
  - `cleveref` for cross-references
  - Example bibliography entries in `refs.bib`


## 📖 Bibliography Styles

This template includes two Elsevier `.bst` files:

- `elsarticle-harv.bst` — Harvard author-year style  
- `elsarticle-num.bst` — Numbered style  

These `.bst` files are officially distributed by Elsevier.  
For the latest version, please refer to the [Elsevier LaTeX package on CTAN](https://ctan.org/pkg/elsarticle).

Default setting in `sample_thesis.tex`:
```latex
\bibliographystyle{cas-model2-names}
\bibliography{refs}
```


## 📝 License
- `kmou_thesis.cls` and `sample_thesis.tex` are released under the MIT License.
- `elsarticle-harv.bst` and `elsarticle-num.bst` are provided by Elsevier (see [CTAN link](https://ctan.org/pkg/elsarticle)).
