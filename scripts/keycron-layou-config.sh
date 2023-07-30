#!/bin/sh
# base from https://askubuntu.com/a/1252785

#when using multiple keyboards at once, KDE overrides xorg keyboard configs
#using this script in autostart can set the correct layout for one of the
#keyboards again.

KEYBD_ID="Keychron Keychron K6"
KEYBD_LAYOUT="us"

# Thanks chatGPT (after 3 times)
xinput list |\
    awk '/Keychron Keychron K6.*keyboard/{match($0, /id=([0-9]+)/, id); print id[1]}' |\
    xargs -I{} setxkbmap -layout "$KEYBD_LAYOUT" -device {}
