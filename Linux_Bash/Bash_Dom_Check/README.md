# Domain Analyzer

Author: **Raphael Chookagian**
Date of latest revision: **10/05/2023**

## Overview

Domain Analyzer is a Bash script designed to retrieve and display comprehensive information about a specified domain. It integrates with common domain lookup tools such as `whois`, `dig`, `host`, and `nslookup`.

## Features

- **Whois Lookup**: Get domain registration and ownership details.
- **Dig Lookup**: Retrieve DNS records associated with the domain.
- **Host Lookup**: Obtain domain's IP address and vice versa.
- **NSLookup**: Query domain's DNS server for domain name or IP address mapping.

## Usage

1. Ensure that you have `whois`, `dig`, `host`, and `nslookup` installed on your system.
2. Run the script:

   ```bash
   ./domain_analyzer.sh
   ```

3. When prompted, enter the domain name you wish to analyze.

## Output

The script displays the domain's information in the terminal and simultaneously saves it to a file named `fetchDom.txt`.

You can view the results using your preferred text editor or the file will open automatically, depending on your OS.

## Requirements

- Bash shell
- The following tools must be installed:
  - whois
  - dig
  - host
  - nslookup

## Compatibility

The script has been tested and is known to work on:

- Linux distributions with GNOME (using `xdg-open` to open files)
- macOS (using the `open` command)

## Contribution

To contribute to this project, please fork the repository and submit a pull request.
