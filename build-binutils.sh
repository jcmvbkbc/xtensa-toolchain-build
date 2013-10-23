#! /bin/bash -ex

. `dirname "$0"`/config

export LANG=C

rm -rf $BINUTILS-$SUFFIX
mkdir $BINUTILS-$SUFFIX
cd $BINUTILS-$SUFFIX
../../$BINUTILS/configure --prefix=$PREFIX --target=$TARGET --enable-shared --disable-werror "$@"
make $PARALLEL
#make check
make install
