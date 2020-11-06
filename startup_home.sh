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
#exec xed ~/.config/i3/config &
#exec xed ~/leitura &
#exec xed ~/Documents/study_viaVarejo &
#exec google-chrome-stable & 
#exec xreader "/home/tiwork/Documents/books/O Universo Autoconsciente - Amit Goswami.pdf" &
#exec google-chrome-stable & 
#exec brave-browser &
exec python3 ~/.config/i3/gen_desktop_image.py &
feh --bg-scale ~/.config/i3/desktop.png &
exec xed ~/.config/i3/startup.sh &
exec xed ~/Documents/Atividades_rotina_diaria.txt &
exec xed ~/wkpy/python_samples/exemplos/acm_icpc_team.py &
exec xed ~/Documents/study &

