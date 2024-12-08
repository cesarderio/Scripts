# Domain Analyzer PowerShell Script



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

## Overview

The `Domain Analyzer` script is a simple yet powerful tool to fetch domain details. It leverages tools like `whois`, `dig`, `host`, and `nslookup` to gather and present information about a specified domain. The results are then stored in a text file and opened in the default text editor for easy viewing.

<br>


## Features

1. Checks if essential tools (`whois`, `dig`, `host`, `nslookup`) are installed.
2. Prompts the user to install missing tools.
3. Fetches domain details using:
    - whois
    - dig
    - host
    - nslookup
4. Outputs the results to `fetchDom.txt`.
5. Opens the results in the default text editor for easy access and viewing.

<br>

## Prerequisites

The script checks for the following tools and will prompt you to install them if they're not found:

- whois
- dig
- host
- nslookup

Ensure you install any missing tools to get accurate results.

<br>

## Usage

1. Save the script as `DomainAnalyzer.ps1`.
2. Open a PowerShell window. For certain operations or in restricted environments, you might need to run it as an administrator.
3. Navigate to the directory where you've saved the script.
4. Execute the script with the command `.\DomainAnalyzer.ps1`.
5. Follow the on-screen prompts.

<br>

## **Script Workflow**




<br>

## **Output**




<br>

## **Compatibility**




<br>

## **Notes**

Before running the script for the first time, ensure your PowerShell execution policy allows the execution of scripts. You might need to run:

```powershell
Set-ExecutionPolicy RemoteSigned
```

Always exercise caution when adjusting execution policies and only run scripts from trusted sources.

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
