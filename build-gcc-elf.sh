#! /bin/bash -ex

VARIANT=$1 SUFFIX=elf `dirname "$0"`/build-gcc.sh --with-newlib
