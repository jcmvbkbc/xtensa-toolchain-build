#! /bin/bash -ex

. `dirname "$0"`/config

[ -d $BINUTILS ] || \
	{ tar -xjf $BINUTILS.tar.bz2 && \
		{ ! [ -d `dirname "$0"`/patches/$BINUTILS ] || cat `dirname "$0"`/patches/$BINUTILS/*.patch | ( cd $BINUTILS ; patch -p1 ) } }
[ -d $GCC ] || tar -xjf $GCC.tar.bz2
[ -d $GDB ] || tar -xjf $GDB.tar.bz2
#tar -xzf $NEWLIB.tar.gz
#( cd $BINUTILS ; patch -p1 < ../$BINUTILS.patch )
#( cd $GDB ; patch -p1 < ../$GDB.patch )
#( cd $NEWLIB ; patch -p1 < ../$NEWLIB.patch )
#ln -s ../$NEWLIB/{newlib,libgloss} $GCC

tar -xf overlays/xtensa_$1.* -C $BINUTILS --strip-components=1 binutils
tar -xf overlays/xtensa_$1.* -C $GCC --strip-components=1 gcc
tar -xf overlays/xtensa_$1.* -C $GDB --strip-components=1 gdb
