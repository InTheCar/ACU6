#!/bin/bash
InstallFailed () {
  ## will be called if an installation failed
  echo ""
  echo "failed to install"
  echo "$1"
  echo "please fix it"
  exit

}

# Prompt for remote desktop password
echo -n "Enter your remote desktop password which you want to use: "
read -s PASSWORD
echo ""

command=(
  "sudo snap refresh"
  "sudo apt-get update"
  "sudo apt-get -y upgrade"
)
SECONDS=0

for i in "${command[@]}"
do
  echo ""
  echo "perform: $i"
  eval $i || echo failed: $i
  #eval "$1"
done
echo ""
duration=$SECONDS
echo "time for updates needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""

#  "dconf-cli"
apps=(
  "gnome-session"
  "xrdp"
  "openssh-server"
)

SECONDS=0
for i in "${apps[@]}"
do
  echo ""
  echo "perform: sudo apt-get -y install $i"
  eval sudo apt-get -y install $i || InstallFailed "$i"
done
# add xrdp to ssl-cert group
sudo adduser $USER ssl-cert
echo "gnome-session"|tee ~/.xsession
#echo "xfce4-session"|tee ~/.xsession
sudo systemctl restart xrdp

#dconf write /org/gnome/desktop/remote-access/enabled true
#dconf write /org/gnome/desktop/remote-access/disable-keyboard-shortcuts false
#sudo ufw allow 5900/tcp
sudo ufw allow ssh
sudo ufw allow 3389
sudo ufw enable


duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""
