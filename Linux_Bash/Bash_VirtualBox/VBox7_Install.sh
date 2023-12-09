#!/bin/bash

# Script Name:                  VBox_Install
# Author:                       Raphael Chookagian
# Date of latest revision:      12/08/2023
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

    # Forcefully terminate VirtualBox GUI
    sudo pkill -f "VirtualBox"

    # Forcefully terminate all VirtualBox background services
    sudo pkill -f "VBoxXPCOMIPCD"
    sudo pkill -f "VBoxSVC"
    sudo pkill -f "VBoxNetDHCP"
    sudo pkill -f "VBoxNetNAT"
    sudo pkill -f "VBoxHeadless"
    sudo pkill -f "VBoxManage"

    # Wait for a few seconds to ensure processes are terminated
    sleep 10

    # Check if any VirtualBox process is still running
    if pgrep -f "VirtualBox" > /dev/null; then
        echo "Some VirtualBox processes are still running. Please close them manually."
        exit 1
    else
        echo "All VirtualBox processes terminated."
    fi
}

# ... rest of the script remains the same ...

# Main
sudo apt update
check_status

terminate_vbox_processes
shutdown_vms_and_remove_extpack
remove_existing_virtualbox
install_virtualbox

# End
