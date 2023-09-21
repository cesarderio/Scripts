#!/bin/bash

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
    echo "Git has been configured successfully!"
}

main
