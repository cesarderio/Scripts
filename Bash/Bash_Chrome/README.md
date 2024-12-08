# Google Chrome Initialization Script for Linux

This README provides an overview and instructions for a bash script tailored to manage the installation and configuration of Google Chrome on Linux systems.

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

The `Chrome Initialization` bash script facilitates the automated process of installing Google Chrome on Linux, setting it as the default browser, and adding it to GNOME favorites if applicable.

## **Features**

- Automates Google Chrome installation.
- Configures Google Chrome as the default web browser.
- Adds Google Chrome to GNOME favorites if GNOME is detected.
- Handles installation prerequisites like updating repositories and adding necessary keys.

## **Prerequisites**

- A Linux machine.
- Sufficient privileges to execute `sudo` commands.
- Connectivity to the internet to fetch the packages and signing keys.

## **Usage**

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions: `chmod +x ChromeInit.sh`.
4. Run the script: `./ChromeInit.sh`.

## **Script Workflow**

1. **Install Prerequisites**: Prepares the system by updating the repositories and installing essential packages.
2. **Google Chrome Repository Setup**:
    - Downloads the Google Chrome signing key and adds it to the system's keyring.
    - Adds the Google Chrome repository to the system's source list.
3. **Google Chrome Installation**: Installs the stable version of Google Chrome.
4. **Default Browser Configuration**: Configures Google Chrome as the system's default web browser.
5. **GNOME Favorites Addition**: If GNOME is detected, the script will add Google Chrome to the favorites.

## **Output**

- Success messages indicating the script's progress (e.g., "Google Chrome installed successfully").
- Error messages if any step fails (e.g., "Failed to add Google Chrome repository").
- If GNOME is detected, a message confirming that Google Chrome was added to the GNOME favorites.

## **Compatibility**

The script contains built-in checks after crucial steps. In case of any errors during these stages, the script will notify the user and exit to prevent potential subsequent issues.

## **Notes**

- The script assumes the user is using a 64-bit Linux system.
- GNOME desktop environment is required for the "Add to GNOME favorites" step.
- If you're using a non-Debian-based Linux distribution, modifications might be necessary to accommodate package managers.


## **Contribution**

Your contributions can make these scripts even better:

1. Fork the repository.

2. Create a new branch:

  ```bash
  git checkout -b my-awesome-feature
  ```

3. Make your invaluable changes.

4. Commit your changes:

  ```bash
  git commit -am 'Added some amazing features'
  ```

5. Push to the branch:

  ```bash
  git push origin my-awesome-feature
  ```

6. Create a new Pull Request targeting the Bash directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
