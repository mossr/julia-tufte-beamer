# Tufte-style Beamer Template with Julia Integration
A beamer template using Tufte-LaTeX style with Julia code integration similar to [Tufte Algorithms Book Template](https://github.com/sisl/tufte_algorithms_book). The template allows for the direct compilation of a presentation-ready PDF, including support for figures, Julia algorithm blocks, and Julia console blocks.


Forked from [simple-tufte-beamer](https://github.com/ViniciusBRodrigues/simple-tufte-beamer) and framework modified from [tufte_algorithms_book](https://github.com/sisl/tufte_algorithms_book).

See example slides: [`main.pdf`](https://github.com/mossr/julia-tufte-beamer/blob/master/main.pdf)


# Installation
Install [Julia](https://julialang.org/downloads/).

Install LaTeX via texlive. We recommend [this repo](https://github.com/scottkosty/install-tl-ubuntu).

Clone the repository to a location of your choosing:
```
git clone https://github.com/mossr/julia-tufte-beamer.git
```

Initialize and update the submodules:
```
git submodule init
git submodule update
```

Compile the style:
```
cd style
sudo python setup.py install
cd ..
```

Compile the lexer:
```
cd lexer
sudo python setup.py install
cd ..
```

Install the required Julia packages.
```
make install
```

Install `pdf2svg`, which is used by PGFPlots (we assume Ubuntu - other operating systems may install pdf2svg differently):
```
sudo apt-get install pdf2svg
```

Install [pgfplots](https://ctan.org/pkg/pgfplots).

We require pythontex 0.17, which was just recently tagged. You will probably have to update your version on texlive on miktex. Alternatively, you can download the latest version of pythontex from https://github.com/gpoore/pythontex.

(Note that on arch-based systems, one should use tllocalmgr instead.)

## Test

Running `make test` pulls all the code and then runs all tests in `juliatest` blocks. See `runtests.jl` for details.

## Compilation

* `make compile` compiles the whole presentation (`make main` works too)
* `make sandbox` will compile `tex/sandbox.tex` (meant for development, e.g., single slides)
* `make quick` will only run `lualatex` (skipping `pythontex` and `biber` for quick LaTeX compilation)
    * `make quick-sandbox` does quick compilation for `tex/sandbox.tex`
* `make clean` removes all generated files except `main.pdf` and `sandbox.pdf`
* `make full` runs `clean` and `compile`
    * `make full-sandbox` does full clean/compilation for `tex/sandbox.tex`
* `make save` copies the `main.pdf` file to `presentation.pdf` (which you can modify in the makefile)


## Directory structure

    .
    ├── ...
    ├── jl                      # Julia framework script files
    ├── tex                     # LaTeX files (main and preamble files)
    │   └── slides              # LaTeX files (specifically for slides)
    └── output                  # Generated output file (.aux files, etc)
