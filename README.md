# Tufte-style Beamer Template with Julia Integration
A beamer template using Tufte-LaTeX style with Julia code integration similar to [Tufte Algorithms Book Template](https://github.com/sisl/tufte_algorithms_book). The template allows for the direct compilation of a presentation-ready PDF, including support for figures, Julia algorithm blocks, and Julia console blocks.


Forked from [simple-tufte-beamer](https://github.com/ViniciusBRodrigues/simple-tufte-beamer) and framework modified from [tufte_algorithms_book](https://github.com/sisl/tufte_algorithms_book).


### Example
See example slides: [`main.pdf`](https://github.com/mossr/julia-tufte-beamer/blob/master/main.pdf)

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/1_title.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/2_juliaverbatim.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/3_juliaconsole.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/4_plotting.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/5_tikz.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/6_algorithms.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/7_definitions.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/8_tables.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/9_bullets.svg">
</p>

---

<p align="center">
  <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/svg/10_references.svg">
</p>

---

# Installation
Install [Julia](https://julialang.org/downloads/).

Install LaTeX via texlive. We recommend [this repo](https://github.com/scottkosty/install-tl-ubuntu).
- Install the `lm-math` package to get the LatinModernMath font.

Clone the repository to a location of your choosing:
```
git clone https://github.com/mossr/julia-tufte-beamer.git
```

Initialize and update the submodule ([juliaplots.sty](https://github.com/sisl/juliaplots.sty)):
```
git submodule init
git submodule update
```

Install lexer and style (may need `pip3` instead):
```
pip install --upgrade git+https://github.com/sisl/pygments-julia#egg=pygments_julia
pip install --upgrade git+https://github.com/sisl/pygments-style-algfordm#egg=pygments_style_algfordm
```

Install the required Julia packages.
```
julia jl/install.jl
```

Install `pdf2svg`, which is used by PGFPlots (we assume Ubuntu - other operating systems may install pdf2svg differently):
```
sudo apt-get install pdf2svg
```
For `pdf2svg` on Windows (place `dist-*` directory on PATH): https://github.com/jalios/pdf2svg-windows

Install [pgfplots](https://ctan.org/pkg/pgfplots).

We require pythontex 0.17, which was just recently tagged. You will probably have to update your version on texlive on miktex. Alternatively, you can download the latest version of pythontex from https://github.com/gpoore/pythontex.

(Note that on arch-based systems, one should use tllocalmgr instead.)

## Test

Running the following pulls all the code and then runs all tests in `juliatest` blocks. See `runtests.jl` for details.

```
julia jl/runtests.jl
```

## Compilation

Install `latexmk` from: https://mg.readthedocs.io/latexmk.html#installation

* `latexmk` will compile everything (see `output/` for PDF).
    * `latexmk` will intelligently compile only the necessary bits.
* `latexmk -c` will clean up generated files.
* `latexmk -C` will clean up generated files (including `.pdf`).
* `latexmk tex/sandbox.tex` will compile `tex/sandbox.tex` (meant for development, e.g., single files)


## Directory structure

    .
    ├── ...
    ├── jl                      # Julia framework script files
    ├── tex                     # LaTeX files (main and preamble files)
    │   └── slides              # LaTeX files (specifically for slides)
    └── output                  # Generated output file (.aux files, etc)
