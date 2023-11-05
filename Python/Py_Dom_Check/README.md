# Domain Analyzer

## Description

`Domain Analyzer` is a Python script developed to probe domain details using a variety of common tools like `whois`, `dig`, `host`, and `nslookup`. The results from each tool are captured and stored in a file named `fetchDom.txt`. For users on Linux or macOS, the script will also attempt to open the results file using the system's default text viewer.

## Author

- **Raphael Chookagian**

## Date of Latest Revision

- 10/05/2023

## Features

- Checks for the presence of required tools (`whois`, `dig`, `host`, `nslookup`).
- Captures domain details using the aforementioned tools.
- Saves the results in a formatted manner to `fetchDom.txt`.
- On Linux or macOS, the results file is automatically opened for quick viewing.

## Usage

1. Ensure you have Python installed on your system.
2. Save the script as `domain_analyzer.py`.
3. Run the script using the command `python domain_analyzer.py`.
4. Follow the on-screen prompt to input a domain name.
5. Review the results in `fetchDom.txt` or the opened text viewer.

## Prerequisites

The script relies on the following tools:

- whois
- dig
- host
- nslookup

Ensure these tools are installed and accessible from your system's PATH.

## Notes

- The script performs a check for the required tools before execution. If any tool is missing, the script will exit, prompting the user to install the missing tools.
- If no domain name is provided, the script will exit.
- The results file `fetchDom.txt` is overwritten on each run, so ensure to back up any previous results if needed.

## License

This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

---

Enjoy your domain analysis!
