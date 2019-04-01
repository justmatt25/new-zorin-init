#!/bin/sh
#update everything
apt install git

apt update

apt upgrade

#install freerdp2
wget http://pub.freerdp.com/releases/freerdp-2.0.0-rc4.tar.gz
tar -xzf freerdp-2.0.0-rc4.tar.gz
cd freerdp-2.0.0-rc4
./configure
make 
make install

#install freerdp-gui
apt install python-qt4 python-configparser python-urllib3 

cd /home/user/Downloads
git clone https://github.com/justmatt25/RDPGUI.git

echo "[DEFAULT]
RDPBinary = /usr/local/bin/xfreerdp 
RDPOptions = ~/Downloads/cpub-Personal_VM-Personal_VM-MyDesktop.rdp
RDPDomain = stbi
RDPServer = RDSBROKER-VM.STBI.LOCAL
RDPDomainFlags = /d:
RDPServerFlags = /v:
RDPUserFlags = /u:
RDPPasswordFlags = /p:
RDPDefaulfFlags = /cert-ignore
RDPExtraFlags = /sound:sys:pulse /gfx /fonts +compression +auto-reconnect" > ./rdpgui.ini 

#add shortcut

cd /home/user/Desktop
echo " [Desktop Entry]
Version=2.0
Name=RDP GUI
Comment=Use this to run the RDP gui
Exec=python /home/user/Downloads/RDPGUI-master/rdpgui.py
Icon=/home/user/Downloads/RDPGUI-master/selectuser.png
Terminal=false
Type=Application
Categories=Utility;Application;" > ./login.desktop 

chmod 755 ./login.desktop
chmod +x ./login.desktop

#add extra drivers
cd /lib/firmware/i915
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/bxt_guc_ver8_7.bin

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/kbl_guc_ver9_14.bin

apt update

apt upgrade




