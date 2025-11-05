#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color
apps=(
  "make"
  "gparted"
  "exfatprogs"
  "pip"
  "pipx"
  "keepassxc"
  "build-essential"
  "git"
  "net-tools"
  "iptables"
  "ca-certificates"
  "curl"
  "build-essential"
  "software-properties-common"
  "apt-transport-https"
  "docker-ce"
  "docker-ce-cli"
  "containerd.io"
  "docker-buildx-plugin"
  "docker-compose-plugin"

)
SECONDS=0
for i in "${apps[@]}"
do
  echo ""
  sudo dpkg -s $i &> /dev/null
      if [ $? -ne 0 ]
        then
            echo -e "$i ${RED}not installed${NC}"

        else
            echo  "$i installed"
    fi
done
# for Docker GPG key
if [ ! -d "/etc/apt/keyrings" ]; then
  echo "/etc/apt/keyrings does not exist."
  echo "check installation of Docker GPG key"
fi
if [ ! -f /etc/apt/keyrings/docker.asc ]; then
  echo "/etc/apt/keyrings/docker.asc does not exist."
  echo "check installation of Docker GPG key"
fi

if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
  echo "/etc/apt/sources.list.d/docker.list does not exist."
  echo "check installation of Docker Add the repository to Apt sources missing"
fi







echo "-------------------------------------------------"
echo "begin check if docker is woking"
echo "-------------------------------------------------"
sudo docker run hello-world
echo "-------------------------------------------------"
echo "end check if docker is woking"
echo "-------------------------------------------------"



echo ""
duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""

