#!/bin/bash

ONLINE=0

# Load keyboard layout
while read -p "loadkeys(uk): " input; do
    if [ "$input" == "" ]; then input=uk; fi
    loadkeys "$input" &> /dev/null
    if [ $? -eq 0 ]; then break; fi
    echo "Not recognised.";
done

# Check for internet connectivity
if : >/dev/tcp/8.8.8.8/53; then
    ONLINE=1
    echo "Internet available."
else
    echo "Internet unavailable."
fi

