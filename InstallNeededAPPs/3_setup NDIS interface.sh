#!/bin/bash
searchfor=enx001122334455
gotit=$(eval ip address|grep -o "$searchfor"|wc -l)
# gotit="(($gotit))"
while [ ! $gotit -eq 1 ]
do
    echo "Connect USB from Seer USB CDP to this device"
    echo "Power off the TCU, wait and power TCU on"
    echo "waiting for 2 seconds ...."
    echo  ""
    sleep 1
    # founds=eval ip address|grep -o "$searchfor"|wc -l
    gotit=$(eval ip address|grep -o "$searchfor"|wc -l)
    echo $gotit
done
sudo ip address add 198.18.1.2/24 dev enx001122334455
sudo ip link set enx001122334455 up



