#! /bin/bash -ex

. `dirname "$0"`/config

export LANG=C

mkdir $BINUTILS
cd $BINUTILS
../../$BINUTILS/configure --prefix=$PREFIX --target=$TARGET --enable-shared --disable-werror
make $PARALLEL
#make check
make install
