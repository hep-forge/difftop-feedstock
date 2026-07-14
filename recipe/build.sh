#! /usr/bin/bash
set -e

# Makefile hardcodes `FF = gfortran` -- resolves to nothing on macOS
# (conda's gfortran is target-triple-prefixed, not on PATH as bare
# `gfortran`) and to whatever gfortran happens to be on the Linux
# runner's PATH otherwise (a latent GLIBC leak, not necessarily conda's
# pinned one). Override on the command line so conda's own $FC wins.
make FF="$FC"
cp difftop1PI $PREFIX/bin/
