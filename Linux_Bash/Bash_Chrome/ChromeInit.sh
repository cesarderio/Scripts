#!/bin/bash

# Script Name:                  Chrome Initialization
# Author:                       Raphael Chookagian
# Date of latest revision:      05/21/2023
# Purpose:                      Install Google Chrome and set it as default browser on Linux machines.

# Function to check the last command's status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error encountered. Exiting."
        exit 1
    fi
}

# Install prerequisites
sudo apt update && sudo apt install -y wget apt-transport-https gnupg
check_status

# Check if Google Chrome signing key is already added
if ! apt-key list | grep -q "Google, Inc."; then
    # Download Google Chrome signing key and add it to the keyring
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    check_status

    # Add Google Chrome repository to the sources list
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    check_status
else
    echo "Google Chrome repository key already added."
fi

# Update the package list and install Google Chrome
sudo apt update && sudo apt install -y google-chrome-stable
check_status

# Set Google Chrome as default browser
sudo update-alternatives --set x-www-browser /usr/bin/google-chrome-stable
sudo update-alternatives --set gnome-www-browser /usr/bin/google-chrome-stable

# Check if GNOME is installed and add Google Chrome to favorites
if command -v gnome-shell &>/dev/null; then
    FAVORITES=$(gsettings get org.gnome.shell favorite-apps)
    if [[ $FAVORITES != *"google-chrome.desktop"* ]]; then
        NEW_FAVORITES=$(echo $FAVORITES | sed "s/]/, 'google-chrome.desktop']/")
        gsettings set org.gnome.shell favorite-apps "$NEW_FAVORITES"
    else
        echo "Google Chrome already in GNOME favorites."
    fi
else
    echo "GNOME not installed. Skipping the addition of Google Chrome to GNOME favorites."
fi

echo "Google Chrome has been installed and set as the default browser."

# End
