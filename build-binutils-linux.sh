#! /bin/bash -ex

. `dirname "$0"`/config

VARIANT=$1 SUFFIX=linux `dirname "$0"`/build-binutils.sh --with-sysroot=$PREFIX/sysroot
