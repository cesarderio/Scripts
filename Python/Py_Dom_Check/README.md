# Domain Analyzer

`Domain Analyzer` is a Python script developed to probe domain details using a variety of common tools like `whois`, `dig`, `host`, and `nslookup`. The results from each tool are captured and stored in a file named `fetchDom.txt`. For users on Linux or macOS, the script will also attempt to open the results file using the system's default text viewer.

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

The Domain Analyzer script provides a convenient way to gather detailed information about a domain using various command-line tools. Whether you are troubleshooting, performing reconnaissance, or verifying DNS records, this script simplifies the process by consolidating outputs into a single file.

<br>

## Features

- Tool Presence Verification:
  - Checks for the availability of whois, dig, host, and nslookup on the system.

- Domain Information Gathering:
  - Executes the specified tools to retrieve domain-related information.

- Output Management:
  - Saves results in a structured format in the fetchDom.txt file.

- Auto-Opening Results:
  - For Linux or macOS users, automatically opens the results file in the system's default text editor.

<br>

## **Prerequisites**

Ensure the following requirements are met before running the script:

- Python 3.x installed on your system.
- Tools required for the script:
  - whois
  - dig
  - host
  - nslookup

- All tools must be accessible through the system's PATH.

<br>

## Usage

1. Prepare the script:

- Save the script as domain_analyzer.py.
- Ensure it has execute permissions if needed:

  ```bash
  chmod +x domain_analyzer.py
  ```

1. Run the script:

- Execute the script from the terminal:

  ```bash
  python domain_analyzer.py
  ```

1.Input domain:

- Enter the domain name when prompted (e.g., example.com).

1. Review results:

- Check the output in the fetchDom.txt file.

- On Linux/macOS, the results will automatically open in your text viewer if available.

<br>

## **Script Workflow**

1. Check Dependencies:

- Verifies that required tools (whois, dig, host, nslookup) are installed.

1. Prompt for Input:

- Requests the user to input a domain name.

1. Execute Commands:

- Runs each tool against the provided domain and captures the output.

1. Save Results:

- Outputs the aggregated results to fetchDom.txt.

1. Auto-Open Results (Linux/macOS only):

- Attempts to open the results in the system's default text editor.

<br>

## **Output**

- Results are saved in fetchDom.txt.

- Example output:

  ```bashplaintext
  WHOIS Data:
  <whois data here>

  DIG Data:
  <dig output here>

  HOST Data:
  <host output here>

  NSLOOKUP Data:
  <nslookup output here>
  ```

- Any missing or incomplete data will be clearly noted.

<br>

## **Compatibility**

- Operating Systems:
  - Linux
  - macOS
  - Windows (limited functionality; does not support auto-opening results).

- Error Handling:
  - The script exits with an error message if:
    - A required tool is missing.
    - The provided domain name is invalid.
    - An unexpected error occurs during execution.

<br>

## Notes

- Overwrite Warning:
  - The fetchDom.txt file is overwritten each time the script runs. Back up the file if needed.

- Tool Installation:
  - Ensure required tools are installed. For example:
    - On Ubuntu/Debian:

      ```bash
      sudo apt install whois dnsutils
      ```

    - On macOS:

      ```bash
      Use brew install.
      ```

- Customization:
  - Modify the script to adjust the file path or add additional tools/commands as needed.

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

- Create a new Pull Request targeting the Python directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

<br>

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
