# Git Configuration Bash Script for Ubuntu

This README provides detailed information about the Git_Config.sh bash script for Ubuntu systems. The script automates the process of verifying the presence of Git, installing it if absent, offering update/upgrade options if already present, and configuring Git with the user's specified username and email.

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

The Git_Config.sh Bash script simplifies Git setup and configuration on Ubuntu systems. It ensures that Git is installed and up-to-date, and guides the user through configuring Git with a username and email for version control.
<!-- The `Git_Config.sh` bash script automates the following processes:

1. Verifies if Git is installed on the system.
2. If Git is installed, it provides the user with an option to update or upgrade it using the `apt` package manager.
3. If Git is not present, it installs Git using the `apt` package manager.
4. Configures Git with a username and email based on user input. -->

## **Features**

- Automated Git Installation:
  - Checks if Git is installed on the system.
  - Installs Git if it is not already present.
- Update/Upgrade Option:
  - Prompts the user to update or upgrade Git if it is already installed.
- Global Git Configuration:
  - Prompts the user to set their Git username and email for global configuration.
- User-Friendly Prompts:
  - Guides the user with clear, step-by-step instructions.
- Error Handling:
  - Provides meaningful messages for issues such as missing privileges or incompatible environments.

## **Prerequisites**

- System Requirements:
  - Ubuntu or an Ubuntu-based distribution.
- Permissions:
  - Superuser privileges (sudo) to install or update Git.
- Tools:
  - The apt package manager (used for installing/updating Git).

## **Usage**

1. Download the script:

- Save the script as Git_Config.sh in a directory of your choice.

1. Set executable permissions:

- Open a terminal and run:

  ```bash
  chmod +x Git_Config.sh
  ```

1. Run the script:

- Confirm you are in the directory where the script is located.
- Execute the script with:

  ```bash
  ./Git_Config.sh
  ```

1. Follow the prompts:

- If Git is already installed, decide whether to update or upgrade it.
- If Git is not installed, the script will automatically install it.
- Provide your Git username and email when prompted to configure Git globally.

1. Verify setup:

- After the script completes, run the following commands to verify your configuration:

  ```bash
  git config --global user.name
  git config --global user.email
  ```

## **Script Workflow**

1. Check for Git:

- Uses which git to determine if Git is installed.
- If not installed, it executes:

  ```bash
  sudo apt update && sudo apt install git -y
  ```

1. Update or Upgrade Git:

- If Git is installed, the script offers options to:
  -Update Git (refresh existing version).
  - Upgrade Git (install a newer version, if available).

1. Global Configuration:

- Prompts the user to enter their Git username and email.
Executes:

  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "youremail@example.com"
  ```

1. Confirmation:

- Displays a success message and suggests verifying the configuration.

## **Output**

- During execution:
  - Messages indicating:
    -Whether Git is installed.
    -Progress of the installation/update process.
    -Successful configuration of Git username and email.

- Resulting configuration:
- Saved globally in ~/.gitconfig. Example:

  ```bash
  [user]
    name = Your Name
    email = youremail@example.com
  ```

## **Compatibility**

- Supported Systems:
  - Ubuntu 18.04 and later.
  - Ubuntu-based distributions (e.g., Linux Mint, Pop!_OS).

- Limitations:
  - The script relies on the apt package manager. It may not work on systems using other package managers like yum or dnf.

## **Notes**

- Superuser Privileges:
  - The script uses sudo for installing or updating Git. Ensure you have the necessary permissions.

- Overwrite Warning:
  - Running the script multiple times may overwrite existing Git configuration (~/.gitconfig).

- Customization:
  - You can modify the script to include additional Git configurations, such as setting up aliases or enabling credential caching.

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
