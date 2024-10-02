# Simple Service Setup

This script is designed to automate the installation and configuration of a virtual machine. The script installs necessary packages, creates required directories and files, and sets up the `simpleService` service to run automatically on system boot.

## Prerequisites

- **Operating System**: Ubuntu or Debian-based distribution
- **User Privileges**: You must have `sudo` privileges to execute the setup script.

## What the Script Does

The script performs the following actions:
1. Installs two packages: `tcptraceroute` and `nethogs`.
2. Creates the `/usr/bin/believer/src` directory if it does not exist, with an empty file called `config.pl` inside this directory.
3. Moves the `simpleService.sh` script to the `/etc/` directory and ensures it's executable.
4. Installs the `simpleService.service` systemd unit file to `/etc/systemd/system/`.
5. Enables and starts the `simpleService` service to ensure it runs on boot and restarts on failure.

## How to Run the Script

1. Place the `configure_system.sh`, `simpleService.sh`, and `simpleService.service` files in the same folder.
2. Make the `configure_system.sh` script executable:
   ```bash chmod +x configure_system.sh```
3. Run the script:
   ```sudo <path to the file>/configure_system.sh```

