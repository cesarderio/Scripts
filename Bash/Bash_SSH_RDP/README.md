# SSH & RDP Setup Bash Script

This script facilitates the installation and configuration of SSH and RDP (xrdp), and sets up the GNOME Terminal to start automatically on system startup.

## Overview

The `Ubuntu_Lab_PC_Setup.sh` bash script simplifies the following processes:

1. Installs SSH and XRDP if they are not already installed on the system.
2. Configures XRDP for optimal performance with Ubuntu's GNOME desktop environment.
3. Automatically enables XRDP to start on system boot.
4. Configures GNOME to disable the screensaver lock and sets up the GNOME Terminal to launch on startup.

## Prerequisites

- Ubuntu system (preferably the latest version for best compatibility).
- Superuser privileges (for executing `sudo` commands within the script).

## Usage

1. Open a terminal window.
2. Navigate to the directory where `Ubuntu_Lab_PC_Setup.sh` is located.
3. Give execute permissions to the script: `chmod +x Ubuntu_Lab_PC_Setup.sh`.
4. Execute the script: `./Ubuntu_Lab_PC_Setup.sh`.
5. The script will run through the installation and configuration process, providing feedback and prompts as necessary.

## Steps

1. The script begins by updating the system packages and upgrading them if necessary.
2. It then checks for the presence of SSH and XRDP, installing them if they are not found.
3. XRDP is configured to work seamlessly with Ubuntu's GNOME desktop environment.
4. The script also sets up policy kit rules to enhance the functionality and user experience with XRDP.
5. GNOME is configured to disable the screensaver lock and to auto-start the GNOME Terminal on system startup.

## Notes

- Ensure that you have administrative privileges as the script requires `sudo` access for various operations.
- The script is designed to be idempotent, meaning it can be safely run multiple times without causing unintended side effects.
- The script provides clear feedback during each step, enhancing the user experience and making it easier to track the setup progress.
- It's recommended to review and understand the script before running it, especially in a production environment.
- While this script is tailored for Ubuntu, some features might work on other Debian-based distributions, but full compatibility is not guaranteed.
- Always back up important data before running scripts that make significant changes to your system.
