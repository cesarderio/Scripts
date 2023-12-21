#!/bin/bash

# Script Name:                  Git Authentication Configuration Script
# Author:                       Raphael Chookagian
# Date of latest revision:      12/20/2023
# Purpose:                      Updated script that configures Git and guides through GitHub authentication using SSH credentials or Token authentication

# Check if git is installed
is_git_installed() {
    if git --version &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Install git
install_git() {
    sudo apt update
    sudo apt install -y git
}

# Upgrade git
upgrade_git() {
    sudo apt update
    sudo apt upgrade -y git
}

# Configure git
configure_git() {
    read -p "Enter your GitHub username: " username
    read -p "Enter your GitHub email: " email

    git config --global user.name "$username"
    git config --global user.email "$email"
}

# Generate SSH Key for GitHub
generate_ssh_key() {
    read -p "Enter a file in which to save the key (/home/$(whoami)/.ssh/id_rsa): " ssh_key_path
    ssh_key_path=${ssh_key_path:-/home/$(whoami)/.ssh/id_rsa}
    ssh-keygen -t rsa -b 4096 -C "$email" -f "$ssh_key_path"
    echo "Your SSH key has been generated."
    echo "Please add this SSH key to your GitHub account."
    cat "${ssh_key_path}.pub"
}

# Configure GitHub Authentication
configure_github_authentication() {
    echo "Choose your preferred method for GitHub authentication:"
    select choice in "HTTPS (Personal Access Token)" "SSH Key" "Skip"; do
        case $choice in
            "HTTPS (Personal Access Token)")
                echo "For HTTPS, use your personal access token as your password when prompted."
                echo "Visit GitHub to generate a personal access token."
                break
                ;;
            "SSH Key")
                generate_ssh_key
                break
                ;;
            "Skip")
                echo "Skipping GitHub authentication setup."
                break
                ;;
        esac
    done
}

# Main function
main() {
    if is_git_installed; then
        read -p "Git is already installed. Do you want to update/upgrade it? (yes/no): " choice
        if [[ $choice == "yes" ]]; then
            upgrade_git
        fi
    else
        echo "Git is not installed. Installing now..."
        install_git
    fi

    configure_git
    configure_github_authentication
    echo "Git has been configured successfully!"
}

main
