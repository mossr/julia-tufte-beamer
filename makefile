.PHONY : set-main set-sandbox

install:
	julia --color=yes jl/install.jl

test:
	julia --color=yes jl/pull_julia_code.jl
	julia --color=yes jl/runtests.jl


## Set the tex filename for `main` or `sandbox`
set-main:
	$(eval MAIN := tex/main)
set-sandbox:
	$(eval MAIN := tex/sandbox)


## Full complication
compile-core:
	-julia --color=yes jl/pull_julia_code.jl && \
	lualatex -shell-escape --aux-directory=output --include-directory=tex --include-directory=output $(MAIN) && \
	pythontex output/$$(basename $(MAIN)) && \
	biber --input-directory=tex output/$$(basename $(MAIN)) && \
	lualatex -shell-escape --aux-directory=output --include-directory=tex --include-directory=output $(MAIN)


compile: set-main compile-core
main: compile # duplicate of `compile`

sandbox: set-sandbox compile-core


## Full clean and compile
full: clean compile
full-sandbox: clean sandbox


## Quickly compile using only lualatex
quick-core:
	lualatex -shell-escape --aux-directory=output --include-directory=tex --include-directory=output $(MAIN)

quick: set-main quick-core

quick-sandbox: set-sandbox quick-core


## Clean generated files
clean:
	rm -rf output

save:
	cp main.pdf presentation.pdf