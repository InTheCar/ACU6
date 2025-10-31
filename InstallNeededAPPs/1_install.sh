#!/bin/bash
InstallFailed () {
  echo ""
  echo "failed to install"
  echo "$1"
  echo "please fix it"
  exit

}
command=(
  "sudo snap refresh"
  "sudo apt-get update"
  "sudo apt-get -y upgrade"
)
SECONDS=0
echo copy files to etc
sudo cp
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


apps=(
  "make"
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
  echo "perform: sudo apt-get -y install $i"
  eval sudo apt-get -y install $i || InstallFailed "$i"
done
echo ""
duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""
