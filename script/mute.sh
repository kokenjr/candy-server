#!/bin/bash
SCRIPT_PATH="$( dirname "${BASH_SOURCE[0]}" )"
$SCRIPT_PATH/say.sh en "bye, daddy"

amixer -D pulse set Master 0%

exit
