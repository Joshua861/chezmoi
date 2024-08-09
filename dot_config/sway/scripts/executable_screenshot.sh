#!/bin/bash

entries="Active Screen Output Area Window"

selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')

case $selected in
 active)
    grimshot save active - | wl-copy --type image/png
 screen)
    grimshot save screen - | wl-copy --type image/png
 output)
    grimshot save output - | wl-copy --type image/png
 area)
    grimshot save area - | wl-copy --type image/png
 window)
    grimshot save window - | wl-copy --type image/png
esacpn