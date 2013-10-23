#! /bin/bash -ex

VARIANT=$1 SUFFIX=elf `dirname "$0"`/build-binutils.sh
