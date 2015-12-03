#!/bin/bash

# limit to 100 character or less
# language code: http://developers.google.com/translate/v2/using_rest#language-params
# useage: say <language code> <phase>
# example: say es come with me

SCRIPT_PATH="$( dirname "${BASH_SOURCE[0]}" )"

#mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?ie=UTF-8&tl="$1"&q=$(echo "$@" | cut -d ' ' -f2- | sed 's/ /\+/g')" > /dev/null 2>&1

#curl "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$(echo "$@" | sed 's/ /+/g')&client=t" -H 'Referer: http://translate.google.com/' -H 'User-Agent: stagefright/1.2 (Linux;Android 5.0)' | play -t mp3 -
$SCRIPT_PATH/simple-google-tts/simple_google_tts en "$1"
exit
