#! /bin/bash

GCC=gcc-4.4.5

set -e -x
export LANG=C
rm -rf $GCC
mkdir $GCC
cd $GCC
../../$GCC/configure --target=$TARGET --prefix=$PREFIX \
    --with-newlib --with-float=soft --enable-__cxa_atexit --disable-shared --disable-libssp --enable-languages=c,c++
make $PARALLEL all
make install
