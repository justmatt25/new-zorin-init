#!/bin/sh
#update everything
apt install git

apt -y update

apt -y upgrade 

#install freerdp2
add-apt-repository ppa:remmina-ppa-team/freerdp-daily
apt-get -y update
apt-get -y install freerdp2-x11

#install freerdp-gui
apt -y install python-qt4 python-configparser python-urllib3 

cd /home/user/Downloads
git clone https://github.com/justmatt25/RDPGUI.git

cd RDPGUI

echo "[DEFAULT]
RDPBinary = xfreerdp 
RDPOptions = ~/Downloads/cpub-StandardUser-StandardUser-CmsRdsh.rdp
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
echo "[Desktop Entry]
Version=2.0
Name=RDP GUI
Comment=Use this to run the RDP gui
Exec=python /home/user/Downloads/RDPGUI/rdpgui.py
Icon=/home/user/Downloads/RDPGUI/selectuser.png
Terminal=false
Type=Application
Categories=Utility;Application;" > ./login.desktop 

chmod 755 ./login.desktop
chmod +x ./login.desktop

#add extra drivers
cd /lib/firmware/i915
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/bxt_guc_ver8_7.bin

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/kbl_guc_ver9_14.bin

apt -y update

apt -y upgrade




