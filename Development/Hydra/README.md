# Network Scanning and Brute-Force Attack Script

This script is designed for educational purposes in the field of network security and ethical hacking. It integrates functionality for both network scanning using `nmap` and brute-force attacks using `hydra`, allowing users in a controlled environment to practice and understand these techniques.

## Features

- **Network Scanning**: Scan a specified IP range using `nmap`.
- **Brute-Force Attack**: Perform a brute-force attack on a specified target using `hydra`.
- **Flexible List Selection**: Choose between predefined or custom username/password lists for the brute-force attack.

## Prerequisites

- Kali Linux or a similar environment with `bash`.
- `nmap` and `hydra` installed.
- Access to a controlled network environment for ethical testing.

## Usage

1. **Download the Script**:
   - Save the script in a file, e.g., `network_brute_force_script.sh`.

2. **Make the Script Executable**:

   ```bash
   chmod +x network_brute_force_script.sh
   ```

3. **Run the Script**:

   ```bash
   ./network_brute_force_script.sh
   ```

   Follow the interactive prompts to perform network scanning and/or a brute-force attack.

## Interactive Prompts

- **Network Scanning**:
  - You will be asked if you want to perform network scanning.
  - If yes, enter the desired IP range for scanning.

- **Brute-Force Attack**:
  - You will be asked if you want to perform a brute-force attack.
  - If yes, enter the IP of the target.
  - Choose between using a predefined list or entering a custom list path for usernames and passwords.
  - Specify the service for the brute-force attack (e.g., ssh, ftp).

## Warning

This script is intended strictly for educational purposes in a controlled environment. Unauthorized scanning or attacks on networks or systems is illegal and unethical.

## Contributing

Feedback and contributions to improve this script are welcome. Please ensure that any modifications adhere to ethical guidelines and are intended for educational use.
