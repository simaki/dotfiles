#!usr/bin/perl
$latex = 'pdf -synctex=1 -halt-on-error';
$bibtex = 'bibtex';
$makeindex = 'mendex $0 -o %D %S';
$max_repeat = 10;
$pdf_mode = 1;
$pdf_previewer = 'open -ga /Applications/Skim.app',
push @generated_exts, "synctex.gz";
