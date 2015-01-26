#! /bin/bash -x

cd root/bin
mkdir -p ../ccache
find ./ -type f | xargs -I{} ln -sf ../../../ccache.sh ../ccache/{}
