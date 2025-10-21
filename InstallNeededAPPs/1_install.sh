#!/bin/bash
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


apps=(
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
  echo "perform: sudo apt-get -y install $i"
  eval sudo apt-get -y install $i || echo failed: sudo apt-get -y install $i
done
echo ""
duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""
