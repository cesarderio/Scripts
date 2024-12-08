# PowerShell System Information Script

Gather and display system information on a Windows machine.

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

This script uses PowerShell to query and display details about the system's hostname, CPU, RAM, display adapter, and network adapters. It utilizes the `Get-WmiObject` cmdlet, which is native to Windows, ensuring compatibility without the need for additional modules.

<br>

## **Features**


1. **Name**: Retrieves and displays the system's hostname.
2. **CPU**: Lists the name and details of the system's processor.
3. **RAM**: Provides the total physical memory of the system in GB.
4. **Display Adapter**: Lists the display adapters on the system.
5. **Network Adapter**: Shows all network adapters that have a connection ID.

<br>

## **Prerequisites**

<br>

## **Usage**

1. **Script File**: Save the provided script as a `.ps1` file, for instance, `SystemInfo.ps1`.
2. **Run with Elevated Privileges**: To execute the script, you'll need a PowerShell terminal opened with administrative privileges.
3. **Execution Policy**: If this is your first time running scripts in PowerShell, you might need to update the execution policy to allow the execution of unsigned scripts. You can do this with the following command:

   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

   Confirm by typing `Y` when prompted.
4. **Navigate to Script**: In your PowerShell terminal, navigate to the directory where you saved the script.
5. **Run the Script**: Execute the script by typing:

   ```powershell
   .\SystemInfo.ps1
   ```

<br>

## **Script Workflow**

<br>

## **Output**




<br>

## **Compatibility**



<br>

## **Notes**

The script uses the `Get-WmiObject` cmdlet from PowerShell to fetch various system details. This cmdlet is natively supported on Windows platforms, ensuring you can run the script without any additional installations.

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

- Create a new Pull Request targeting the Windows directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.


<br>

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
