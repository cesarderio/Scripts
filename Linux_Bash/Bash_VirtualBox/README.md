# VBox_Install

**Author**: Raphael Chookagian
**Date of latest revision**: 10/05/2023

## Description

The `VBox_Install` script automates the process of installing VirtualBox on a Linux system. After installation, the script also fetches and installs the VirtualBox extension pack for version 6.1.38. To enhance the user's experience, the script also ensures that VirtualBox is conveniently placed in the dock/desktop as a favorite application.

## Prerequisites

1. **Operating System**: The script is designed to work on Linux systems with apt package management (like Ubuntu).
2. **GNOME Shell**: For the functionality to add VirtualBox to the favorites, a GNOME shell environment is necessary.
3. **sudo privileges**: The script requires sudo privileges to install packages and manage the system.

## Installation Instructions

1. Clone the repository or download the `VBox_Install.sh` script.
2. Provide execution permissions:

   ```bash
   chmod +x VBox_Install.sh
   ```

3. Execute the script:

   ```bash
   ./VBox_Install.sh
   ```

## Features

- Automated installation of the latest VirtualBox available in the repository.
- Downloads and installs the VirtualBox extension pack (version 6.1.38).
- Adds VirtualBox to the favorites in the GNOME shell for quick access.

## Notes

- Ensure that you have internet connectivity when running the script, as it needs to download packages.
- The script currently installs the VirtualBox extension pack for version 6.1.38. If you need a different version, you'll need to modify the script accordingly.
