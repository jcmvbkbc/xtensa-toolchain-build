#! /bin/bash -ex

. `dirname "$0"`/config

rm -rf build-$TARGET
mkdir build-$TARGET
cd build-$TARGET

export PREFIX=`pwd`/root

{
../build-binutils.sh "$@"
export PATH=`pwd`/root/bin:$PATH
../build-gcc.sh "$@"
../build-gdb.sh "$@"
../ccache-install.sh
} 2>&1 | tee build.log
