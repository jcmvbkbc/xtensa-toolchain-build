#! /bin/bash -ex

VARIANT=$1
. `dirname "$0"`/config

cd build-$VARIANT

export PREFIX=`pwd`/root-linux

{
../build-libc.sh "$@"
../build-binutils-linux.sh "$@"
export PATH=$PREFIX/bin:$PATH
../build-gcc-linux.sh "$@"
} 2>&1 | tee build.log
