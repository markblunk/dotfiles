# Generate pdf using pdflatex (-pdf)
$pdf_mode = 1;

# Use bibtex if a .bib file exists
$bibtex_use = 1;

$pdflatex = 'pdflatex --shell-escape %O %S';