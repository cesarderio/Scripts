# Linux Update Script

This script is designed for efficiently updating, upgrading, and maintaining the package system on Linux. It includes features like logging, error handling, user confirmation for upgrades, and cleanup of the local package repository.

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

## Overview

The `sys_update.sh` script automates the following tasks in a Linux environment:

- Updates the package lists from repositories.
- Upgrades all the installed packages to their latest versions.
- Removes unnecessary packages (autoremove).
- Cleans up the local repository of retrieved package files.

<br>

## **Features**

- **Logging**: Records all operations in a log file, aiding in audit and troubleshooting.
- **User Confirmation**: Prompts for user confirmation before proceeding with potentially disruptive operations like package upgrades.
- **Error Handling**: Monitors the success of operations and logs any failures, ensuring reliability.
- **Repository Cleanup**: Includes a step to clean up the local repository, helping in managing disk space efficiently.

<br>

## **Prerequisites**

- A Linux-based system with `apt` package manager (Debian, Ubuntu, or derivatives).
- Superuser privileges (for executing `sudo` commands within the script).

<br>

## **Usage**

1. Open a terminal window.
2. Navigate to the directory containing the `sys_update.sh`.
3. Give execute permissions to the script: `chmod +x sys_update.sh`.
4. Run the script: `sudo ./sys_update.sh`.
5. Follow the on-screen instructions, especially for upgrade confirmations.

<br>

## **Script Workflow**

1. The script starts by updating the package lists to fetch the latest versions available in the repositories.
2. It then prompts the user for confirmation to proceed with upgrading all installed packages.
3. The script performs an autoremove operation to clean up any unnecessary packages.
4. Finally, it cleans the local repository of downloaded package files.

<br>

## **Output**

- The activities and outcomes of the script are logged in `/var/log/linux_update_script.log`.
- Users can refer to this log file for detailed information about each operation performed by the script.

<br>

## **Compatibility**

The script has been tested on:

- Linux:
  -Compatible with most distributions (e.g., Ubuntu, Debian, Fedora).

<br>

## Notes

- It's important to run the script with sufficient privileges as it uses `sudo` commands for package management.
- Ensure to understand the implications of upgrading packages and cleaning up the repository, as these actions can affect system stability and functionality.
- The script is tailored for systems using the `apt` package manager. If you're using a different Linux distribution with another package manager, the script will need modifications.
- Always backup important data before running scripts that make system-wide changes.

This script streamlines the process of maintaining and updating a Linux system, making it a valuable tool for system administrators and users alike.

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

- Create a new Pull Request targeting the Bash directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

<br>

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
