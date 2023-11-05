# Git Configuration Python Script for Ubuntu

This README provides a comprehensive guide for a Python script designed to manage Git installations and configurations on Ubuntu systems.

## **Table of Contents**

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Flow](#script-flow)
- [Notes](#notes)
- [Contributions](#contributions)

## **Overview**

The script is a Python-based translation of a bash script originally tailored for Ubuntu. It handles:

- Verification of Git's presence on the system.
- Git installation or upgrade as needed.
- Git global configuration using user inputs.

## **Prerequisites**

- Ubuntu system.
- Python3 installed.
- `sudo` privileges for package management tasks.

## **Usage**

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions: `chmod +x Git_Config.py`.
4. Run the script: `./Git_Config.py` or `python3 Git_Config.py`.

## **Script Flow**

1. **Git Verification**: The script first ascertains if Git is installed.
2. **Git Installation/Upgrade**:
    - If Git isn't found, the script proceeds to install it.
    - If Git is detected, the user is prompted for an upgrade choice.
3. **Git Configuration**: The user is queried for their GitHub username and email, which are then used to globally set up Git.

## **Notes**

- Before running the script, make sure you have `sudo` privileges as some commands within the script require it.
- Always take precautions like backups before making major changes to your system or installing new software.

## **Contributions**

Feel free to contribute, open issues, or suggest improvements. Collaboration is always welcomed!
