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

sudo touch /usr/bin/believer/src/config.pl

if [ -e simpleService.sh ]; then
    sudo chmod +x simpleService.sh
    sudo mv -f simpleService.sh /etc/
else
    sudo touch /etc/simpleService.sh
    sudo chmod +x /etc/simpleService.sh
fi

if [ -e simpleService.service ]; then
    sudo mv -f simpleService.service /etc/systemd/system/simpleService.service
    
    sudo systemctl enable simpleService.service
    if sudo systemctl is-enabled simpleService.service &> /dev/null; then
        echo "simpleService.service is enabled successfully."
    else
        echo "Failed to enable simpleService.service."
        exit 1
    fi

    sudo systemctl start simpleService.service
    if sudo systemctl is-active simpleService.service &>/dev/null; then
        echo -e "simpleService.service is running successfully.\nTo check its status, run:\n"
        echo "sudo systemctl status simpleService.service"
    else
        echo "Failed to start simpleService.service."
        exit 1
    fi	    
else
    echo "File simpleService.service not found. Exiting..."
    exit 1
fi

