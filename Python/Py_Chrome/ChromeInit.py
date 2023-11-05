#!/usr/bin/env python3

# Script Name:                  Python Chrome Install & Set as Default Script
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      The `Chrome Initialization (Python Version)` script enables a streamlined installation of Google Chrome on Linux, sets it as the default browser, and adds it to GNOME favorites if applicable.

import os
import subprocess

def check_status():
    if subprocess.call("echo $?") != 0:
        print("Error encountered. Exiting.")
        exit(1)

def is_key_added():
    try:
        output = subprocess.check_output("apt-key list", shell=True).decode('utf-8')
        return "Google, Inc." in output
    except:
        return False

def is_gnome_installed():
    try:
        subprocess.check_output("command -v gnome-shell", shell=True)
        return True
    except:
        return False

def main():
    # Install prerequisites
    os.system("sudo apt update && sudo apt install -y wget apt-transport-https gnupg")
    check_status()

    # Check if Google Chrome signing key is already added
    if not is_key_added():
        os.system("wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -")
        check_status()

        os.system('echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list')
        check_status()
    else:
        print("Google Chrome repository key already added.")

    # Update the package list and install Google Chrome
    os.system("sudo apt update && sudo apt install -y google-chrome-stable")
    check_status()

    # Set Google Chrome as default browser
    os.system("sudo update-alternatives --set x-www-browser /usr/bin/google-chrome-stable")
    os.system("sudo update-alternatives --set gnome-www-browser /usr/bin/google-chrome-stable")

    # Check if GNOME is installed and add Google Chrome to favorites
    if is_gnome_installed():
        favorites = subprocess.getoutput("gsettings get org.gnome.shell favorite-apps")
        if "google-chrome.desktop" not in favorites:
            new_favorites = favorites.replace("]", ", 'google-chrome.desktop']")
            os.system(f'gsettings set org.gnome.shell favorite-apps "{new_favorites}"')
        else:
            print("Google Chrome already in GNOME favorites.")
    else:
        print("GNOME not installed. Skipping the addition of Google Chrome to GNOME favorites.")

    print("Google Chrome has been installed and set as the default browser.")

if __name__ == "__main__":
    main()
