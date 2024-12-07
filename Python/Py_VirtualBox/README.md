# VBox_Install Python Script

This Python script automates the installation of VirtualBox and its dependencies on Linux systems.

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

## **Overview**

The VBox_Install.py script is designed to simplify the process of setting up VirtualBox on Linux systems. It ensures a complete installation, including:

- VirtualBox itself.
- Dependencies required for smooth operation.
- VirtualBox Extension Pack for version 6.1.38.
- Adding VirtualBox to GNOME's favorites for quick access.

This tool is ideal for developers, testers, and users seeking a hassle-free way to deploy VirtualBox.

## **Features**

- Automated Installation:
  - Installs VirtualBox and its dependencies using the system's package manager.

- Extension Pack Setup:
  - Automatically downloads and installs the Extension Pack (version 6.1.38) for enhanced VirtualBox functionality.

- GNOME Favorites Integration:
  - Adds VirtualBox to GNOME's favorites menu for easier access.

## Prerequisites

1. Operating System:

- Linux system with apt package management (e.g., Ubuntu).

1. Python 3.x:

- Ensure Python 3 is installed. Check with:

  ```bash
  python3 --version
  ```

  - Install Python 3 if missing:

    ```bash
    sudo apt update
    sudo apt install python3
    ```

1. sudo Privileges:

- The script requires administrative privileges to manage system packages.

1. GNOME Shell:

- The GNOME desktop environment is necessary for the favorites integration feature.

## **Usage**

1. Download the Script:

- Clone the repository or download the VBox_Install.py file to your local machine.

1. Set Permissions:

- Make the script executable:

   ```bash
   chmod +x VBox_Install.py
   ```

1.Run the Script:

- Execute the script with:

   ```bash
   sudo ./VBox_Install.py
   ```

## **Script Workflow**

1. Dependency Check:

- Verifies if required dependencies, such as wget and apt, are available.

1. VirtualBox Installation:

- Installs VirtualBox using the apt package manager.

1. Extension Pack Installation:

- Downloads the VirtualBox Extension Pack (version 6.1.38) and installs it.

1. Favorites Integration:

- Adds VirtualBox to GNOME's favorites menu for quicker access.


## **Output**

The script provides real-time feedback, including:

Confirmation of VirtualBox installation.
Extension Pack download and installation progress.
Success or error messages for each step.
Example Output:

  ```bash
  Checking dependencies...
  Installing VirtualBox...
  VirtualBox installed successfully.
  Downloading VirtualBox Extension Pack (version 6.1.38)...
  Extension Pack installed successfully.
  Adding VirtualBox to GNOME favorites...
  Setup complete! VirtualBox is ready to use.
  ```

## **Compatibility**

- Operating Systems:

  - Compatible with Ubuntu 18.04, 20.04, 22.04, and other Linux distributions using apt for package management.

- Desktop Environment:
  - GNOME Shell is required for the favorites menu integration feature.

## Notes

- Internet Connection:
  - Ensure an active internet connection as the script downloads packages and files.

- Extension Pack Version:
  - The script installs the Extension Pack for VirtualBox version 6.1.38. Update the URL in the script for newer versions if needed.

- Error Handling:
  - The script includes basic error handling but should be reviewed and tested before use on production systems.

## **Contribution**

Your contributions can make these scripts even better:

1. Fork the repository.
1. Create a new branch:

  ```bash
  git checkout -b my-awesome-feature
  ```

1. Make your invaluable changes.
1. Commit your changes:

  ```bash
  git commit -am 'Added some amazing features'
  ```

1. Push to the branch:

  ```bash
  git push origin my-awesome-feature
  ```

1. Create a new Pull Request targeting the Python directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
