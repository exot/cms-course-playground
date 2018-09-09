#!/bin/sh
# to save time ommit video download
#ytdl=0
# test for tools
which pdflatex >/dev/null || { echo "pdflatex missing."; exit 1; }
fn="ThisLandIsMine-byNinaPaley"
which youtube-dl >/dev/null || { echo "youtube-dl missing. movie will not work."; ytdl=0; }
which ffmpeg >/dev/null ||  { echo "ffmpeg missing. movie will not have a picture."; ffmp=0; }
# get dependencies
test -f ${fn}".mkv" -o "$ytdl" = "0" || youtube-dl -q -o ${fn} https://www.youtube.com/watch?v=4pKMV6e5kEo
test -f ${fn}".jpeg" -o "$ffmp" = "0" || ffmpeg -ss 3:12 -i ThisLandIsMine-byNinaPaley.mkv -vframes 1 -q:v 2 ThisLandIsMine-byNinaPaley.jpeg
fn="img-lion"
test -f ${fn}".pdf" || pdflatex ${fn}".tex"
# build keynote, regardless if there or not
fn=beamer-presentation
repeat=3; c=0; while test $repeat -gt 0; do
	repeat=$(( $repeat - 1 ))
	c=$(( $c + 1 ))
	pdflatex ${fn}".tex"
	echo $repeat $c
done
xdg-open ${fn}".pdf"
