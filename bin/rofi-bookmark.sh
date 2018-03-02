#!/usr/bin/bash

bm=~/Dropbox/personal/bookmarks.json

if [ "$1" ]; then
  firefox $( jq -r ".[\"$1\"]" $bm )
else
  jq -r "keys|.[]" $bm
fi
