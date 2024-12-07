# Git Configuration Python Script for Ubuntu

This README provides a comprehensive guide for a Python script designed to manage Git installations and configurations on Ubuntu systems.

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

The script is a Python-based translation of a bash script originally tailored for Ubuntu. It handles:

- Verification of Git's presence on the system.
- Git installation or upgrade as needed.
- Git global configuration using user inputs.

## **Features**

## **Prerequisites**

- Ubuntu system.
- Python3 installed.
- `sudo` privileges for package management tasks.

## **Usage**

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions: `chmod +x Git_Config.py`.
4. Run the script: `./Git_Config.py` or `python3 Git_Config.py`.

## **Script Workflow**

1. **Git Verification**: The script first ascertains if Git is installed.
2. **Git Installation/Upgrade**:
    - If Git isn't found, the script proceeds to install it.
    - If Git is detected, the user is prompted for an upgrade choice.
3. **Git Configuration**: The user is queried for their GitHub username and email, which are then used to globally set up Git.

## **Output**

## **Compatibility**

## **Notes**

- Before running the script, make sure you have `sudo` privileges as some commands within the script require it.
- Always take precautions like backups before making major changes to your system or installing new software.

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

1. Create a new Pull Request targeting the Python directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## Author

- **Raphael Chookagian**

## Date of Latest Revision

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
