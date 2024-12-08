# JSON Validation Script

The JSON Validation Script is a Python tool designed to validate the structure and integrity of a JSON file. The script checks if the file exists, attempts to parse the file, and ensures that the parsed JSON contains valid data (e.g., a list of operators or other expected fields).

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

The JSON Validation Script ensures that a specified JSON file exists, can be parsed correctly, and contains the expected data structure.

## **Features**

- Checks if the specified JSON file exists.
- Attempts to parse the JSON file.
- Validates the structure of the JSON file (e.g., ensures it contains a list of operators or other required fields).
- Prints a message indicating whether the JSON file is valid or not.

## **Prerequisites**

- Python 3.x installed on your system.
- No external libraries required. The script uses Python's built-in `json` module.
- Configuration:
  - Modify the following variable in the script:
    - `file_path`: Path to the JSON file you want to validate (e.g., "/path/to/your/operators.json").

## **Usage**

1. Ensure Python 3.x is installed on your system.
2. Save the script as `json_validator.py`.
3. Run the script using the command:

    ```bash
   python json_validator.py
    ```

## **Script Workflow**

1. File Existence Check:

- The script checks if the specified JSON file exists at the provided path.

1. Parse JSON:

- Attempts to load the content of the file as a JSON object.

1. Validate Data Structure:

- Confirms whether the JSON file contains the expected fields or structure (e.g., a list of operators or other required fields).

1. Output Results:

- Prints the validation status (valid or invalid) to the console.


## **Output**

- If the JSON file is valid, the script prints:

    ```bash
    JSON file is valid.
    ```

- If the file does not exist, the script prints:

    ```bash
    Error: JSON file does not exist.
    ```

- If the file cannot be parsed as valid JSON, it prints:

    ```bash
    Error: Failed to decode JSON.
    ```

## **Compatibility**

- Compatible with any system running Python 3.x.
- No external dependencies are required, as the script uses Python's built-in libraries.

## **Notes**

- The script assumes that the JSON file should contain a specific structure, such as a list of operators. If your use case differs, you may need to modify the validation logic in the script to meet your requirements.
- The script exits with an error message if:
  - The file does not exist.
  - The file cannot be parsed as valid JSON.
  - The data structure is invalid.

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
