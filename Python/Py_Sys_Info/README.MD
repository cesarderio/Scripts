# Python System Information Script

This README provides an overview of the Python System Information Script, which utilizes the lshw utility to gather and display detailed hardware information about the system.

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

The Python System Information Script provides detailed insights about various components of the system using the `lshw` utility. It displays information on the following:

- Machine Name
- CPU
- RAM
- Display Adapter
- Network Adapter

## **Features**

- Detailed System Information:
  - Retrieves and displays comprehensive hardware details.

- Automated Execution:
  - Runs necessary lshw commands within a Python script, saving time and effort.

- Easy to Use:
  - No manual input required; simply execute the script.

- Customizable:
  - The script can be easily modified to include additional hardware details or format the output.

## **Prerequisites**

1. **Python3**:  
   The script is written in Python 3.  
   - To check if you have Python3 installed:  

     ```bash
     python3 --version
     ```

   - To install Python3 on Ubuntu:  

     ```bash
     sudo apt update
     sudo apt install python3
     ```

2. **lshw Utility**:  
   The `lshw` utility collects and displays detailed information about the hardware configuration of the machine.  
   - To check if you have `lshw` installed:  

     ```bash
     lshw -version
     ```

   - To install `lshw` on Ubuntu:  

     ```bash
     sudo apt update
     sudo apt install lshw
     ```

3. **sudo**: Some commands in the script require sudo privileges. Ensure that the user running the script has the necessary permissions.

## **Usage**

1. Ensure you have the required permissions to execute the script:

   ```bash
   chmod +x /Py_Sys_Info.py
   ```

2. Run the script:

   ```bash
   ./Py_Sys_Info.py
   ```

## **Script Workflow**

- Dependency Check:
  - Ensures that lshw is installed on the system. If not, the script will display an error message.

- Hardware Information Collection:
  - Runs lshw commands to retrieve details about:
    - Machine name
    - CPU
    - RAM
    - Display adapter
    - Network adapter

- Data Parsing:
  - Extracts and organizes the output into a user-friendly format.

- Display Results:
  - Outputs the gathered information in the terminal for easy reference.


## **Output**

The script provides detailed information about:

- Machine Name:
  - Hostname of the machine.

- CPU Specifications:
  - Model, speed, and number of cores.

- RAM Details:
  - Total memory capacity and usage.

- Display Adapter:
  - GPU model and specifications.

- Network Adapter:
  - Details of all network interfaces.

Example output:

  ```yaml
  Machine Name: my-laptop
  CPU: Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz
  RAM: 16 GB
  Display Adapter: NVIDIA GeForce GTX 1660 Ti
  Network Adapter: Intel Wireless-AC 9560
  ```

## **Compatibility**

- Supported Systems:
  - The script is compatible with Linux distributions that support lshw, such as Ubuntu, Debian, and their derivatives.

- Desktop Environments:
  - Desktop environment has no impact; works on both server and desktop versions of Linux.

## **Notes**


- Sudo Requirement:
  - Since the lshw utility requires superuser privileges for certain commands, ensure you run the script with sudo.

- Error Handling:
  - If any component is not detected, the script will display a warning but continue execution.

- Customizability:
  - The script can be enhanced to include additional details or export output to a file (e.g., JSON or CSV).

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

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
