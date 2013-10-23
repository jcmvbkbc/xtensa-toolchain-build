#! /bin/bash -ex

VARIANT=$1
. `dirname "$0"`/config

rm -rf $LINUX $UCLIBC $PREFIX/sysroot
mkdir $LINUX $UCLIBC
sed "s!KERNEL_HEADERS=.*!KERNEL_HEADERS=\"$PREFIX/sysroot/usr/include\"!g" < ../config.uClibc > $UCLIBC/.config

export ARCH=xtensa
export CROSS_COMPILE=`pwd`/root/bin/xtensa-$VARIANT-elf-

make -C `pwd`/../$LINUX O=`pwd`/$LINUX defconfig
make -C `pwd`/../$LINUX O=`pwd`/$LINUX INSTALL_HDR_PATH=$PREFIX/sysroot/usr headers_install

make -C `pwd`/../$UCLIBC $PARALLEL O=`pwd`/$UCLIBC
PREFIX=$PREFIX/sysroot make -C `pwd`/../$UCLIBC O=`pwd`/$UCLIBC install
ln -s ld-uClibc.so.0 $PREFIX/sysroot/usr/lib/ld.so.1
ln -s usr/lib $PREFIX/sysroot/lib
