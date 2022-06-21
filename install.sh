#!/bin/bash

# Load keyboard layout
while read -p "loadkeys (uk): " input; do
    if [ "$input" == "" ]; then input=uk; fi
    loadkeys "$input" &> /dev/null
    if [ $? -eq 0 ]; then break; fi
    echo "Not recognised."
done

# Check for internet connectivity
echo -e "GET http://archlinux.org HTTP/1.0\n\n" | nc archlinux.org 80 &> /dev/null
if [ $? -eq 0 ]; then
    echo "Internet available."
else
    echo "Internet unavailable. Entering network setup."
    while read -p "Set up which network type? [lan|wifi]: " input; do
        if [ "$input" == "lan" ]; then default_interface=eth0
        elif [ "$input" == "wifi" ]; then default_interface=wlan0
        else echo "Unrecognised input."; continue; fi
        while ip link && read -p "Choose an interface ($default_interface): " interface; do
            if [ "$interface" == "" ]; then interface=$default_interface; fi
            ip link set "$interface" up
            if [ $? -ne 0 ]; then continue
            elif [ "$input" == "wifi" ]; then
                once=0
                while [ $once -eq 0 ]; do
                    iwctl station "$interface" scan
                    if [ $? -ne 0 ]; then break; fi
                    iwctl station "$interface" get-networks
                    read -p "Choose a network SSID: " ssid
                    iwctl station "$interface" connect "$ssid"
                    if [ $? -eq 0 ]; then once=1; break; fi
                done
                if [ $once -eq 1 ]; then break; fi
            else break; fi
        done
        break
    done
fi

