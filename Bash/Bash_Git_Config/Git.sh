#!/bin/bash

# Install Git
install_git() {
    sudo apt update
    sudo apt install git -y
}

# Configure Git
configure_git() {
    read -p "Enter your name for Git: " git_name
    read -p "Enter your email address for Git: " git_email

    # Set Git global configuration
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
}

# Main function
main() {
    install_git
    configure_git
}

# Call the main function
main
