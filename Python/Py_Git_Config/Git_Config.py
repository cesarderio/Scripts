#!/usr/bin/python3

# Script Name:                  Python Git Configuration
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      Python Git Configuration Script

import subprocess

def is_git_installed():
    try:
        subprocess.run(["git", "--version"], check=True, capture_output=True)
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        return False

def install_git():
    try:
        subprocess.run(["sudo", "apt", "update"], check=True)
        subprocess.run(["sudo", "apt", "install", "git", "-y"], check=True)
    except subprocess.CalledProcessError:
        print("Failed to install git. Ensure you have sudo privileges and apt is working correctly.")

def upgrade_git():
    try:
        subprocess.run(["sudo", "apt", "update"], check=True)
        subprocess.run(["sudo", "apt", "upgrade", "git", "-y"], check=True)
    except subprocess.CalledProcessError:
        print("Failed to upgrade git. Ensure you have sudo privileges and apt is working correctly.")

def configure_git():
    username = input("Enter your GitHub username: ")
    email = input("Enter your GitHub email: ")

    try:
        subprocess.run(["git", "config", "--global", "user.name", username], check=True)
        subprocess.run(["git", "config", "--global", "user.email", email], check=True)
    except subprocess.CalledProcessError:
        print("Failed to configure git.")

def main():
    if not is_git_installed():
        print("Git is not installed. Installing now...")
        install_git()
    else:
        choice = input("Git is already installed. Do you want to update/upgrade it? (yes/no): ").lower()
        if choice == 'yes':
            upgrade_git()

    configure_git()
    print("Git has been configured successfully!")

if __name__ == "__main__":
    main()
