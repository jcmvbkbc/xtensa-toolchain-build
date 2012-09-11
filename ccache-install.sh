#! /bin/bash -x

cd root/bin
mkdir -p ../ccache
find -type f | xargs -i{} ln -sf ../../../ccache.sh ../ccache/{}
