#!/bin/bash

# Script Name:                  Chrome Initialization
# Author:                       Raphael Chookagian
# Date of latest revision:      05/21/2023
# Purpose:                      Install Google Chrome and set it as default browser on Linux machines.

# Install prerequisites
sudo apt update && sudo apt install -y wget apt-transport-https gnupg

# Download Google Chrome signing key and add it to the keyring
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add Google Chrome repository to the sources list
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Update the package list and install Google Chrome
sudo apt update && sudo apt install -y google-chrome-stable

# Set Google Chrome as default browser
sudo update-alternatives --set x-www-browser /usr/bin/google-chrome-stable
sudo update-alternatives --set gnome-www-browser /usr/bin/google-chrome-stable

# Add Google Chrome to favorites
FAVORITES=$(gsettings get org.gnome.shell favorite-apps)
NEW_FAVORITES=$(echo $FAVORITES | sed "s/]/, 'google-chrome.desktop']/")

gsettings set org.gnome.shell favorite-apps "$NEW_FAVORITES"

echo "Google Chrome has been installed and set as the default browser."


# End
