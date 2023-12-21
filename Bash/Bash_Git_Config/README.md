# Git Configuration Bash Script for Ubuntu

This README provides detailed information about the Git_Config.sh bash script for Ubuntu systems. The script automates the process of verifying the presence of Git, installing it if absent, offering update/upgrade options if already present, and configuring Git with the user's specified username and email.

## Overview

The `Git_Config.sh` bash script automates the following processes:

1. Verifies if Git is installed on the system.
2. If Git is installed, it provides the user with an option to update or upgrade it using the `apt` package manager.
3. If Git is not present, it installs Git using the `apt` package manager.
4. Configures Git with a username and email based on user input.

## Prerequisites

- An Ubuntu system.
- Superuser privileges (for using `sudo` commands within the script).

## Usage

1. Open a terminal.
2. Navigate to the directory containing the `Git_Config.sh` script.
3. Give execute permissions to the script: `chmod +x Git_Config.sh`.
4. Run the script using `./Git_Config.sh`.
5. Follow the on-screen prompts.

## Steps

1. The script starts by checking if Git is already installed on the system.
    - If it is installed, the user is prompted to decide if they want to update or upgrade Git using the `apt` package manager.
    - If Git is not installed, the script proceeds to install it using the `apt` package manager.

2. The user will be prompted to input their GitHub username and email. These details will be used to globally configure Git on the system.

3. Once Git is configured, a confirmation message will be displayed, indicating successful configuration.

## Notes

- It's essential to run the script with sufficient privileges, as it uses `sudo` commands for package management.
- Always backup essential data before making significant changes to your system or installing new software.
- The script uses the `apt` package manager, which is common to Ubuntu and its derivatives. If you're using another Linux distribution, ensure it's compatible or adjust the package management commands accordingly.
