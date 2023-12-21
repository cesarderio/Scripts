# System Information Script (Bash)

This README provides comprehensive details about the `SystemInfo.sh` bash script, which leverages `lshw` to display information on various system components.

## **Table of Contents**

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Features](#features)
- [Contributions](#contributions)

## **Overview**

The `SystemInfo.sh` bash script is designed to fetch and display key details about the system's name, CPU, RAM, display adapter, and network adapter.

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

## **Features**

The script provides detailed information about the following system components:

- **System Name**
- **CPU**: Displays details of the CPU, excluding specific technical parameters.
- **RAM**: Shows key details about the system's memory.
- **Display Adapter**: Fetches information about the system's display hardware.
- **Network Adapter**: Gathers details about the system's network interfaces.

## **Contributions**

Contributions, feedback, and improvements are most welcome! Whether it's through pull requests for features or by reporting bugs, your collaboration is appreciated!
