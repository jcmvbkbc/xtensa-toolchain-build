#! /bin/bash -ex

. `dirname "$0"`/config

[ -d $BINUTILS ] || \
	{ tar -xf $BINUTILS.tar.* && \
		{ ! [ -d `dirname "$0"`/patches/$BINUTILS ] || cat `dirname "$0"`/patches/$BINUTILS/*.patch | ( cd $BINUTILS ; patch -p1 ) } }
[ -d $GCC ] || \
	{ tar -xf $GCC.tar.* && \
		{ ! [ -d `dirname "$0"`/patches/$GCC ] || cat `dirname "$0"`/patches/$GCC/*.patch | ( cd $GCC ; patch -p1 ) } }
[ -d $GDB ] || \
	{ tar -xf $GDB.tar.* && \
		{ ! [ -d `dirname "$0"`/patches/$GDB ] || cat `dirname "$0"`/patches/$GDB/*.patch | ( cd $GDB ; patch -p1 ) } }

#tar -xzf $NEWLIB.tar.gz
#( cd $BINUTILS ; patch -p1 < ../$BINUTILS.patch )
#( cd $GDB ; patch -p1 < ../$GDB.patch )
#( cd $NEWLIB ; patch -p1 < ../$NEWLIB.patch )
#ln -s ../$NEWLIB/{newlib,libgloss} $GCC

for f in overlays/xtensa_*; do tar -xvf ${f} -C $BINUTILS --strip-components=1 binutils; done
for f in overlays/xtensa_*; do tar -xvf ${f} -C $GCC --strip-components=1 gcc; done
for f in overlays/xtensa_*; do tar -xvf ${f} -C $GDB --strip-components=1 gdb; done
