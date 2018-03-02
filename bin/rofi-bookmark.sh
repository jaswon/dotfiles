#!/usr/bin/bash

bm=~/Dropbox/personal/bookmarks

if [ "$1" ]; then
  firefox $( awk -v sel="$1" 'sel == $1 {print $2}' "$bm" )
else
  awk '{print $1}' "$bm"
fi
