#!/bin/bash
searchfor=wlan0:
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


