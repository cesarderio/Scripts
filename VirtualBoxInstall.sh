#!/bin/bash

# Script Name:                  GitHub
# Author:                       Raphael Chookagian
# Date of latest revision:      07/12/2023
# Purpose:                      Script installs Virtualbox and settings to place it in the dock/desktop

# Main

sudo apt update

# Function to install VirtualBox and add it to favorites
install_virtualbox() {
    sudo apt install virtualbox -y

    # Download and install the VirtualBox extension pack
    # Download Extenstion Pack for VirtualBox:
    wget https://download.virtualbox.org/virtualbox/6.1.38/Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack
    # Install Extenstion Pack for VirtualBox:
    VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack

    # add to favorites
    add_to_favorites "virtualbox.desktop"
}

# Function to add an application to favorites in GNOME Shell
add_to_favorites() {
    local desktop_file=$1
    gsettings set org.gnome.shell favorite-apps \
        "$(gsettings get org.gnome.shell favorite-apps | sed 's/.$//'), '$desktop_file']"
}

install_virtualbox

# End
