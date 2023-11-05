#!/usr/bin/env python3


# Script Name: VBox_Install
# Author: Raphael Chookagian
# Date of latest revision: 10/05/2023
# Purpose: Script installs VirtualBox and settings to place it in the dock/desktop

import subprocess

def run_command(command, exit_on_failure=True):
    """
    Run a shell command and check its status.
    """
    result = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    if result.returncode != 0 and exit_on_failure:
        print(f"Error encountered when running command: {command}")
        print(result.stderr)
        sys.exit(1)

    return result.stdout

def install_virtualbox():
    """
    Function to install VirtualBox and add it to favorites.
    """
    run_command("sudo apt install virtualbox -y")
    
    # Download the VirtualBox extension pack
    run_command("wget https://download.virtualbox.org/virtualbox/6.1.38/Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack")

    # Install the VirtualBox extension pack
    run_command("VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack")

    # Cleanup - remove the downloaded extension pack
    run_command("rm Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack")

    # Add VirtualBox to favorites
    add_to_favorites("virtualbox.desktop")

def add_to_favorites(desktop_file):
    """
    Function to add an application to favorites in GNOME Shell.
    """
    favorites = run_command("gsettings get org.gnome.shell favorite-apps")
    favorites = favorites.strip().rstrip("]").rstrip() + f", '{desktop_file}']"
    run_command(f"gsettings set org.gnome.shell favorite-apps '{favorites}'")

def main():
    run_command("sudo apt update")
    install_virtualbox()

if __name__ == "__main__":
    main()
