# latexmk configuration for the UC3M TFG template.
#   latexmk        build tfg_main.pdf with LuaLaTeX + Biber
#   latexmk -c     remove auxiliary files
#   latexmk -C     remove auxiliary files and the PDF

$pdf_mode = 4;   # 4 = LuaLaTeX

# --shell-escape is required by the svg package (it calls Inkscape).
$lualatex = 'lualatex --shell-escape -interaction=nonstopmode -synctex=1 %O %S';

# biblatex uses Biber; latexmk detects it automatically from the .bcf file.
