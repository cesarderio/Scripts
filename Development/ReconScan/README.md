# Network Scan Automation Tool

The Nmap Automation Tool is a Python-based script designed to simplify and enhance network scanning tasks. By integrating with tools like `nikto`, `gobuster`, and `enum4linux`, it provides a comprehensive view of potential vulnerabilities in a network. Its threading capabilities and detailed reporting make it an essential tool for network reconnaissance.

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

The Network Scan Automation Tool leverages `Nmap`'s powerful scanning features and integrates with auxiliary tools to provide an end-to-end solution for identifying active hosts and services, mapping vulnerabilities, and reporting findings in a structured format. This tool is ideal for ethical hackers, penetration testers, and network administrators working within controlled environments.

## Features

- Subnet Scanning: Input a subnet to scan for live hosts efficiently.

- Multiple Scan Types:
  - SYN ACK scan for quick host detection.
  - UDP scan for uncovering services running over UDP.
  - Comprehensive scans for a deeper analysis.

- Integrated Tools:
  - Runs `nikto` for web vulnerability scanning on HTTP/HTTPS services.
  - Executes `gobuster` to find directories and files on web servers.
  - Uses `enum4linux` for detailed SMB enumeration.

- Threading: Scans multiple hosts concurrently to save time.

- Detailed Reports: Generates results in a well-structured JSON format, saved to the desktop with a timestamp for easy reference.

## Prerequisites

Ensure the following tools are installed and properly configured:

1. Python 3.x

1. Required Tools:

- `Nmap`: For network scanning.

- `Nikto`: For web vulnerability scanning.

- `Gobuster`: For directory/file enumeration.

- `Enum4linux`: For SMB enumeration.

1. Install Python libraries using pip if required:

  ```bash
  pip install -r requirements.txt
  ```

1. Access to a controlled network environment for ethical testing.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/cesarderio/Scripts.git
   cd Scripts/Development/
   ```

1. Run the script:

   ```bash
   python3 Recon.py
   ```

1. Follow the prompts:

- Provide an IP address or subnet for scanning.
- Select the desired scan type.
- Enter additional parameters (e.g., target port ranges or specific tools to run).

1. View the results:

- Check your desktop for a JSON report named in the format `scan_results_<IP>_<YYYYMMDD_HHMMSS>.json`.

## **Script Workflow**

1. Input Gathering:

- Accepts user input for the target IP range or subnet, scan type, and optional tool configurations.

1. Host Discovery:

- Uses Nmap to identify live hosts within the provided range.

1. Service Enumeration:

- Scans detected hosts for open ports and running services.

1.Vulnerability Scanning:

- Runs integrated tools like `nikto`, `gobuster`, and `enum4linux` on relevant services.

1. Reporting:

- Saves detailed results to a JSON file, including discovered vulnerabilities and host/service details.

## **Output**

- JSON Reports:
  - Contains:
    - List of live hosts.
    - Details of open ports and services.
    - Vulnerabilities and findings from auxiliary tools.

- Example structure:

  ```json
  {
    "timestamp": "2024-12-07T15:30:00",
    "scanned_hosts": [
      {
        "ip": "192.168.1.10",
        "open_ports": [22, 80, 443],
        "services": {
          "80": "HTTP",
          "443": "HTTPS"
        },
        "vulnerabilities": [
          "HTTP header information disclosure (Nikto)",
          "Sensitive directories detected (Gobuster)"
        ]
      }
    ]
  }
  ```

## **Compatibility**

- Operating Systems:
  - Linux distributions (tested on Kali Linux, Ubuntu).

- Tools Required:
  - `Nmap`, `Nikto`, `Gobuster`, `Enum4linux` installed and in the PATH.

## **Notes**

- Ethical Use:
  - This tool is for authorized testing within controlled environments. Unauthorized use is illegal.

- Root Privileges:
  - Some scans may require elevated privileges to execute.

- Limitations:
  - Scan results depend on network configuration and access permissions.
  - Threading improves performance but may cause issues on heavily filtered networks.

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

1. Create a new Pull Request targeting the Development directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
