#!/bin/bash
# mount data HD
#
# /etc/init.d/my_init.sh

# mount data HD
# id needed put this command above to create folder first
# mkdir /media/carlos/hd
#mount /dev/sda6 /media/carlos/hd/

######################################

#exec ij &
#exec xreader "/home/carlos/Documentos/pessoal/learn/books/Domain Driven Design Quickly.pdf" &
exec python3 ~/.config/i3/gen_desktop_image.py &
feh --bg-scale ~/.config/i3/desktop.png &
exec google-chrome-stable & 
exec brave-browser &
exec xed ~/.config/i3/startup.sh &
exec xed ~/.config/i3/config &
exec xed ~/leitura &
exec xed ~/Documents/study_viaVarejo &
exec xed ~/Documents/study &
exec xfce4-terminal &
exec xed ~/.xsession &

