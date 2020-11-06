#!/bin/bash

exec python3 ~/.config/i3/gen_desktop_image.py &
feh --bg-scale ~/.config/i3/desktop.png &
exec gnome-terminal &
