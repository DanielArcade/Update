

7z x "/home/arcade/Update/attractplus.7z" -o"/home/arcade/Update"
rm "/home/arcade/Update/attractplus.7z"
sudo cp "/home/arcade/Update/attractplus" "/usr/local/bin"
sudo chmod 777 "/usr/local/bin/attractplus"

 
sudo cp -r "/home/arcade/Update/qr-code" "/usr/local/bin"

sleep 2
sudo chmod 777 /usr/bin/qr-code


sudo cp -r "/home/arcade/Update/cobranca" "/home/arcade/shared/frontends/attract"
sleep 2
sudo chmod -R 777 /home/arcade/shared/frontends/attract/cobranca


sudo cp -r "/home/arcade/Update/teclado" "/usr/local/bin"

sleep 2
sudo chmod 777 /usr/bin/teclado 


sudo rm -R /home/arcade/Update
sudo rm -R /home/arcade/.local/share/Trash
#sudo pacman -Sy --noconfirm
#sudo chmod -R 777 /home/arcade/shared/frontends/attract
dialog --infobox "Reiniciando..." 10 20 
sleep 10 
clear
reboot
 
