#! /bin/bash -ex

VARIANT=$1
SUFFIX=elf
. `dirname "$0"`/config

rm -rf build-$VARIANT
mkdir build-$VARIANT
cd build-$VARIANT

export PREFIX=`pwd`/root

{
../build-binutils-elf.sh "$@"
export PATH=`pwd`/root/bin:$PATH
../build-gcc-elf.sh "$@"
../build-gdb.sh "$@"
../ccache-install.sh
} 2>&1 | tee build.log
