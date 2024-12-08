# Domain Analyzer

This script is designed to retrieve and display information about the given domain.

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

The Domain Analyzer script integrates with widely used domain lookup tools to gather comprehensive details about a given domain. It can retrieve registration data, DNS records, and IP address mappings. This tool is ideal for developers, IT professionals, or anyone needing quick insights into domain properties.

<br>

## **Features**

- **Whois Lookup**:
  - Get domain registration and ownership details.

- **Dig Lookup**:
  - Retrieve DNS records associated with the domain.

- **Host Lookup**:
  - Obtain domain's IP address and vice versa.

- **NSLookup**:
  - Query domain's DNS server for domain name or IP address mapping.

<br>

## **Prerequisites**

Ensure the following requirements are met:

- Shell Environment:

  - Bash shell must be available.

- Required Tools:

  - The script requires these utilities:
    - whois
    - dig
    - host
    - nslookup

- Installation Instructions:

  - For Ubuntu or Debian-based systems:

    ```bash
    sudo apt update
    sudo apt install whois dnsutils bind9-host
    ```

  - For macOS:
    - The necessary utilities are included with macOS.

<br>

## **Usage**

- Download and Prepare the Script:

  - Save the domain_analyzer.sh file to your system.
  - Make it executable:

    ```bash
    chmod +x domain_analyzer.sh
    ```

- Run the Script:

  - Execute the script in the terminal:

    ```bash
    ./domain_analyzer.sh
    ```

- Enter Domain:

  - When prompted, input the domain name you wish to analyze (e.g., example.com).

<br>

## **Script Workflow**

- Input Validation:

  - Checks if a valid domain name is entered.

- Tool Integration:

  - Executes whois, dig, host, and nslookup commands.

- Output Consolidation:

  - Saves the combined results to fetchDom.txt.

- File Display:

  -Opens fetchDom.txt using the appropriate command for the user's OS.

<br>

## **Output**

The script provides detailed domain information, including:

- Whois Data: Registration, owner, and expiration details.

- DNS Records: A, MX, NS, and other records.

- IP Mapping: Both forward and reverse lookups.

Example Output:

  ```yaml
  Whois Information:
    Domain Name: EXAMPLE.COM
    Registrar: Example Registrar
    Creation Date: 1995-01-01
    Expiration Date: 2025-01-01

  DNS Records:
    A Record: 192.0.2.1
    MX Record: mail.example.com

  Host Information:
    Domain resolves to: 192.0.2.1

  NSLookup Results:
    Name Server: ns1.example.com
  ```

The output is saved to fetchDom.txt and opened automatically.

<br>

## **Compatibility**

The script has been tested on:

- Linux:
  -Compatible with most distributions (e.g., Ubuntu, Debian, Fedora).

- macOS:
  -Fully functional using native tools (whois, dig, etc.).

<br>

## **Notes**

- Ensure internet connectivity when running the script to fetch accurate domain information.

- Modify the script as needed if additional domain tools or queries are required.

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

- Create a new Pull Request targeting the Bash directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

<br>

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
