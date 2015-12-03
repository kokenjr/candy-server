#!/bin/sh

file=
num_files=
choice=
IFS=$'\n'
dir=/home/makebuild/sounds
Files=`find $dir -type f`
 
file=($Files)                # Read into array variable.
 
num_files=${#file[*]}        # Count how many elements.
 
choice=${file[$((RANDOM%num_files))]}
echo $choice
 
mplayer -volume $1 "$choice"
 
exit
