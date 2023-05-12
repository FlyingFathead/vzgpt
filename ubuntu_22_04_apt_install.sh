#!/bin/bash

printf "

This installer installs the necessary packages for compiling vzgpt on a Ubuntu 22.04LTS system. To cancel, press CTRL-C within 5 secs.

"
sleep 5

# Check if running with root/sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Install required packages
apt-get update
apt-get install -y libsdl1.2-dev lua5.4 lua5.4-dev libsdl-image1.2-dev

echo "Packages installed successfully."


