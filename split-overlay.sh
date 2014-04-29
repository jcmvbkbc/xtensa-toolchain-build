#! /bin/bash -ex

CORE="$1"
SRC="$2"
DST="$3"

DIR=`mktemp -d`
trap 'rm -rf "$DIR"' EXIT
tar -xf "$SRC" -C "$DIR"

split_binutils()
{
	A="$DIR"/binutils
	B="$DIR"/res

	mkdir -p "$B"/{bfd,include}
	cp "$A"/xtensa-modules.c "$B"/bfd
	cp "$A"/xtensa-config.h "$B"/include

	tar -czf "$DST"/binutils-xtensa_${CORE}.tgz -C "$B" .
	rm -rf "$B"
}

split_gcc()
{
	A="$DIR"/gcc
	B="$DIR"/res

	mkdir -p "$B"/include
	cp "$A"/xtensa-config.h "$B"/include

	tar -czf "$DST"/gcc-xtensa_${CORE}.tgz -C "$B" .
	rm -rf "$B"
}

split_gdb()
{
	A="$DIR"/gdb
	B="$DIR"/res

	mkdir -p "$B"/{bfd,gdb/{gdbserver,regformats},include}
	cp "$A"/xtensa-modules.c "$B"/bfd
	cp "$A"/xtensa-config.h "$B"/include
	cp "$A"/xtensa-config.c "$B"/gdb
	cp "$A"/xtensa-xtregs.c "$B"/gdb
	cp "$A"/xtensa-xtregs.c "$B"/gdb/gdbserver
	cp "$A"/xtensa-regmap.c "$B"/gdb/gdbserver
	cp "$A"/reg-xtensa.dat "$B"/gdb/regformats

	tar -czf "$DST"/gdb-xtensa_${CORE}.tgz -C "$B" .
	rm -rf "$B"
}

split_linux()
{
	A="$DIR"/config
	B="$DIR"/res

	mkdir -p "$B"/$CORE/include/variant
	cp "$A"/{core.h,tie.h,tie-asm.h} "$B"/$CORE/include/variant

	tar -czf "$DST"/linux-xtensa_${CORE}.tgz -C "$B" .
	rm -rf "$B"
}

combine_buildroot()
{
	rm -rf "$DIR"/{binutils,gcc,gdb}
	mkdir -p "$DIR"/{binutils,gcc,gdb}
	tar -xzf "$DST"/binutils-xtensa_${CORE}.tgz -C "$DIR"/binutils
	tar -xzf "$DST"/gcc-xtensa_${CORE}.tgz -C "$DIR"/gcc
	tar -xzf "$DST"/gdb-xtensa_${CORE}.tgz -C "$DIR"/gdb
	tar -czf "$DST"/xtensa_${CORE}.tar.gz -C "$DIR" {binutils,gcc,gdb}
}

split_binutils "$@"
split_gcc "$@"
split_gdb "$@"
split_linux "$@"
combine_buildroot "$@"
