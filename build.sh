#!/bin/sh
# test for tools
which pdflatex || { echo "pdflatex missing."; exit 1; }
which youtube-dl || { echo "youtube-dl missing."; exit 1; }
# get dependencies
fn=img-lion.pdf
test -f ${fn} || pdflatex ${fn}
fn=ThisLandIsMine-byNinaPaley.mkv
test -f ${fn} || youtube-dl -o ${fn} https://www.youtube.com/watch?v=4pKMV6e5kEo
# build keynote
fn=beamer-presentation
pdflatex ${fn}".tex"
pdflatex ${fn}".tex"
xdg-open ${fn}".pdf"
