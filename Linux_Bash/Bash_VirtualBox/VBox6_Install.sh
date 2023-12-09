#!/bin/bash

# Script Name:                  VBox_Install -v6
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      Script installs VirtualBox and settings to place it in the dock/desktop

# Function to check the last command's status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error encountered. Exiting."
        exit 1
    fi
}

# Function to install VirtualBox and add it to favorites
install_virtualbox() {
    sudo apt install virtualbox -y
    check_status

    # Download the VirtualBox extension pack
    wget https://download.virtualbox.org/virtualbox/6.1.38/Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack
    check_status

    # Install the VirtualBox extension pack
    VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack
    check_status

    # Cleanup - remove the downloaded extension pack
    rm Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack

    # Add VirtualBox to favorites
    add_to_favorites "virtualbox.desktop"
}

# Function to add an application to favorites in GNOME Shell
add_to_favorites() {
    local desktop_file=$1
    gsettings set org.gnome.shell favorite-apps \
        "$(gsettings get org.gnome.shell favorite-apps | sed 's/.$//'), '$desktop_file']"
}

# Main
sudo apt update
check_status

install_virtualbox

# End
