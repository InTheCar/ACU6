#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color
apps=(
  "test"
  "git"
  "docker"
  "net-tools"
  "iptables"
  "ca-certificates"
  "curl"
  "build-essential"
  "docker-desktop-amd64.deb"
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
            echo "$i ${RED}not installed${NC}"
        else
            echo  "$i installed"
    fi






  echo "perform: sudo apt-get -y install $i"
  eval sudo apt-get -y install $i || echo failed: sudo apt-get -y install $i
done
echo ""
duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""

