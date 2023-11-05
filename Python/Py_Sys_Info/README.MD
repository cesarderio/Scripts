
# Python System Information Script

**Author:** Raphael Chookagian  
**Date of Latest Revision:** 10/05/2023  
**Script Language:** Python 3

## Overview

The Python System Information Script provides detailed insights about various components of the system using the `lshw` utility. It displays information on the following:

- Machine Name
- CPU
- RAM
- Display Adapter
- Network Adapter

## Prerequisites

1. **Python3**:  
   The script is written in Python 3.  
   - To check if you have Python3 installed:  

     ```bash
     python3 --version
     ```

   - To install Python3 on Ubuntu:  

     ```bash
     sudo apt update
     sudo apt install python3
     ```

2. **lshw Utility**:  
   The `lshw` utility collects and displays detailed information about the hardware configuration of the machine.  
   - To check if you have `lshw` installed:  

     ```bash
     lshw -version
     ```

   - To install `lshw` on Ubuntu:  

     ```bash
     sudo apt update
     sudo apt install lshw
     ```

3. **sudo**: Some commands in the script require sudo privileges. Ensure that the user running the script has the necessary permissions.

## Usage

1. Ensure you have the required permissions to execute the script:

   ```bash
   chmod +x /Py_Sys_Info.py
   ```

2. Run the script:

   ```bash
   ./Py_Sys_Info.py
   ```

## Output

The script will present the user with detailed information about:

- Machine Name
- CPU Specifications
- RAM Details
- Display Adapter Details
- Network Adapter Specifications

## Support & Contributions

For issues, feedback, or contributions, please reach out to the author or open an issue in the repository (if available).
