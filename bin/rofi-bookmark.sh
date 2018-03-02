#!/usr/bin/bash

bm=~/Dropbox/personal/bookmarks

if [ "$@" ]; then
  firefox $(awk '/'$@'/{print $2}' "$bm")
else
  awk '{print $1}' "$bm"
fi
