#!/bin/bash

# Script Name:                  SSH & RDP setup script
# Author:                       Raphael Chookagian
# Date of latest revision:      1/15/2024
# Purpose:                      This script installs and sets up SSH and RDP (xrdp) on Ubuntu, and configures GNOME Terminal to start on system startup.

# Function to install SSH
install_ssh() {
    echo "Installing SSH..."
    sudo apt install ssh -y
    if [ $? -ne 0 ]; then
        echo "Failed to install SSH. Exiting."
        exit 1
    fi
    echo "SSH installed successfully."
}

# Function to install XRDP
install_xrdp() {
    echo "Installing XRDP..."
    sudo apt install xrdp -y
    if [ $? -ne 0 ]; then
        echo "Failed to install XRDP. Exiting."
        exit 1
    fi
    echo "XRDP installed successfully."
}

# Function to configure XRDP
configure_xrdp() {
    echo "Configuring XRDP..."
    sudo systemctl enable --now xrdp

    # Adding environment variables to startwm.sh
    sudo sed -i '4 i\export XDG_CURRENT_DESKTOP=ubuntu:GNOME' /etc/xrdp/startwm.sh
    sudo sed -i '4 i\export GNOME_SHELL_SESSION_MODE=ubuntu' /etc/xrdp/startwm.sh
    sudo sed -i '4 i\export DESKTOP_SESSION=ubuntu' /etc/xrdp/startwm.sh

    # Create polkit directory if it doesn't exist
    sudo mkdir -p /etc/polkit-1/localauthority/50-local.d/

    create_polkit_file "/etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla" \
        "[Allow Colord all Users]" \
        "Identity=unix-user:*" \
        "Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile" \
        "ResultAny=no" \
        "ResultInactive=no" \
        "ResultActive=yes"

    create_polkit_file "/etc/polkit-1/localauthority/50-local.d/46-allow-update-repo.pkla" \
        "[Allow Package Management all Users]" \
        "Identity=unix-user:*" \
        "Action=org.freedesktop.packagekit.system-sources-refresh" \
        "ResultAny=yes" \
        "ResultInactive=yes" \
        "ResultActive=yes"

    echo "XRDP configured successfully."
}

create_polkit_file() {
    local file_path=$1
    shift
    echo "$@" | sudo tee "$file_path"
}

# Check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Configure GNOME settings and autostart for Terminal
configure_gnome() {
    if command_exists gsettings; then
        echo "Configuring GNOME settings..."
        gsettings set org.gnome.desktop.screensaver lock-enabled false
    else
        echo "GNOME settings not configured: gsettings command not found."
    fi

    local autostart_dir="$HOME/.config/autostart"
    mkdir -p "$autostart_dir"
    create_autostart_desktop_file "gnome-terminal.desktop" "Terminal" "Start Terminal On Startup"
}

# Create autostart desktop file
create_autostart_desktop_file() {
    local desktop_file=$1
    local name=$2
    local comment=$3
    local file_path="$HOME/.config/autostart/$desktop_file"

    if [ -f "$file_path" ]; then
        echo "Autostart file $desktop_file already exists."
    else
        echo "Creating autostart file for $name..."
        tee "$file_path" <<EOL
[Desktop Entry]
Type=Application
Exec=gnome-terminal
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_NG]=$name
Name=$name
Comment[en_NG]=$comment
Comment=$comment
EOL
        echo "Autostart file for $name created."
    fi
}

# Main function to orchestrate the setup
main() {
    echo "Starting Ubuntu Lab PC setup..."

    sudo apt update
    sudo apt upgrade -y
    if [ $? -ne 0 ]; then
        echo "Failed to update/upgrade packages. Exiting."
        exit 1
    fi

    install_ssh
    install_xrdp
    configure_xrdp

    if ! command_exists gsettings; then
        echo "GNOME not detected. Skipping GNOME configuration."
    else
        configure_gnome
    fi

    if ! command_exists polkit; then
        echo "Installing policykit-1..."
        sudo apt install policykit-1 -y
        if [ $? -ne 0 ]; then
            echo "Failed to install policykit-1. Exiting."
            exit 1
        fi
        echo "policykit-1 installed successfully."
    fi

    echo "Ubuntu Lab PC setup completed successfully."
}

# Execute the main function
main
