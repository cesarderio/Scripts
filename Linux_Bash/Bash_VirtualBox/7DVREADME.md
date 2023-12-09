# VirtualBox Installation Script

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

   ```
   chmod +x VBox7_dev.sh
   ```

4. Run the script:

   ```
   sudo ./VBox7_dev.sh
   ```

## Warning

- This script performs significant changes to system packages and configurations. It is recommended to backup important data before running the script.
- The script includes an option to forcefully remove VirtualBox (`--force-remove-reinstreq`). This is a powerful option and should be used with caution as it can leave your system in an inconsistent state.

## Support

If you encounter any issues or have questions, consider seeking help from VirtualBox forums or a knowledgeable system administrator.

## Author

Raphael Chookagian

## Last Updated

December 8, 2023
