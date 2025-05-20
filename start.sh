

7z x "/home/arcade/Update/attractplus.7z" -o"/home/arcade/Update"
sleep 2
rm "/home/arcade/Update/attractplus.7z"
sleep 2
sudo cp "/home/arcade/Update/attractplus" "/usr/local/bin"
sleep 2
sudo chmod 777 "/usr/local/bin/attractplus"

 
7z x "/home/arcade/Update/attractplus-kms.7z" -o"/home/arcade/Update"
sleep 2
rm "/home/arcade/Update/attractplus-kms.7z"
sleep 2
sudo cp "/home/arcade/Update/attractplus-kms" "/usr/local/bin"
sleep 2
sudo chmod 777 "/usr/local/bin/attractplus-kms" 
 
 
7z x "/home/arcade/Update/attractplus-x11.7z" -o"/home/arcade/Update"
sleep 2
rm "/home/arcade/Update/attractplus-x11.7z"
sleep 2
sudo cp "/home/arcade/Update/attractplus-x11" "/usr/local/bin"
sleep 2
sudo chmod 777 "/usr/local/bin/attractplus-x11" 
 
 
sudo cp "/home/arcade/Update//qr-code" "/usr/local/bin"
sleep 2
sudo chmod 777 /usr/local/bin/qr-code


sudo cp "/home/arcade/Update/cobranca" "/home/arcade/shared/frontends/attract"
sleep 2
sudo chmod 777  /home/arcade/shared/frontends/attract/cobranca


sudo cp "/home/arcade/Update/teclado" "/usr/local/bin"
sleep 2
sudo chmod 777 /usr/local/bin/teclado 




sudo cp -r "/home/arcade/Update/splash.png" /usr/share/plymouth/themes/groovy
sudo plymouth-set-default-theme -R groovy



sudo rm -R /home/arcade/Update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
#sudo chmod -R 777 /home/arcade/shared/frontends/attract
dialog --infobox "Reiniciando..." 10 20 
sleep 10 
clear
reboot
 
