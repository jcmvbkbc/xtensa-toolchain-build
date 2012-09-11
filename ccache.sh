#! /bin/bash

CC=`dirname "$0"`/../bin
export PATH=$CC:$PATH
exec -a "$0" ccache "$@"
