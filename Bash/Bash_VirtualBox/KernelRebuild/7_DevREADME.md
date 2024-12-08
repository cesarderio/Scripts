# VirtualBox Installation Script

## **Warning**

- This script performs significant changes to system packages and configurations. It is recommended to backup important data before running the script.
- The script includes an option to forcefully remove VirtualBox (`--force-remove-reinstreq`). This is a powerful option and should be used with caution as it can leave your system in an inconsistent state.

## **Table of Contents**

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Workflow](#script-workflow)
- [Output](#output)
- [Compatibility](#compatibility)
- [Notes](#notes)
- [Contribution](#contribution)
- [Author](#author)

## Overview

This script (`VBox7_dev.sh`) is designed to automate the installation of Oracle VM VirtualBox 7.0 on Ubuntu systems. It handles the removal of existing VirtualBox installations, terminates running VirtualBox processes, compiles necessary kernel modules, and installs the latest version of VirtualBox along with its extension pack.
To enhance usability, the scripts ensure that VirtualBox is conveniently placed in the dock/desktop as a favorite application, making it easily accessible for the user.

## Features

- Checks and fixes interrupted `dpkg` processes.
- Compiles the VirtualBox kernel module.
- Terminates running VirtualBox processes and services.
- Shuts down all running VirtualBox VMs.
- Removes existing VirtualBox installations.
- Provides an option to force remove VirtualBox in case of errors.
- Installs VirtualBox 7.0 and its extension pack.
- Cleans up downloaded installation files.

## Prerequisites

- Ubuntu-based Linux distribution.
- Internet connection for downloading VirtualBox and its extension pack.
- Sudo privileges.

## Usage

1. Clone or download the `VBox7_dev.sh` script to your local system.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:

   ```bash
   chmod +x VBox7_dev.sh
   ```

4. Run the script:

   ```bash
   sudo ./VBox7_dev.sh
   ```

## **Script Workflow**

- Check for Interrupted `dpkg` Processes: The script checks for any interrupted package installations and attempts to fix them.

- Terminate Running VirtualBox Processes: It terminates any ongoing VirtualBox processes, including virtual machines.

- Remove Existing VirtualBox Installations: Any pre-installed versions of VirtualBox are removed from the system.

- Install VirtualBox 7.0: The script installs the latest version of VirtualBox 7.0 from the repository.

- Install Extension Pack: The corresponding extension pack for VirtualBox 7.0 is downloaded and installed.

1. Clean Up: The script removes any temporary files used during the installation process.

## **Output**

During execution, the script provides logs in the terminal that detail each step of the installation process, including any errors or issues encountered. Successful completion will show a message confirming that VirtualBox 7.0 and its extension pack were installed.

## **Compatibility**

- Supported Systems: This script is designed to work on Ubuntu-based Linux distributions.

- Dependencies: Requires an active internet connection and sudo privileges.

- GNOME Shell: If you want to add VirtualBox to GNOME favorites, GNOME Shell must be installed.

## **Notes**

- Force Removal Option: The script includes an option to forcefully remove VirtualBox (`--force-remove-reinstreq`). Use this option with caution as it can potentially leave your system in an inconsistent state.

- Kernel Modules: Ensure that the kernel headers are installed before running the script, as the VirtualBox kernel modules need to be compiled.

## **Contribution**

Your contributions can make these scripts even better:

- Fork the repository.
- Create a new branch:

  ```bash
  git checkout -b my-awesome-feature
  ```

- Make your invaluable changes.
- Commit your changes:

  ```bash
  git commit -am 'Added some amazing features'
  ```

- Push to the branch:

  ```bash
  git push origin my-awesome-feature
  ```

- Create a new Pull Request targeting the Bash directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.

