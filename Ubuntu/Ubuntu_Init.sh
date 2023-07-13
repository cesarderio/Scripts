#!/bin/bash

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
    # Set xrdp to run automatically
    sudo systemctl enable --now xrdp

    # Get regular GNOME experience over RDP
    sudo sed -i '4 i\export XDG_CURRENT_DESKTOP=ubuntu:GNOME' /etc/xrdp/startwm.sh
    sudo sed -i '4 i\export GNOME_SHELL_SESSION_MODE=ubuntu' /etc/xrdp/startwm.sh
    sudo sed -i '4 i\export DESKTOP_SESSION=ubuntu' /etc/xrdp/startwm.sh

    # Remove “color profile authentication” popup in XRDP change settings/colors
    create_polkit_file "/etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla" \
        "[Allow Colord all Users]" \
        "Identity=unix-user:*" \
        "Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile" \
        "ResultAny=no" \
        "ResultInactive=no" \
        "ResultActive=yes"

    # Remove “Authentication required to refresh system repositories” popup on login via XRDP
    create_polkit_file "/etc/polkit-1/localauthority/50-local.d/46-allow-update-repo.pkla" \
        "[Allow Package Management all Users]" \
        "Identity=unix-user:*" \
        "Action=org.freedesktop.packagekit.system-sources-refresh" \
        "ResultAny=yes" \
        "ResultInactive=yes" \
        "ResultActive=yes"
}

# Function to create a polkit file
create_polkit_file() {
    local file_path=$1
    shift
    echo "$@" | sudo tee "$file_path"
}

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

# Function to configure GNOME settings
configure_gnome() {
    # Deactivate screen locking
    gsettings set org.gnome.desktop.screensaver lock-enabled false

    # Set dark mode as default
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

    # Auto open gnome-terminal on login
    mkdir -p ~/.config/autostart/
    create_autostart_desktop_file "gnome-terminal.desktop" "Terminal" "Start Terminal On Startup"

    # Set Favorite Apps
    add_to_favorites "terminal.desktop"
    add_to_favorites "files.desktop"
    add_to_favorites "virtualbox.desktop"
    add_to_favorites "code.desktop"

    # Set Gnome Terminal’s Colors
    wget https://raw.githubusercontent.com/codefellows/setup-guide/main/configs/ops/gnome-terminal-profiles.dconf
    dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
    rm gnome-terminal-profiles.dconf
}

# Function to create an autostart desktop file
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

# Main function
main() {
    # Update and upgrade packages
    sudo apt update
    sudo apt upgrade -y

    # Install SSH and XRDP
    install_ssh
    install_xrdp

    # Configure XRDP
    configure_xrdp

    # Install VirtualBox
    install_virtualbox

    # Configure GNOME settings
    configure_gnome
}

# Call the main function
main
