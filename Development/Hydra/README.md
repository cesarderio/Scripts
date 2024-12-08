# Network Scanning and Brute-Force Attack Script

<br>

## **Warning**

This script is intended strictly for educational purposes in a controlled environment in the fields of network security and ethical hacking. Unauthorized scanning or attacks on networks or systems is illegal and unethical. It integrates functionality for both network scanning using `nmap` and brute-force attacks using `hydra`, allowing users in a controlled environment to practice and understand these techniques.

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

The Network Scanning and Brute-Force Attack Script combines the functionalities of `nmap` and `hydra` into one streamlined tool. It is designed to educate users on identifying network vulnerabilities through scanning and password auditing, offering an interactive, modular approach. This tool is ideal for security professionals and students learning about ethical hacking in controlled environments.

<br>

## **Features**

- **Network Scanning**:

  - Uses `nmap` to perform a detailed scan of a specified IP range or subnet.
  - Detects open ports and running services on the target machines.
  -Provides options for different scanning types (e.g., fast scan, full scan).

- **Brute-Force Attack**:

  -Employs `hydra` to attempt password guessing attacks on a specified target and service (e.g., SSH, FTP).
  -Supports both predefined and custom username/password lists.
  -Allows targeting of specific ports and services.

- **Interactive Prompts**:

  - Guides users step-by-step through network scanning and brute-force attack options.
  - Provides flexible inputs for customization.

<br>

## **Prerequisites**

- Operating System: Kali Linux or a similar security-focused distribution.

- Installed Tools:
  -`nmap`: For network scanning.
  -`hydra`: For brute-force attacks.

- Controlled Environment:
  - Ensure you have explicit permission to scan and test the target network.

<br>

## **Usage**

- **Download the Script**:
   - Save the script in a file, e.g., `network_brute_force_script.sh`.

- **Make the Script Executable**:

   ```bash
   sudo chmod +x network_brute_force_script.sh
   ```

- **Run the Script**:

   ```bash
   ./network_brute_force_script.sh
   ```

- Follow the Prompts:

  - Choose to perform a network scan, a brute-force attack, or both.
  - Enter the required details such as IP ranges, target IPs, services, and file paths.

<br>

### **Interactive Prompts**

- **Network Scanning**:
  - Specify the IP range or CIDR block for the scan.
  - Select the type of scan (e.g., quick scan, detailed scan, or aggressive scan).

- **Brute-Force Attack**:
  - Provide the target IP address.
  - Specify the service to attack (e.g., ssh, ftp).
  - Choose between using predefined or custom username/password lists.
  - Enter the paths for custom lists, if applicable.

<br>

## **Script Workflow**

1. User Input:

- Prompts the user for network scanning and brute-force attack options.
- Accepts input for scan types, IP ranges, and service details.

2. Network Scanning:

- Executes nmap with user-specified parameters.
- Parses and displays the scan results, highlighting open ports and services.

3. Brute-Force Attack:

- Executes hydra against the specified service using the provided username and password lists.
- Logs the results of the brute-force attempt, including successful logins (if any).

4. Error Handling:

- Checks for the availability of required tools (nmap and hydra) before execution.
- Provides clear error messages for missing tools, invalid inputs, or unsupported options.

5. Completion:

- Displays a summary of the scan and attack results.
- Cleans up any temporary files created during execution.

<br>

## **Output**

- Network Scanning:
  - Lists discovered hosts, open ports, and running services.
  - Saves the results to a file (e.g., scan_results.txt).

- Brute-Force Attack:

  - Logs successful and failed login attempts.
  - Saves the attack report to a file (e.g., brute_force_log.txt).

- Error Logs:

  - Displays error messages for issues such as invalid inputs or failed scans.

<br>

## **Compatibility**

- Supported Operating Systems:
  - Kali Linux or other Linux distributions with bash.

- Dependencies:
  - Requires `nmap` and `hydra` to be installed.

- Target Networks:
  - Ensure the script is run only on networks where you have explicit permission.

<br>

## **Notes**

- Ethical Usage:
  - This tool is intended solely for ethical purposes within controlled environments. Unauthorized use is illegal and unethical.

- Root Privileges:
  - The script requires root privileges for some operations, such as running nmap scans.

- Custom Lists:
  - Use secure methods to create or obtain username/password lists. Avoid using lists that contain sensitive or unauthorized data.

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

- Create a new Pull Request targeting the Development directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

<br>

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
