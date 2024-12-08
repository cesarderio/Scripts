# Automated Setup Script for Code Fellows OPS Course Lab Kit PC

This script offers a seamless approach to setting up the lab kit PC required for the Code Fellows OPS Course. By automating the entire process, users can bypass the manual steps, having everything set up with a single execution of this script.

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

The `Ubuntu_Init.sh` script automates the setup process for the Code Fellows OPS Course Lab Kit PC, covering installation of essential software and configuration tasks.

## **Features**

1. **System Update**: Prioritizes the system's health by ensuring all system packages are up-to-date.
2. **SSH**: Installs Secure Shell (SSH) for encrypted remote operations.
3. **XRDP**: Sets up XRDP, an essential Remote Desktop Protocol (RDP) server, paving the way for remote desktop access.
4. **VS Code**: Deploys Microsoft's Visual Studio Code, a leading code editor.
5. **Git**: Ensures Git's presence, installs if absent, and facilitates its configuration with user details.
6. **Google Chrome**: Handles the download, installation, and default setting of the Chrome browser.
7. **VirtualBox**: Onboards VirtualBox, a comprehensive virtualization tool, and its essential Extension Pack.
8. **Gnome Tweaks**: Customizes the Gnome desktop environment to enhance user experience.
9. **PolicyKit**: Verifies the presence of PolicyKit (polkit) and takes care of its installation if missing.

## **Prerequisites**

- A Linux-based system, preferably Ubuntu.
- Bash shell (default on most Linux systems).
- Internet connection for downloading packages and dependencies.
- Sudo access to execute the script with administrative privileges.

## **Usage**

1. **Download**: Secure the script onto your system.

1. **Permission**: Bestow the script with execute permissions:

  ```bash
  chmod +x Ubuntu_Init.sh   # use `sudo` for permissions.
  ```

1. **Execute**: Initiate the script with:

  ```bash
  ./Ubuntu_Init.sh
  ```

> **Note**: Due to the nature of operations, the script may request `sudo` privileges, prompting users for their password.


## **Script Workflow**

1. System Update: The script begins by updating system packages to ensure your system is current.

1. Software Installation: It proceeds to install and configure necessary software, including SSH, XRDP, Git, Google Chrome, VirtualBox, and more.

1. Configuration: The script configures each installed tool, such as setting Google Chrome as the default browser and customizing Gnome Tweaks.

1. Finalization: Once all steps are completed, the system is fully configured for the Code Fellows OPS course environment.

## **Output**

The script will output logs and status updates during the execution process. Users will see confirmation messages for each software installation and configuration step, along with any potential errors or warnings.

## **Compatibility**

- The script is designed for Ubuntu and should work with most versions of Ubuntu and other Debian-based systems.

- It requires sudo privileges for installation of some packages.

- The script may not be fully compatible with non-Debian-based distributions (e.g., Fedora, Arch).


## **Notes**

- Ensure that your system is connected to the internet, as the script will need to download several packages.

- The script may take some time to complete, depending on the system’s performance and internet speed.

- It’s recommended to run the script on a clean installation to avoid conflicts with pre-installed software.

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

## Credits

All credit for the foundational steps and configurations goes to [Code Fellows](https://www.codefellows.org/). Their detailed guide was the blueprint for this automation. For an in-depth understanding and context of each step, users are recommended to explore the original guide by Code Fellows.
