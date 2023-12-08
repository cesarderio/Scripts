#!/bin/bash

# Script Name:                  VBox_Install
# Author:                       Raphael Chookagian
# Date of latest revision:      12/07/2023
# Purpose:                      Script installs VirtualBox and settings to place it in the dock/desktop

# Function to check the last command's status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error encountered. Exiting."
        exit 1
    fi
}

# Function to remove existing VirtualBox installations
remove_existing_virtualbox() {
    echo "Checking for existing VirtualBox installations..."

    # Check if VirtualBox is installed and remove it
    if dpkg -l | grep -i virtualbox; then
        echo "Removing existing VirtualBox installations..."
        sudo apt-get remove --purge -y "^virtualbox.*"
        check_status
        echo "Existing VirtualBox installations removed."
    else
        echo "No existing VirtualBox installations found."
    fi
}





# Function to install VirtualBox 7 and add it to favorites
install_virtualbox() {
    # Download VirtualBox 7.0.12 Debian package
    wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb
    check_status

    # Install the downloaded package
    sudo dpkg -i virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb
    check_status

    # Download the VirtualBox 7 extension pack
    wget https://download.virtualbox.org/virtualbox/7.0.12/Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack
    check_status

    # Install the VirtualBox 7 extension pack
    VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack
    check_status

    # Cleanup - remove the downloaded files
    rm virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb
    rm Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack

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

remove_existing_virtualbox
install_virtualbox

# End
