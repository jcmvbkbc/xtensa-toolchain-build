#! /bin/bash -ex

VARIANT=$1
. `dirname "$0"`/config

export ARCH=xtensa
export CROSS_COMPILE=`pwd`/root-linux/bin/xtensa-$VARIANT-linux-

make -C `pwd`/../$UCLIBC $PARALLEL O=`pwd`/$UCLIBC oldconfig < /dev/null
#make -C `pwd`/../$UCLIBC $PARALLEL O=`pwd`/$UCLIBC menuconfig
make -C `pwd`/../$UCLIBC $PARALLEL O=`pwd`/$UCLIBC
PREFIX=$PREFIX/sysroot make -C `pwd`/../$UCLIBC O=`pwd`/$UCLIBC install
ln -s ld-uClibc.so.0 $PREFIX/sysroot/usr/lib/ld.so.1
ln -s usr/lib $PREFIX/sysroot/lib
