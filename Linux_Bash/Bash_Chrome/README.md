# Google Chrome Initialization Script for Linux

This README provides an overview and instructions for a bash script tailored to manage the installation and configuration of Google Chrome on Linux systems.

## **Table of Contents**

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Workflow](#script-workflow)
- [Error Handling](#error-handling)
- [Contributions](#contributions)

## **Overview**

The `Chrome Initialization` bash script facilitates the automated process of installing Google Chrome on Linux, setting it as the default browser, and adding it to GNOME favorites if applicable.

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

## **Error Handling**

The script contains built-in checks after crucial steps. In case of any errors during these stages, the script will notify the user and exit to prevent potential subsequent issues.

## **Contributions**

Feel free to contribute, open issues, or suggest improvements. Collaboration is always appreciated!
