#! /bin/bash

set -e -x
BINUTILS=binutils-2.20.1

export LANG=C

mkdir $BINUTILS
cd $BINUTILS
../../$BINUTILS/configure --prefix=$PREFIX --target=$TARGET --enable-shared
make $PARALLEL
#make check
make install
