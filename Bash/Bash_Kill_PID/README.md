# KillPID: Interactive Process Manager

This Bash script provides an interactive way to manage running processes. It allows users to view all running processes, specify a Process ID (PID), and terminate the associated process.

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

## Overview

The KillPID.sh script simplifies process management by automating common tasks such as listing running processes, prompting the user for a PID, and safely terminating the process. It provides a looped interface, allowing users to manage multiple processes in a single session.

## **Features**

- Lists all currently running processes with detailed information.
- Allows users to specify a PID to terminate a process.
- Validates user input to ensure a valid PID is entered.
- Prompts users to continue managing processes or exit the script.
- Improves workflow efficiency by eliminating the need to manually enter commands.

## Prerequisites

1. A Linux-based system with Bash shell.

1. Basic Requirements:

- The ps command (included in most Linux distributions).

- Permissions to terminate processes (e.g., root or sudo privileges, if required).

1. User Knowledge:

- Basic understanding of processes and PIDs.

## **Usage**

1. Preparation:

- Save the script as KillPID.sh.
- Make it executable:

  ```bash
  chmod +x KillPID.sh
  ```

1. Running the Script:

- Open a terminal and navigate to the script's location.
- Run the script:

  ```bash
  ./KillPID.sh
  ```

1. Interactive Process Management:

- View the list of running processes.
- Enter the PID of the process you want to terminate.
- Confirm or retry as needed.
- Choose whether to manage another process or exit.

## **Script Workflow**

1. Process Listing:

-Uses the ps aux command to display all running processes with details such as PID, CPU usage, memory usage, and command.

1. User Interaction:

- Prompts the user to enter a PID.
- Validates the input to ensure it’s numeric and corresponds to a running process.

1. Process Termination:

- Attempts to terminate the specified process using the kill command.
- Displays a success or failure message.

1. Looping Interface:

- Asks the user whether they want to terminate another process.
- Repeats the workflow until the user chooses to exit.

## **Output**

The script outputs the following details:

1. Process List:

- Displays all running processes in the terminal.

1. Interactive Prompts:

- Guides the user to input a PID and confirms the action.

1. Result Messages:

- Success: Process [PID] has been terminated.
- Failure: Failed to terminate process [PID]. Check permissions or PID validity.

## **Compatibility**

- Operating Systems:
  - Linux distributions with Bash (e.g., Ubuntu, Debian, Fedora).

- Dependencies:
  - ***ps***, ***kill***, and standard Bash commands.

- Permission Requirements:
  - Sudo or root access may be required to terminate processes owned by other users.


## Notes

1. Caution:

- Terminating critical system processes can lead to system instability or crashes.

1. Validation:

- The script includes basic input validation to reduce errors.

1. Security:

- Ensure you run the script only on trusted systems with appropriate permissions.

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

1. Create a new Pull Request targeting the Bash directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
