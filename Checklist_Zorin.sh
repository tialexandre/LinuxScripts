#!/bin/bash
set echo off
clear
echo "------------------------"
echo  "atualizando o sistema"
echo "------------------------"
apt-get update -y
clear
apt-get upgrade -y

clear
echo "-----------------------------"
echo  "Instalando Programas Basicos"
echo "-----------------------------"
sudo apt install snapd git vim net-tools htop iftop iotop nload nmon nethogs ntfs-3g  sshfs parted inetutils-tools -y
clear
echo "-----------------------------"
echo  "Instalando Navegadores"
echo "-----------------------------"
nome="google-chrome"
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
     echo "Pacote $nome ja instalado"
else echo
     echo "Pacote $nome Necessario-> Nao instalado"
     echo "Instalando Automaticamente Pacote Dialog..."
     cd /tmp
     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
     sudo apt install ./google-chrome-stable_current_amd64.deb
fi
sleep 2

clear
echo "------------------------"
echo " Instalando anydesk"
echo "------------------------"
nome="anydesk"
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
     echo "Pacote $nome ja instalado"
else echo
     echo "Pacote $nome Necessario-> Nao instalado"
     echo "Instalando Automaticamente Pacote Dialog..."
     wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
     echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
     sudo apt update
     sudo apt install anydesk -y
fi
sleep 2


clear
echo "------------------------"
echo "instalando remmina"
echo "------------------------"
nome="remmina"
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
     echo "Pacote $nome ja instalado"
else echo
     echo "Pacote $nome Necessario-> Nao instalado"
     echo "Instalando Automaticamente Pacote Dialog..."
     sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
     sudo apt update
     sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y
fi
sleep 2

clear
echo "------------------------"
echo " instalando Flameshot"
echo "------------------------"
nome="flameshot"
pacote=$(dpkg --get-selections | grep "$nome" ) 
if [ -n "$pacote" ] ;
then echo
     echo "Pacote $nome ja instalado"
else echo
     echo "Pacote $nome Necessario-> Nao instalado"
     echo "Instalando Automaticamente Pacote Dialog..."
     wget https://github.com/flameshot-org/flameshot/releases/download/v0.10.2/flameshot-0.10.2-1.debian-10.amd64.deb -O flameshot.deb
     sudo dpkg -i flameshot.deb
     sudo apt autoremove -y
     sudo apt-get install -f
fi
sleep 2

echo"-------JAVA---------"
sudo apt-get install icedtea-netx -y
sudo apt install openjdk-8-jre -y


echo "------------------------"
echo " Instala adobe reader"
echo "------------------------"
sudo snap install acrordrdc


sudo apt autoremove -y
sudo apt-get install -f

#Instalar OCS
sudo apt-get update -y
sudo apt-get install dmidecode libxml-simple-perl libcompress-zlib-perl libnet-ip-perl libwww-perl libdigest-md5-perl libnet-ssleay-perl -y
sudo apt install ocsinventory-agent -y


sudo echo "server = mr.ocs.timr.com.br" > /etc/ocsinventory/ocsinventory-agent.cfg

sudo echo "# local = /var/lib/ocsinventory-agent" >> /etc/ocsinventory/ocsinventory-agent.cfg

sudo echo " # Administrative TAG (optional, must be filed before first inventory)" >> /etc/ocsinventory/ocsinventory-agent.cfg
sudo echo "tag=SKELT" >> /etc/ocsinventory/ocsinventory-agent.cfg

sudo echo "# How to log, can be File,Stderr,Syslog" >> /etc/ocsinventory/ocsinventory-agent.cfg
sudo echo "logger = Stderr" >> /etc/ocsinventory/ocsinventory-agent.cfg
sudo echo "ddlogfile = /var/log/ocsinventory-agent/ocsinventory-agent.log" >> /etc/ocsinventory/ocsinventory-agent.cfg
sudo chmod 777 /etc/ocsinventory/ocsinventory-agent.cfg
sudo chmod 777 -R /var/lib/ocsinventory-agent/


ocsinventory-agent