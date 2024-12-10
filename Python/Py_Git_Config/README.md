# Git Configuration Python Script for Ubuntu

This README provides a comprehensive guide for a Python script designed to manage Git installations and configurations on Ubuntu systems.

<br>

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

<br>

## **Overview**

This Python script provides a streamlined way to manage Git on Ubuntu systems. It automates:

- Verifying if Git is installed.

- Installing Git if it's missing or upgrading it if requested.

- Configuring Git with user-provided global settings, such as username and email.

This script is ideal for both new setups and maintaining an existing Git installation.

<br>

## **Features**

- Git Verification: Automatically checks if Git is installed.

- Installation/Upgrade: Installs Git if missing or prompts the user to upgrade an existing installation.

- Global Configuration: Prompts the user for their Git username and email to configure global settings.

- User-Friendly: Provides clear instructions and output at each step.

- Modular Workflow: Each stage of the process can be customized or extended.

<br>

## **Prerequisites**

1. Ubuntu System:

- The script is designed specifically for Ubuntu and may require modifications for other Linux distributions.

1. Python3:

- Check if Python 3 is installed:

  ```bash
  python3 --version
  ```

- Install Python 3 if not available:

  ```bash
  sudo apt update
  sudo apt install python3
  ```

1. sudo Privileges:

- Ensure the user running the script has sufficient privileges for package management tasks.


<br>

## **Usage**

1. Prepare the Script:

- Save the script as Git_Config.py in a directory of your choice.

1. Set Execute Permissions:

- Make the script executable:

  ```bash
  chmod +x Git_Config.py
  ```

1. Run the Script:

- Execute the script using:

  ```bash
  sudo ./Git_Config.py
  ```

or:

  ```bash
  sudo python3 Git_Config.py
  ```

1. Follow Prompts:

- The script will guide you through verifying, installing, upgrading, and configuring Git.

<br>

## **Script Workflow**

1. Verify Git Installation:

- The script checks if Git is installed by running:

  ```bash
  git --version
  ```


1. Install or Upgrade Git:

- If Git is not installed:
  - The script installs it using apt.

- If Git is already installed:
  - The user is prompted whether to upgrade to the latest version.

1. Configure Git:

- The script asks for the user's GitHub username and email.

- These details are used to set Git's global configuration:

  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```

<br>

## **Output**

The script provides real-time feedback during execution, including:

- Confirmation of Git's current version or its installation/upgrade.

- Confirmation of successful Git configuration, with a display of the configured username and email.

Example output:

  ```yaml
  Git is not installed. Installing Git...
  Git has been successfully installed: version 2.x.x
  Enter your GitHub username: JohnDoe
  Enter your GitHub email: john.doe@example.com
  Git has been configured successfully:
      Username: JohnDoe
      Email: john.doe@example.com
  ```

<br>

## **Compatibility**

- Operating System:
  - This script is designed for Ubuntu 18.04 and later. While it may work on other Linux distributions, some commands might need adjustments.
- Git Versions:
  - Compatible with all stable versions of Git available in the Ubuntu repositories.

<br>

## **Notes**

- Backup Configuration:
  -If you are upgrading Git, back up your .gitconfig file to avoid overwriting any custom settings.

- Error Handling:
  - The script includes basic error handling and will exit with a message if any step fails (e.g., missing sudo privileges or network issues).

- Extensibility:
  - The script can be extended to include additional Git configurations or post-installation steps, such as SSH key setup.

<br>

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

- Create a new Pull Request targeting the Python directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

<br>

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.

