#! /bin/bash -ex

VARIANT=$1
SUFFIX=elf

. `dirname "$0"`/config

export LANG=C

rm -rf $GDB-$SUFFIX
mkdir $GDB-$SUFFIX
cd $GDB-$SUFFIX
../../$GDB/configure --prefix=$PREFIX --target=$TARGET --with-expat
make $PARALLEL
#make check
make install
