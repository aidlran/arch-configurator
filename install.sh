#!/bin/bash

# Load keyboard layout
while read -p "loadkeys(uk): " input; do
    if [ "$input" == "" ]; then input=uk; fi
    loadkeys "$input" &> /dev/null
    if [ "$?" == "0" ]; then break; fi
    echo "Not recognised.";
done

