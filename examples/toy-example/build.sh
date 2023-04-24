#!/bin/bash
# usage: ./build.sh FILENAME
# e.g. ./build.sh book (note that you do not add .tex in the end)

fname=${1:-main}

rm -f .aux  $fname.log  $fname.out  $fname.pdf  $fname.toc
sudo docker run -it -v$(pwd):/home -w/home texlive/texlive xelatex $fname.tex && \
    sudo docker run -it -v$(pwd):/home -w/home texlive/texlive xelatex $fname.tex
