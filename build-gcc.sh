#! /bin/bash

GCC=gcc-4.4.5

set -e -x
export LANG=C
rm -rf $GCC
mkdir $GCC
cd $GCC
../../$GCC/configure --target=$TARGET --prefix=$PREFIX \
    --with-newlib --enable-__cxa_atexit --disable-shared --disable-libssp --enable-languages=c
make $PARALLEL all-gcc all-target-libgcc
make install-gcc install-target-libgcc
