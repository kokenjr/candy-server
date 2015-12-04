#!/bin/bash

file=
num_files=
choice=
IFS=$'\n'
# SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_PATH="$( dirname "${BASH_SOURCE[0]}" )"
dir="$SCRIPT_PATH/../public/sounds/$2"
Files=`find $dir -type f`

file=($Files)                # Read into array variable.

num_files=${#file[*]}        # Count how many elements.

choice=${file[$((RANDOM%num_files))]}
echo $choice

mplayer -volume $1 "$choice"

exit
