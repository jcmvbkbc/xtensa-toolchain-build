#! /bin/bash -ex

. `dirname "$0"`/config

VARIANT=$1 SUFFIX=linux `dirname "$0"`/build-gcc.sh --with-sysroot=$PREFIX/sysroot --enable-tls
cp -a $PREFIX/xtensa-$1-linux/lib $PREFIX/sysroot/usr
