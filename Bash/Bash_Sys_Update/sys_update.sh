#!/bin/bash

# Script Name:                  Linux Update Script
# Author:                       Raphael Chookagian
# Date of latest revision:      1/15/2024
# Purpose:                      This script runs update, upgrade, and clean-up operations on Linux.

LOG_FILE="/var/log/linux_update_script.log"

# Function to log messages
log_message() {
    echo "$(date +"%Y-%m-%d %T"): $1" | sudo tee -a "$LOG_FILE"
}

# Function to update package lists
update_packages() {
    log_message "Starting package list update."
    sudo apt update 2>&1 | sudo tee -a "$LOG_FILE"
    if [ $? -ne 0 ]; then
        log_message "Package list update failed."
        exit 1
    else
        log_message "Package list updated successfully."
    fi
}

# Function to upgrade installed packages
upgrade_packages() {
    echo "Do you want to proceed with the upgrade? (yes/no)"
    read -r user_input

    if [ "$user_input" = "yes" ]; then
        log_message "Starting package upgrade."
        sudo apt upgrade -y 2>&1 | sudo tee -a "$LOG_FILE"
        if [ $? -ne 0 ]; then
            log_message "Package upgrade failed."
            exit 1
        else
            log_message "Packages upgraded successfully."
        fi
    else
        log_message "Package upgrade aborted by the user."
        exit 0
    fi
}

# Function to remove unnecessary packages
autoremove_packages() {
    log_message "Starting autoremove of unnecessary packages."
    sudo apt autoremove -y 2>&1 | sudo tee -a "$LOG_FILE"
    if [ $? -ne 0 ]; then
        log_message "Autoremove of packages failed."
        exit 1
    else
        log_message "Unnecessary packages removed successfully."
    fi
}

# Function to clean up the local repository
clean_local_repository() {
    log_message "Cleaning up the local repository of retrieved package files."
    sudo apt clean 2>&1 | sudo tee -a "$LOG_FILE"
    if [ $? -ne 0 ]; then
        log_message "Failed to clean up local repository."
        exit 1
    else
        log_message "Local repository cleaned up successfully."
    fi
}

# Main function
main() {
    update_packages
    upgrade_packages
    autoremove_packages
    clean_local_repository
    log_message "Linux Update Script completed successfully."
}

# Execute the main function
main


