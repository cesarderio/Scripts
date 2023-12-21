#!/bin/bash

# Script Name:                  Ubuntu Lab PC setup script
# Author:                       Raphael Chookagian
# Date of latest revision:      11/5/2023
# Purpose:                      This script provides a streamlined process for setting up a lab kit PC required for the Code Fellows OPS Course. This is a collection of/from and credited to Code Fellows. Check out the README for more information.

# Function to install SSH
install_ssh() {
    sudo apt install ssh -y
}

# Function to install XRDP
install_xrdp() {
    sudo apt install xrdp -y
}

# Function to configure XRDP
configure_xrdp() {
    sudo systemctl enable --now xrdp

    sudo sed -i '4 i\export XDG_CURRENT_DESKTOP=ubuntu:GNOME' /etc/xrdp/startwm.sh
    sudo sed -i '4 i\export GNOME_SHELL_SESSION_MODE=ubuntu' /etc/xrdp/startwm.sh
    sudo sed -i '4 i\export DESKTOP_SESSION=ubuntu' /etc/xrdp/startwm.sh

    if ! [ -d "/etc/polkit-1/localauthority/50-local.d/" ]; then
        sudo mkdir -p /etc/polkit-1/localauthority/50-local.d/
    fi

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
}

create_polkit_file() {
    local file_path=$1
    shift
    echo "$@" | sudo tee "$file_path"
}

install_vscode() {
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install code -y
}

command_exists() {
    command -v "$1" &> /dev/null
}

configure_git() {
    if ! command_exists git; then
        echo "Git is not installed. Installing now..."
        sudo apt update
        sudo apt install git -y
    fi

    read -p "Do you want to configure Git? (y/n): " configure
    if [[ $configure == "y" || $configure == "Y" ]]; then
        read -p "Enter your GitHub username: " git_username
        read -p "Enter your GitHub email: " git_email
        git config --global user.name "$git_username"
        git config --global user.email "$git_email"
        echo "Git has been configured with the provided username and email."
    fi
}

install_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    if [ $? -eq 0 ]; then
        sudo apt update
        sudo apt install ./google-chrome-stable_current_amd64.deb -y
        rm google-chrome-stable_current_amd64.deb
    else
        echo "Failed to download Google Chrome. Skipping installation."
    fi
}

set_chrome_default() {
    xdg-settings set default-web-browser google-chrome.desktop
}

install_virtualbox() {
    sudo apt update
    sudo apt install virtualbox -y
    vbox_version=$(vboxmanage --version | sed -r 's/([0-9]+\.){2}[0-9]+.*/&/g' | sed 's/r.*//g' | sed 's/_.*//g')
    wget https://download.virtualbox.org/virtualbox/$vbox_version/Oracle_VM_VirtualBox_Extension_Pack-$vbox_version.vbox-extpack
    VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$vbox_version.vbox-extpack
    rm Oracle_VM_VirtualBox_Extension_Pack-$vbox_version.vbox-extpack
}

add_to_favorites() {
    local desktop_file=$1
    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed 's/.$//'), '$desktop_file']"
}

configure_gnome() {
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    mkdir -p ~/.config/autostart/
    create_autostart_desktop_file "gnome-terminal.desktop" "Terminal" "Start Terminal On Startup"
    add_to_favorites "terminal.desktop"
    add_to_favorites "files.desktop"
    add_to_favorites "virtualbox.desktop"
    add_to_favorites "code.desktop"
    wget https://raw.githubusercontent.com/codefellows/setup-guide/main/configs/ops/gnome-terminal-profiles.dconf
    dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
    rm gnome-terminal-profiles.dconf
}

create_autostart_desktop_file() {
    local desktop_file=$1
    local name=$2
    local comment=$3
    tee "$HOME/.config/autostart/$desktop_file" <<EOL
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
}

main() {
    sudo apt update
    sudo apt upgrade -y
    install_ssh
    install_xrdp
    configure_xrdp
    install_vscode
    configure_git
    install_chrome
    set_chrome_default
    install_virtualbox
    configure_gnome
    if ! command_exists polkit; then
        sudo apt update
        sudo apt install policykit-1 -y
    fi
}

main
