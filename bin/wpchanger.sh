#!/usr/bin/env sh

WALLPAPERS=~/wallpapers
ALIST=( `ls -w1 $WALLPAPERS` )
RANGE=${#ALIST[@]}
let "number = $RANDOM"
let LASTNUM="`cat $WALLPAPERS/.last` + $number"
let "number = $LASTNUM % $RANGE"
echo $number > $WALLPAPERS/.last
nitrogen --set-scaled --save $WALLPAPERS/${ALIST[$number]}
