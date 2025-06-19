7z x "/home/arcade/Update/attractplus.7z" -o"/home/arcade/Update"
sleep 1
rm "/home/arcade/Update/attractplus.7z"
sudo cp "/home/arcade/Update/attractplus" "/usr/local/bin"
sudo chmod 777 "/usr/local/bin/attractplus"

7z x "/home/arcade/Update/attractplus-kms.7z" -o"/home/arcade/Update"
sleep 1
rm "/home/arcade/Update/attractplus-kms.7z"
sudo cp "/home/arcade/Update/attractplus-kms" "/usr/local/bin"
sudo chmod 777 "/usr/local/bin/attractplus-kms"

7z x "/home/arcade/Update/attractplus-x11.7z" -o"/home/arcade/Update"
sleep 1
rm "/home/arcade/Update/attractplus-x11.7z"
sudo cp "/home/arcade/Update/attractplus-x11" "/usr/local/bin"
sudo chmod 777 "/usr/local/bin/attractplus-x11"

sudo cp "/home/arcade/Update/qr-code" "/usr/local/bin"
sudo chmod 777 /usr/local/bin/qr-code

#sudo cp "/home/arcade/Update/cobranca" "/home/arcade/shared/frontends/attract"
#sudo chmod 777  /home/arcade/shared/frontends/attract/cobranca

sudo cp "/home/arcade/Update/interactive" "/opt/gasetup/core/procedures"

sudo cp "/home/arcade/Update/alerta.wav" "/home/arcade/.attract/sounds"

sudo cp "/home/arcade/Update/configure.ini" "/home/arcade/.attract"

sudo cp "/home/arcade/Update/posikey" "/home/arcade"
sudo chmod 777 /home/arcade/posikey

sudo cp "/home/arcade/Update/teclado" "/usr/local/bin"
sudo chmod 777 /usr/local/bin/teclado

sudo cp -r "/home/arcade/Update/groovy.script" /usr/share/plymouth/themes/groovy
sudo cp -r "/home/arcade/Update/splash.png" /usr/share/plymouth/themes/groovy

sudo plymouth-set-default-theme -R groovy

sudo rm -R /home/arcade/Update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
#sudo chmod -R 777 /home/arcade/shared/frontends/attract

dialog --infobox "Reiniciando..." 10 20
sleep 5
clear
reboot
