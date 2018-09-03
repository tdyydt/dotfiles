#!/usr/bin/perl

# via: http://konn-san.com/prog/why-not-latexmk.html
# via: https://texwiki.texjp.org/?Latexmk
# You can check config by: latexmk -commands

$latex = 'platex -halt-on-error';
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$max_repeat = 5;

# Not using synctex for now:
# $latex = 'platex -synctex=1 -halt-on-error';

# 3 => generates pdf via dvipdfmx
$pdf_mode = 3;
# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;
# Use Skim as a previewer
$pdf_previewer = "open -ga /Applications/Skim.app";
