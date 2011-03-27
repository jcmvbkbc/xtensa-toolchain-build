#! /bin/bash

set -e -x
GDB=gdb-7.2

export LANG=C

mkdir $GDB
cd $GDB
../../$GDB/configure --prefix=$PREFIX --target=$TARGET --with-expat
make $PARALLEL
#make check
make install
