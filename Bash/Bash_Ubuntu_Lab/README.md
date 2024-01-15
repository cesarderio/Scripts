# Automated Setup Script for Code Fellows OPS Course Lab Kit PC

This script offers a seamless approach to setting up the lab kit PC required for the Code Fellows OPS Course. By automating the entire process, users can bypass the manual steps, having everything set up with a single execution of this script.

## Features

1. **System Update**: Prioritizes the system's health by ensuring all system packages are up-to-date.
2. **SSH**: Installs Secure Shell (SSH) for encrypted remote operations.
3. **XRDP**: Sets up XRDP, an essential Remote Desktop Protocol (RDP) server, paving the way for remote desktop access.
4. **VS Code**: Deploys Microsoft's Visual Studio Code, a leading code editor.
5. **Git**: Ensures Git's presence, installs if absent, and facilitates its configuration with user details.
6. **Google Chrome**: Handles the download, installation, and default setting of the Chrome browser.
7. **VirtualBox**: Onboards VirtualBox, a comprehensive virtualization tool, and its essential Extension Pack.
8. **Gnome Tweaks**: Customizes the Gnome desktop environment to enhance user experience.
9. **PolicyKit**: Verifies the presence of PolicyKit (polkit) and takes care of its installation if missing.

## Usage

1. **Download**: Secure the script onto your system.
2. **Permission**: Bestow the script with execute permissions via `chmod +x Ubuntu_Init.sh`.
3. **Execute**: Initiate the script with `./Ubuntu_Init.sh`.

> **Note**: Due to the nature of operations, the script may request `sudo` privileges, prompting users for their password.

## Credits

All credit for the foundational steps and configurations goes to [Code Fellows](https://www.codefellows.org/). Their detailed guide was the blueprint for this automation. For an in-depth understanding and context of each step, users are recommended to explore the original guide by Code Fellows.
