#! /bin/bash

set -e -x

export TARGET=xtensael-elf

rm -rf build-$TARGET
mkdir build-$TARGET
cd build-$TARGET

export PREFIX=`pwd`/root
export PARALLEL=-j4

{
../build-binutils.sh
export PATH=`pwd`/root/bin:$PATH
../build-gcc.sh
../build-gdb.sh
} 2>&1 | tee build.log