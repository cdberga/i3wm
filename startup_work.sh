#!/bin/bash

exec python3 /home/carlosbergamasco/.config/i3/gen_desktop_image.py &
feh --bg-scale /home/carlosbergamasco/.config/i3/desktop.png &
exec gnome-terminal &
exec gedit ~/Documents/infos_loggi &
exec google-chrome https://meet.google.com/kti-brbu-ojb
