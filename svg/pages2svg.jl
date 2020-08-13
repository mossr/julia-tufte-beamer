pages = [
    "title",
    "juliaverbatim",
    "juliaconsole",
    "plotting",
    "tikz",
    "algorithms",
    "definitions",
    "tables",
    "bullets",
    "references",
]

md_img(file) = """
<p align="center">
  <!-- <img src="https://github.com/mossr/julia-tufte-beamer/blob/master/$file"> -->
  <img src="$file">
</p>
"""

path_pdf = abspath("../main.pdf")
path_svg = abspath(".")
run(`pdf2svg2.bat $path_pdf $path_svg`) # https://community.jalios.com/jcms/jc2_183627/en/pdf2svg2-bat-script

println("---\n")
for (i, page) in enumerate(pages)
    newname = "$(i)_$page.svg"
    mv("content$i.svg", newname; force=true)
    println(md_img("svg/$newname"))
    println("---\n")
end