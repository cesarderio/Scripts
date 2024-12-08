# System Information Script (Bash)

This README provides comprehensive details about the `SystemInfo.sh` bash script, which leverages `lshw` to display information on various system components.

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

The `SystemInfo.sh` bash script is designed to fetch and display key details about the system's name, CPU, RAM, display adapter, and network adapter using the `lshw` tool.

<br>

## **Features**

The script provides detailed information about the following system components:

- **System Name**
- **CPU**: Displays details of the CPU, excluding specific technical parameters.
- **RAM**: Shows key details about the system's memory.
- **Display Adapter**: Fetches information about the system's display hardware.
- **Network Adapter**: Gathers details about the system's network interfaces.

<br>

## **Prerequisites**

- A Linux-based system (Ubuntu, Fedora, Debian, etc.).

- Bash shell (default on most Linux systems).

- `lshw` tool installed. You can install it using your package manager:

  ```bash
  sudo apt install lshw   # On Debian-based systems
  sudo yum install lshw   # On RHEL-based systems
  ```

- Sufficient permissions to execute sudo commands.

- A Linux-based system.
- Bash shell.
- `lshw` tool installed. It can typically be installed using package managers like `apt` or `yum` (`sudo apt install lshw`).
- Sufficient permissions to execute `sudo` commands.

<br>

## **Usage**

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions:

    ```bash
    sudo chmod +x SystemInfo.sh
    ```

4. Run the script with:

    ```bash
    ./SystemInfo.sh
    ```

<br>

## **Script Workflow**

- The script uses `lshw` to gather detailed hardware information.

- It extracts relevant details about the System Name, CPU, RAM, Display Adapter, and Network Adapter.

- The gathered data is formatted and displayed in a user-friendly format on the terminal.

<br>

## **Output**

The output will be displayed in the terminal and will include key system information like:

- System name (e.g., hostname).
- CPU details: model, number of cores, speed.
- RAM usage: total, used, free memory.
- Display Adapter information: graphics hardware details.
- Network Adapter details: Ethernet or Wi-Fi interface details.

<br>

## **Compatibility**

- The script is compatible with most Linux-based systems (e.g., Ubuntu, Debian, Fedora).
- It requires the lshw tool, which is available on most Linux distributions.
- The script has been tested on Ubuntu but should work on other distributions with lshw installed.

<br>

## Notes

- `lshw` requires `sudo` permissions to fetch detailed hardware information, so the script will prompt for `sudo` access.
- The script provides a clean, simple overview of your system's hardware.
- Always ensure the script has been reviewed before running it on production systems to avoid unintentional issues.

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
