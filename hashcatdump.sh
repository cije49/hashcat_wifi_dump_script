#!/bin/bash

#Stop all services that are accessing the WLAN device (e.g .: NetworManager and wpa_supplicant.service)
sudo systemctl stop NetworkManager.service
sudo systemctl stop wpa_supplicant.service

interface="$(ls /sys/class/net | grep wlan)"
echo "Using interface:" $interface

sleep 2

echo "Enter name of capture dumpfile.pcapng"
read dumpfile

sudo hcxdumptool -i $interface -o $dumpfile.pcapng --active_beacon --enable_status=15

#Restart stopped services to reactivate your network connection
sudo systemctl start wpa_supplicant.service
sudo systemctl start NetworkManager.service

hcxpcapngtool -o $dumpfile.hc22000 -E $dumpfile.essidlist.txt $dumpfile.pcapng
