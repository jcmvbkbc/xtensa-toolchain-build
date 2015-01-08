#! /bin/bash -ex

. `dirname "$0"`/config

[ -d $BINUTILS ] || { tar -xjf $BINUTILS.tar.bz2 && for file in `dirname "$0"`/patches/binutils/*.patch ; do ( cd $BINUTILS ; patch -p1 ) < $file ; done ; }
[ -d $GCC ] || tar -xjf $GCC.tar.bz2
[ -d $GDB ] || tar -xjf $GDB.tar.bz2
#tar -xzf $NEWLIB.tar.gz
#( cd $BINUTILS ; patch -p1 < ../$BINUTILS.patch )
#( cd $GDB ; patch -p1 < ../$GDB.patch )
#( cd $NEWLIB ; patch -p1 < ../$NEWLIB.patch )
#ln -s ../$NEWLIB/{newlib,libgloss} $GCC

for f in overlays/xtensa_*; do tar -xvf ${f} -C $BINUTILS --strip-components=1 binutils; done
for f in overlays/xtensa_*; do tar -xvf ${f} -C $GCC --strip-components=1 gcc; done
for f in overlays/xtensa_*; do tar -xvf ${f} -C $GDB --strip-components=1 gdb; done
