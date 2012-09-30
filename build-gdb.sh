#! /bin/bash -ex

. `dirname "$0"`/config

export LANG=C

mkdir $GDB
cd $GDB
../../$GDB/configure --prefix=$PREFIX --target=$TARGET --with-expat
make $PARALLEL
#make check
make install
