#!/bin/sh
# test for tools
which pdflatex || { echo "pdflatex missing."; exit 1; }
fn="ThisLandIsMine-byNinaPaley"
which youtube-dl || { echo "youtube-dl missing. movie wil not work."; touch ${fn}".mkv"; }
# get dependencies
test -f ${fn}".mkv" || youtube-dl -o ${fn} https://www.youtube.com/watch?v=4pKMV6e5kEo
fn="img-lion"
test -f ${fn}".pdf" || pdflatex ${fn}".tex"
# build keynote, regardless if there or not
fn=beamer-presentation
pdflatex ${fn}".tex"
pdflatex ${fn}".tex"
pdflatex ${fn}".tex"
xdg-open ${fn}".pdf"
