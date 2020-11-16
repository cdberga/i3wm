#!/bin/bash
cp config_$I3_ENV config &
python3 /home/carlosbergamasco/.config/i3/gen_desktop_image.py &
feh --bg-scale /home/carlosbergamasco/.config/i3/desktop.png
