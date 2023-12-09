#!/bin/sh
# DOC: https://heaps.io/documentation/resource-management.html

echo Build res.pak.
haxe -hl hxd.fmt.pak.Build.hl -lib heaps -main hxd.fmt.pak.Build
hl hxd.fmt.pak.Build.hl

if [ "$?" = "0" ]; then
    echo Resource res.pak is built. You can run 'haxe compile.hxml'.
fi 
