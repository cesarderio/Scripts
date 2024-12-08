# SSH & RDP Setup Bash Script

This script facilitates the installation and configuration of SSH and RDP (xrdp), and sets up the GNOME Terminal to start automatically on system startup.

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

The `SSH_RDP.sh` bash script simplifies the following processes:

- Installs SSH and XRDP if they are not already installed on the system.
- Configures XRDP for optimal performance with Ubuntu's GNOME desktop environment.
- Automatically enables XRDP to start on system boot.
- Configures GNOME to disable the screensaver lock and sets up the GNOME Terminal to launch on startup.

## **Features**

- Installs and configures SSH and XRDP.
- Configures XRDP for Ubuntu's GNOME desktop.
- Disables the screensaver lock for smoother remote access.
- Sets GNOME Terminal to auto-start on login.
- Makes the script idempotent (can be run multiple times without adverse effects).

## **Prerequisites**

- Ubuntu system (preferably the latest version for best compatibility).
- Superuser privileges (for executing `sudo` commands within the script).

## **Usage**

- Open a terminal window.

- Navigate to the directory where `SSH_RDP.sh` is located.

- Give execute permissions to the script:

    ```bash
    chmod +x SSH_RDP.sh
    ```

- Execute the script:

    ```bash
    ./SSH_RDP.sh
    ```

- The script will run through the installation and configuration process, providing feedback and prompts as necessary.

## **Script Workflow**

- System Update:

  - The script begins by updating the system packages and upgrading them if necessary.

- Dependency Check:

  - It then checks for the presence of SSH and XRDP, installing them if they are not found.

- XRDP Configuration:

  - XRDP is configured to work seamlessly with Ubuntu's GNOME desktop environment.

  - The script sets up policy kit rules to enhance functionality and the user experience with XRDP.

- GNOME Customization:

  - Disables the screensaver lock to avoid interruptions in remote sessions.
  - Configures GNOME Terminal to launch automatically on startup.

- Finalization:

  - XRDP is enabled to start automatically on system boot.
  - The script provides a summary of the completed tasks.

## **Output**

- During the script execution, feedback will be provided to the user.
- Upon completion, the script logs the installation steps, configuration, and any potential errors.

## **Compatibility**

- This script is tailored for Ubuntu systems.
- Some features may work on other Debian-based distributions, but full compatibility is not guaranteed.
- The script has been tested primarily on GNOME desktop environments.

## **Notes**

- Ensure that you have administrative privileges as the script requires `sudo` access for various operations.
- The script is designed to be idempotent, meaning it can be safely run multiple times without causing unintended side effects.
- The script provides clear feedback during each step, enhancing the user experience and making it easier to track the setup progress.
- It's recommended to review and understand the script before running it, especially in a production environment.
- While this script is tailored for Ubuntu, some features might work on other Debian-based distributions, but full compatibility is not guaranteed.
- Always back up important data before running scripts that make significant changes to your system.

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
