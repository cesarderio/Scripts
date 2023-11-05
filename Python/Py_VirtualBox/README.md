# VBox_Install Python Script

**Author**: Raphael Chookagian
**Date of latest revision**: 10/05/2023

## Description

The `VBox_Install` script, written in Python, automates the process of installing VirtualBox on a Linux system. After the installation, the script fetches and installs the VirtualBox extension pack for version 6.1.38. To enhance the user's experience, the script also ensures that VirtualBox is conveniently placed in the dock/desktop as a favorite application.

## Prerequisites

1. **Operating System**: The script is intended for Linux systems with apt package management (like Ubuntu).
2. **GNOME Shell**: The feature to add VirtualBox to the favorites requires a GNOME shell environment.
3. **sudo privileges**: The script requires sudo privileges to install packages and manage the system.
4. **Python**: This script is written in Python and requires Python 3.x to be installed.

## Installation and Execution Instructions

1. Clone the repository or download the `VBox_Install.py` script.
2. Provide execution permissions:

   ```bash
   chmod +x VBox_Install.py
   ```

3. Execute the script:

   ```bash
   ./VBox_Install.py
   ```

## Features

- Automated installation of the latest VirtualBox available in the repository.
- Downloads and installs the VirtualBox extension pack (version 6.1.38).
- Adds VirtualBox to the favorites in the GNOME shell for quick access.

## Notes

- Ensure you have internet connectivity when running the script as it needs to download packages.
- The script currently installs the VirtualBox extension pack for version 6.1.38. If a different version is required, modifications to the script will be needed.
