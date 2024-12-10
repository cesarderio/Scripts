# Google Chrome Initialization Script for Linux (Python Version)

This README provides an overview and instructions for the Python script tailored to automate the installation and configuration of Google Chrome on Linux systems.

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

The `Chrome Initialization (Python Version)` script enables a streamlined installation of Google Chrome on Linux, sets it as the default browser, and adds it to GNOME favorites if applicable.

<br>

## **Features**

- Automated Google Chrome Installation:
  - Installs the stable version of Google Chrome after setting up the necessary repository and key.
- Default Browser Setup:
  - Configures Google Chrome as the system's default web browser.
- GNOME Integration:
  - Adds Google Chrome to GNOME favorites if GNOME is detected on the system.
- Error Handling:
  - Detects and handles errors during installation, repository setup, or configuration.
- System Compatibility Check:
  -Ensures the system supports Google Chrome installation by validating prerequisites.

<br>

## **Prerequisites**

- System Requirements:
  - Linux distribution (Debian/Ubuntu-based preferred).
- Tools & Permissions:
  - Python 3.x installed.
  - Superuser privileges (sudo) to execute commands requiring elevated permissions.
- Internet Connectivity:
  - Required to fetch Google Chrome packages and signing keys.

<br>

## **Usage**

1. Prepare the Script:

- Save the script as ChromInit.py in your working directory.

1. Set Permissions:

- Open a terminal and run:

  ```bash
  chmod +x ChromInit.py
  ```

1. Run the Script:

- Execute the script with superuser permissions:

  ```bash
  sudo ./ChromInit.py
  ```

or

  ```bash
  sudo python3 ChromInit.py
  ```

1. Follow On-Screen Instructions:

- The script will guide you through the process, displaying success or error messages after each step.

<br>

## **Script Workflow**

1. **Install Prerequisites**:

- Updates the repositories and installs essential packages.

1. **Google Chrome Repository Setup**:

- Checks if the Google Chrome signing key is already added.
- Downloads and adds the Google Chrome signing key.
- Configures the Google Chrome repository (/etc/apt/sources.list.d/).

1. **Google Chrome Installation**:

- Installs the stable version of Google Chrome.

1. **Default Browser Configuration**:

- Sets Google Chrome as the system's default web browser.

1. **GNOME Favorites Addition**:

- Detects if GNOME is installed and adds Google Chrome to the favorites.

<br>

## **Output**

- During Execution:
  - Status messages indicating the progress of installation and configuration steps.
  - Warnings or error messages if any step fails.
-Post-Execution:
  - Google Chrome installed and configured as the default browser.
  - Chrome icon added to GNOME favorites (if applicable).
-Log File:
  - Optionally, a log file can be generated for troubleshooting (modify the script to enable logging if needed).

<br>

## **Compatibility**

- Supported Distributions:
  - Debian-based distributions such as Ubuntu, Linux Mint, and Pop!_OS.

- Limitations:
  - The script relies on apt and GNOME-specific commands, which may not work on other package managers or desktop environments without modification.

<br>

## **Notes**

- Superuser Privileges:
  - Running the script as sudo is mandatory for repository setup and package installation.
- Manual Adjustments:
  - If using a non-GNOME desktop environment, Chrome may not automatically appear in favorites; manual configuration may be required.
- Custom Configuration:
  - You can modify the script to adjust Chrome settings, such as enabling extensions or disabling telemetry.

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

