#!/bin/bash
#mv startup_work.sh startup_w1.sh &&
#i3-msg restart &&
#>startup_work.sh &&
#rm -rf startup_work.sh &&
#mv startup_w1.sh startup_work.sh
cp config_$I3_ENV config &
python3 /home/carlosbergamasco/.config/i3/gen_desktop_image.py &
feh --bg-scale /home/carlosbergamasco/.config/i3/desktop.png
