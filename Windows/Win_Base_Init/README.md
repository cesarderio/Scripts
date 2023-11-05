# Windows Setup Script for Code Fellows Ops Course

This script facilitates the setup and configuration of various tools and utilities needed for the Code Fellows Ops course on a Windows machine. It's designed to simplify and automate the process, allowing for a seamless setup experience.

## Overview

This is a PowerShell script translation of the `Ubuntu_Init` script for basic installations and configurations, including tools like SSH, RDP, VSCode, Chrome, VirtualBox, and more. The goal of this translation is to offer a similar setup process for Windows users.

**Note**: While this script is a translation of `Ubuntu_Init`, some behaviors might differ due to inherent differences between Linux and Windows systems. Always exercise caution and test in a controlled environment before full-scale use.

## Pre-requisites

- **Chocolatey**: The script leverages Chocolatey, a Windows package manager, to streamline software installations. Before running the script, ensure you have Chocolatey installed. If not, [follow the installation guide here](https://chocolatey.org/install).

## Features

1. **SSH Installation**: Installs and sets up the OpenSSH client and server available as Windows Features.
2. **RDP Configuration**: Activates the Remote Desktop Protocol (RDP) and configures the required firewall rules.
3. **VS Code & Git**: Simplifies the process of installing and setting up VS Code and Git. For Git, the script assists in configuring the global username and email.
4. **Google Chrome**: Aids in installing the Google Chrome browser.
5. **VirtualBox**: Facilitates the installation of VirtualBox.

## Special Notes

- **Setting Default Browser**: Setting a default browser programmatically on Windows can be tricky. The script employs a Chocolatey-based method for this purpose, but it may not work consistently across all setups.

- **Safety First**: Before using this script on a main or production system, test it in a safe environment. While the script includes checks and prompts to ensure accuracy, user discretion is crucial.

- **Package Checks**: The script has a helper function (`Is-ChocoPackageInstalled`) to determine if a package is already installed using Chocolatey. If a package isn't found, the script prompts the user for confirmation before proceeding with the installation.

## Usage

1. Launch PowerShell with administrator privileges.
2. Navigate to the directory where the script resides.
3. Run the script by typing `.\setup.ps1`

## Credits & Acknowledgments

This automation script is inspired by the setup guidelines from Code Fellows. We express our gratitude for their detailed instructions, which made it possible to craft this consolidated setup tool. The aim is to make the initial setup process for the Code Fellows Ops course smoother and more intuitive.
