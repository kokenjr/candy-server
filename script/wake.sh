#!/bin/bash
SCRIPT_PATH="$( dirname "${BASH_SOURCE[0]}" )"
amixer -D pulse set Master 70%

$SCRIPT_PATH/say.sh en "dollar dollar bill y'all" 

exit
