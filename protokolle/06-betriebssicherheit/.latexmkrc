$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
ensure_path('TEXINPUTS', '../../vorlage//');
$clean_ext = 'synctex.gz run.xml bbl';
