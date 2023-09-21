#!/usr/bin/python3

import os
import subprocess

def is_git_installed():
    try:
        subprocess.check_output(["git", "--version"])
        return True
    except FileNotFoundError:
        return False

def install_git():
    os.system("sudo apt update")
    os.system("sudo apt install git -y")

def upgrade_git():
    os.system("sudo apt update")
    os.system("sudo apt upgrade git -y")

def configure_git():
    username = input("Enter your GitHub username: ")
    email = input("Enter your GitHub email: ")

    os.system(f"git config --global user.name '{username}'")
    os.system(f"git config --global user.email '{email}'")

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
