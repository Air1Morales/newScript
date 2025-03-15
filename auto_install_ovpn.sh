#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function for logging messages
log() {
    echo "[INFO] $1"
}

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
   echo "[ERROR] This script must be run as root" 
   exit 1
fi

# Update package lists
log "Updating package lists..."
apt-get update -y

# Install necessary dependencies (if required)
log "Installing wget and curl if they're not already installed..."
apt-get install wget curl -y

# Download the installer script
log "Downloading the installer script from GitHub..."
wget -O installer.sh "https://raw.githubusercontent.com/Air1Morales/ovpnScript/refs/heads/main/installer.sh"

# Make the script executable
log "Making the installer script executable..."
chmod +x installer.sh

# Execute the installer script
log "Executing the installer script..."
./installer.sh

# Cleanup
log "Cleaning up..."
rm installer.sh

log "Installation completed successfully."
