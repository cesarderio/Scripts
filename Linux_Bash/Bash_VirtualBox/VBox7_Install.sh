#!/bin/bash

# Script Name:                  VBox_Install
# Author:                       Raphael Chookagian
# Date of latest revision:      12/07/2023
# Purpose:                      Script installs VirtualBox 7 and settings to place it in the dock/desktop

# Function to check the last command's status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error encountered. Exiting."
        exit 1
    fi
}


# Function to terminate all VirtualBox processes
terminate_vbox_processes() {
    echo "Terminating any running VirtualBox processes..."

    # Terminate all VirtualBox related processes
    sudo pkill VBox

    # Wait for a few seconds to ensure processes are terminated
    sleep 5
}


# Function to shut down running VMs and uninstall the existing VirtualBox extension pack
shutdown_vms_and_remove_extpack() {
    echo "Shutting down running VirtualBox VMs..."

    # Shut down all running VMs
    running_vms=$(VBoxManage list runningvms | awk '{print $1}' | sed 's/"//g')
    if [ -n "$running_vms" ]; then
        for vm in $running_vms; do
            VBoxManage controlvm "$vm" poweroff
            check_status
        done
    fi

    echo "Uninstalling existing VirtualBox Extension Pack..."
    # Check if Extension Pack is installed and uninstall it
    if VBoxManage list extpacks | grep -q "Oracle VM VirtualBox Extension Pack"; then
        VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
        check_status
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
    vbox_deb="virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb"
    vbox_extpack="Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack"

    # Download VirtualBox 7.0.12 Debian package
    wget "https://download.virtualbox.org/virtualbox/7.0.12/$vbox_deb"
    check_status

    # Install the downloaded package
    sudo dpkg -i "$vbox_deb"
    if [ $? -ne 0 ]; then
        echo "Attempting to fix broken dependencies..."
        sudo apt-get install -f
        check_status
    fi

    # Download the VirtualBox 7 extension pack
    wget "https://download.virtualbox.org/virtualbox/7.0.12/$vbox_extpack"
    check_status

    # Install the VirtualBox 7 extension pack
    VBoxManage extpack install "$vbox_extpack"
    check_status

    # Cleanup - remove the downloaded files
    rm "$vbox_deb"
    rm "$vbox_extpack"

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

shutdown_vms_and_remove_extpack
remove_existing_virtualbox
install_virtualbox

# End
