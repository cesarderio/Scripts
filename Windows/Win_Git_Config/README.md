# Windows Git Configuration PowerShell Script

This README provides information on the PowerShell script designed to check, install, and configure Git on Windows systems. This script is a translation of the `Ubuntu/Git_Config.sh` script initially created for Ubuntu systems.

## Overview

The provided PowerShell script performs the following actions:

1. Checks if Git is installed.
2. Checks for the presence of the Chocolatey package manager.
3. Offers the user a choice to either install Git using Chocolatey or download it directly from the Git website.
4. Configures Git with a username and email based on user input.

## Prerequisites

- A Windows system with administrative privileges.
- PowerShell with execution policies set appropriately. Please note that the script requires changes to the execution policy. It's crucial to understand the implications of modifying the execution policy in PowerShell.

## Usage

1. Open PowerShell as an Administrator.
2. Navigate to the directory containing the script.
3. Run the script using `.\Win_Git_In.ps1`
4. Follow the on-screen prompts.

## Steps

1. The script first checks if Git is already installed.
    - If installed, it prompts the user to choose whether to update Git using Chocolatey.
    - If not installed, it offers two methods of installation: via Chocolatey or direct download from the Git website.

2. If Chocolatey is selected but isn't installed, the script will first install Chocolatey and then proceed with the Git installation.

3. If direct download is chosen, the script will open the default web browser and direct the user to the Git download page.

4. After ensuring Git is installed, the script prompts the user for their GitHub username and email. These details are then used to configure Git on the system.

5. A confirmation message is displayed upon successful configuration.

## Notes

- Ensure you have administrative privileges before running this script.
- The script may need to change the execution policy to install Chocolatey. Always be aware of the security implications associated with altering the execution policy. Specifically, the script uses `Set-ExecutionPolicy Bypass` to temporarily allow the Chocolatey installation script to run. After installation, consider setting your execution policy back to its original setting.
- Always make sure to download software from trusted sources. Chocolatey and Git are reputable, but always be vigilant.
