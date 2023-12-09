#!/bin/bash

# Script Name:                  VBox_Install
# Author:                       Raphael Chookagian
# Date of latest revision:      12/08/2023
# Purpose:                      Script installs VirtualBox 7 and settings to place it in the dock/desktop

# Function to check the last command's status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error encountered: $1"
        exit 1
    fi
}

# Function to compile the VirtualBox kernel module
compile_vbox_kernel_module() {
    echo "Compiling the VirtualBox kernel module..."
    sudo /sbin/vboxconfig
}

# Function to terminate all VirtualBox processes and stop services
terminate_vbox_processes() {
    echo "Terminating any running VirtualBox processes and stopping services..."

    # Forcefully terminate VirtualBox GUI and background services
    sudo pkill -f "VirtualBox"
    sudo pkill -f "VBoxXPCOMIPCD"
    sudo pkill -f "VBoxSVC"
    sudo pkill -f "VBoxNetDHCP"
    sudo pkill -f "VBoxNetNAT"
    sudo pkill -f "VBoxHeadless"
    sudo pkill -f "VBoxManage"

    # Stop VirtualBox services
    sudo systemctl stop vboxdrv vboxballoonctrl-service vboxautostart-service vboxweb-service

    # Wait for processes and services to terminate
    sleep 10

    # Check if any VirtualBox process is still running
    if pgrep -f "VirtualBox" > /dev/null; then
        echo "Some VirtualBox processes are still running. Please close them manually."
        exit 1
    fi
}

# Function to shut down running VMs
shutdown_vms() {
    echo "Shutting down all running VirtualBox VMs..."

    # Improved parsing of running VMs to handle unexpected output
    VBoxManage list runningvms | grep -Eo '"[^"]+"' | while read -r vm; do
        vm_name=$(echo $vm | sed 's/"//g')
        echo "Powering off VM: $vm_name"
        VBoxManage controlvm "$vm_name" poweroff
        check_status "Failed to power off VM: $vm_name"
        echo "VM $vm_name powered off."
    done
}

# Function to remove existing VirtualBox installations
remove_existing_virtualbox() {
    echo "Checking for existing VirtualBox installations..."

    # Check if VirtualBox is installed and remove it
    if dpkg -l | grep -i virtualbox; then
        echo "Removing existing VirtualBox installations..."
        sudo apt-get remove --purge -y "^virtualbox.*"
        check_status "Failed to remove existing VirtualBox installations"
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
    check_status "Failed to download VirtualBox Debian package"

    # Install the downloaded package
    sudo dpkg -i "$vbox_deb"
    if [ $? -ne 0 ]; then
        echo "Attempting to fix broken dependencies..."
        sudo apt-get install -f
        check_status "Failed to fix broken dependencies"
    fi

    # Download the VirtualBox 7 extension pack
    wget "https://download.virtualbox.org/virtualbox/7.0.12/$vbox_extpack"
    check_status "Failed to download VirtualBox Extension Pack"

    # Install the VirtualBox 7 extension pack
    VBoxManage extpack install "$vbox_extpack"
    check_status "Failed to install VirtualBox Extension Pack"

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
check_status "Apt update failed."

compile_vbox_kernel_module
terminate_vbox_processes
shutdown_vms
remove_existing_virtualbox
install_virtualbox

# End
