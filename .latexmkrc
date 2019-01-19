#!/usr/bin/perl

## -- Japanese

$latex = 'platex -synctex=1 -interaction=nonstopmode -halt-on-error';
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$max_repeat = 5;
$pdf_mode = 3;                  # dvipdf

## -- Viewer

if ($^O eq 'darwin') {
    # Don't let latexmk remove PDF after typeset.
    # This enables Skim to chase the update in PDF automatically.
    $pvc_view_file_via_temporary = 0;
    # Use Skim as a previewer
    $pdf_previewer = "open -ga /Applications/Skim.app";
}
