#!/bin/bash

packages=("tcptraceroute" "nethogs")

for packet in "${packages[@]}"; do
    if dpkg -l | grep -q "$packet"; then
        echo "Package $packet already installed"
    else
        sudo apt-get install "$packet" -y
        if dpkg -l | grep -q "$packet"; then
            echo "Package $packet installed successfully"
        fi
    fi
done

if [ -d /usr/bin/believer ]; then
    touch /usr/bin/believer/config.pl
else
    echo "Directory does not exist. Creating..."
    sudo mkdir -p /usr/bin/believer/src
    sudo touch /usr/bin/believer/src/config.pl
fi

if [ -e simpleService.sh ]; then
    sudo chmod +x simpleService.sh
    sudo mv -f simpleService.sh /etc/
else
    sudo touch /etc/simpleService.sh
    sudo chmod +x /etc/simpleService.sh
fi

if [ -e simpleService.service ]; then
    sudo mv -f simpleService.service /etc/systemd/system/simpleService.service
else
    echo "File simpleService.service not found. Exiting..."
    exit 1
fi

