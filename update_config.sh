#!/bin/bash
#mv startup_work.sh startup_w1.sh &&
#i3-msg restart &&
#>startup_work.sh &&
#rm -rf startup_work.sh &&
#mv startup_w1.sh startup_work.sh
cp config_$I3_ENV $I3_FOLDER/config &
python3 $I3_FOLDER/gen_desktop_image.py &
feh --bg-scale $I3_FOLDER/desktop.png
