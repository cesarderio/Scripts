# Google Chrome Initialization Script for Linux (Python Version)

This README provides an overview and instructions for the Python script tailored to automate the installation and configuration of Google Chrome on Linux systems.

## **Table of Contents**

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Workflow](#script-workflow)
- [Error Handling](#error-handling)
- [Contributions](#contributions)

## **Overview**

The `Chrome Initialization (Python Version)` script enables a streamlined installation of Google Chrome on Linux, sets it as the default browser, and adds it to GNOME favorites if applicable.

## **Prerequisites**

- A Linux machine.
- Python 3.x installed.
- Sufficient privileges to execute `sudo` commands.
- Connectivity to the internet to fetch the packages and signing keys.

## **Usage**

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions: `chmod +x ChromInit.py`.
4. Run the script with superuser permissions: `sudo ./ChromInit.py` or `sudo python3 ChromInit.py`.

## **Script Workflow**

1. **Install Prerequisites**: Updates the repositories and installs essential packages.
2. **Google Chrome Repository Setup**:
    - Checks if the Google Chrome signing key is already added.
    - Downloads and adds the Google Chrome signing key.
    - Adds the Google Chrome repository.
3. **Google Chrome Installation**: Installs the stable version of Google Chrome.
4. **Default Browser Configuration**: Sets Google Chrome as the system's default web browser.
5. **GNOME Favorites Addition**: Detects if GNOME is installed and adds Google Chrome to the favorites.

## **Error Handling**

The script has built-in checks after major steps. In the event of any errors, the script will display an error message and exit, preventing further potential issues.

## **Contributions**

Feel free to contribute, open issues, or suggest improvements. Collaboration is always appreciated!
