#! /bin/bash -ex

VARIANT=$1
. `dirname "$0"`/config

cd build-$VARIANT

export PREFIX=`pwd`/root-linux

{
../build-headers.sh "$@"
../build-binutils-linux.sh "$@"
export PATH=$PREFIX/bin:$PATH
../build-gcc-linux.sh "$@"
../build-libc.sh "$@"
} 2>&1 | tee build.log
