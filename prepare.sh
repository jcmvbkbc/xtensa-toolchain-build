#! /bin/bash

set -xe

BINUTILS=binutils-2.20.1
GCC=gcc-4.4.5
GDB=gdb-7.2
NEWLIB=newlib-1.18.0

tar -xjf $BINUTILS.tar.bz2
tar -xjf $GCC.tar.bz2
tar -xjf $GDB.tar.bz2
tar -xzf $NEWLIB.tar.gz
( cd $BINUTILS ; patch -p1 < ../$BINUTILS.patch )
( cd $GDB ; patch -p1 < ../$GDB.patch )
#( cd $NEWLIB ; patch -p1 < ../$NEWLIB.patch )
ln -s ../$NEWLIB/{newlib,libgloss} $GCC
