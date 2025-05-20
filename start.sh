 
#  sudo cp -R /home/arcade/Update/.retroarch /home/arcade/.config
# sudo cp -R /home/arcade/pdate/.mame /home/arcade
# sudo cp -R /home/arcade/Update/attract /home/arcade/shared/frontends
# sudo chmod -R 777 /tmp
# sudo chmod -R 777 /home/arcade/.config
# sudo chmod -R 777 /home/arcade/shared/frontends
# sudo cp -r "/home/arcade/Update/config.ini" "/home/arcade/.skyscraper"
#sudo cp -r "/home/arcade/Update/pacman.conf" "/etc/pacman.conf"
#sudo rm -r /var/lib/pacman/db.lck
#sudo pacman -Sy --noconfirm
#sudo pacman -S libzip --noconfirm

#dialog --infobox "instalando Flycast..." 10 20 

#sleep 2

#sudo pacman -S fbneo --noconfirm

#dialog --infobox "instalando Fbneo..." 10 20
#sleep 2

#sudo cp -r "/home/arcade/Update/flycast" "/usr/local/bin"
#sleep 2
#sudo cp -r "/home/arcade/Update/flycast.png" "/usr/share/pixmaps"
#sleep 2
#sudo cp -r "/home/arcade/Update/flycast.desktop" "/usr/share/applications"
#sleep 2
#sudo chmod -R 777 /usr/local/bin/flycast
7z x "/home/arcade/Update/attractplus.7z" -o"/home/arcade/Update"
rm "/home/arcade/Update/attractplus.7z"
sudo cp "/home/arcade/Update/attractplus" "/usr/local/bin"
sudo chmod 777 "/usr/local/bin/attractplus"

 
sudo cp -r "/home/arcade/Update/qr-code" "/usr/local/bin"
#sudo mv -f "/home/arcade/Update/interactive" "/opt/gasetup/core/procedures"
sleep 2
sudo chmod 777 /usr/bin/qr-code
# sudo mkdir /home/arcade/shared/frontends/attract/bkp
# sudo mkdir /home/arcade/shared/frontends/attract/bkp/attract



sudo cp -r "/home/arcade/Update/cobranca" "/home/arcade/shared/frontends/attract"
sleep 2
sudo chmod -R 777 /home/arcade/shared/frontends/attract/cobranca


sudo cp -r "/home/arcade/Update/teclado" "/usr/local/bin"
#sudo mv -f "/home/arcade/Update/interactive" "/opt/gasetup/core/procedures"
sleep 2
sudo chmod 777 /usr/bin/teclado 


#sudo cp -r "/home/arcade/Update/attract/startfe.sh" "/opt/galauncher"
#sudo cp -r "/home/arcade/Update/attract/attract" "/usr/bin"
#sudo cp -r "/home/arcade/Update/attractplus" "/usr/local/bin"
#sudo cp -r "/home/arcade/Update/attract/attract" "/usr/share"
#sudo chmod -R 777 /usr/local/bin/attractplus
 
 




#sudo cp -r "/home/arcade/Update/splash.png" /usr/share/plymouth/themes/groovy
#sudo plymouth-set-default-theme -R groovy
 
sudo rm -R /home/arcade/Update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
#sudo chmod -R 777 /home/arcade/shared/frontends/attract
dialog --infobox "Reiniciando..." 10 20 
sleep 10 
clear
reboot
 
