# Windows Virtual Box Installation PowerShell Script

**Author**: Raphael Chookagian
**Date of latest revision**: 10/05/2023

## Description

The `Win_VBox_Install` script, written in PowerShell, automates the process of installing VirtualBox on a Windows system. Before the installation begins, the script checks for the presence of Chocolatey on the system and installs it if necessary. Following this, the script fetches and installs the VirtualBox extension pack for version 6.1.38.

## Prerequisites

1. **Operating System**: Windows with PowerShell.

## Installation and Execution Instructions

1. Download the `Win_VBox_Install.ps1` script.
2. Open a PowerShell session as Administrator.
3. Navigate to the directory containing the script.
4. Execute the script:

   ```powershell
   .\Win_VBox_Install.ps1
   ```

## Features

- Checks for the presence of Chocolatey and installs it if missing.
- Automated installation of the latest VirtualBox available via Chocolatey.
- Downloads and installs the VirtualBox extension pack (version 6.1.38).

## Notes

- Ensure you have an active internet connection when running the script.
- If a different version of the VirtualBox extension pack is required, modifications to the script will be needed.
- The script adjusts the execution policy temporarily to install Chocolatey; it's restored afterward.






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

- Create a new Pull Request targeting the Windows directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
