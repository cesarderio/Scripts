# VBox_Install

This script automates the installation of VirtualBox on Linux systems, with options for both version 6 and version 7. It installs the selected version, downloads the necessary extension pack, and adds VirtualBox to the GNOME shell favorites for easy access.

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

The `VBox_Install` scripts, `VBox6_Install` and `VBox7_Install`, automate the installation of VirtualBox on Linux systems. Choose between version 6 and the newer version 7. Each script installs the respective version of VirtualBox,as well as fetching and installing the corresponding extension pack. To enhance usability, the scripts ensure that VirtualBox is conveniently placed in the dock/desktop as a favorite application, making it easily accessible for the user.

## **Features**

- Automated installation of the latest VirtualBox available in the repository.
- Downloads and installs the VirtualBox extension pack (version 6.1.38).
- Adds VirtualBox to the favorites in the GNOME shell for quick access.

## **Prerequisites**

- **Operating System**: The script is designed to work on Linux systems with apt package management (like Ubuntu).

- **GNOME Shell**: For the functionality to add VirtualBox to the favorites, a GNOME shell environment is necessary.

- **sudo privileges**: The script requires sudo privileges to install packages and manage the system.

## **Usage**

- Clone the repository or download the `VBox6_Install.sh` or `VBox7_Install.sh` script.

- Provide execution permissions:

    ```bash
    chmod +x VBox_Install.sh
    ```

- Execute the script:

    ```bash
    ./VBox_Install.sh
    ```

## **Script Workflow**

- Install VirtualBox: The script installs the selected version of VirtualBox from the repository.

- Install Extension Pack: The corresponding extension pack (currently version 6.1.38) is downloaded and installed.

- Add to GNOME Shell Favorites: VirtualBox is added to the GNOME shell favorites for easy access.

## **Output**

The script provides logs of its actions during execution, showing the progress of installations and configurations. Any errors or issues will be displayed in the terminal output.

## **Compatibility**

- This script is compatible with Linux distributions using apt (such as Ubuntu).

- GNOME Shell is required for adding VirtualBox to favorites.

- The extension pack is currently installed for version 6.1.38. Adjustments will be needed to install different versions.

## Notes

- Ensure that you have internet connectivity when running the script, as it needs to download packages.

- The script currently installs the VirtualBox extension pack for version 6.1.38. If you need a different version, you'll need to modify the script accordingly.

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

