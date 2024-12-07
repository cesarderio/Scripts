# System Information Script (Bash)

This README provides comprehensive details about the `SystemInfo.sh` bash script, which leverages `lshw` to display information on various system components.

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

The `SystemInfo.sh` bash script is designed to fetch and display key details about the system's name, CPU, RAM, display adapter, and network adapter.

## **Features**

The script provides detailed information about the following system components:

- **System Name**
- **CPU**: Displays details of the CPU, excluding specific technical parameters.
- **RAM**: Shows key details about the system's memory.
- **Display Adapter**: Fetches information about the system's display hardware.
- **Network Adapter**: Gathers details about the system's network interfaces.

## **Prerequisites**

- A Linux-based system.
- Bash shell.
- `lshw` tool installed. It can typically be installed using package managers like `apt` or `yum` (`sudo apt install lshw`).
- Sufficient permissions to execute `sudo` commands.

## **Usage**

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions:

    ```bash
    chmod +x SystemInfo.sh
    ```

4. Run the script with:

    ```bash
    ./SystemInfo.sh
    ```

## **Script Workflow**

## **Output**

## **Compatibility**

## Notes



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
