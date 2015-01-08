#! /bin/bash -ex
#
# Fix xtensa registers definitions so that gdb can work with QEMU
#

. `dirname "$0"`/config

SED=sed

test $(echo $(uname) | tr 'A-Z' 'a-z') == "darwin" && SED=gsed

$SED -i $GDB/gdb/xtensa-config.c -e 's/\(XTREG([^,]\+,[^,]\+,[^,]\+,[^,]\+,[^,]\+,[^,]\+,[^,]\+\)/\1 \& ~1/'
