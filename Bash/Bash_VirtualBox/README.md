# VBox_Install

**Author**: Raphael Chookagian
**Date of latest revision**: 10/05/2023

## Description

The `VBox_Install` scripts, `VBox6_Install` and `VBox7_Install`, automate the installation of VirtualBox on Linux systems. Choose between version 6 and the newer version 7. Each script installs the respective version of VirtualBox,as well as fetching and installing the corresponding extension pack. To enhance usability, the scripts ensure that VirtualBox is conveniently placed in the dock/desktop as a favorite application, making it easily accessible for the user.

## Prerequisites

1. **Operating System**: The script is designed to work on Linux systems with apt package management (like Ubuntu).
2. **GNOME Shell**: For the functionality to add VirtualBox to the favorites, a GNOME shell environment is necessary.
3. **sudo privileges**: The script requires sudo privileges to install packages and manage the system.

## Installation Instructions

1. Clone the repository or download the `VBox6_Install.sh` or `VBox7_Install.sh` script.
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

1. Create a new Pull Request targeting the Bash directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
