import os
import subprocess
import platform

# Script Name:                  Domain Analyzer
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      Analyze domain using various tools and save the result to a text file.

# Functions

def remove_dom():
    """Remove existing domain results file."""
    if os.path.exists('fetchDom.txt'):
        os.remove('fetchDom.txt')

def who_dis(domain):
    """Run whois against the user input."""
    with open('fetchDom.txt', 'a') as f:
        f.write("\n---- WHOIS ----\n")
        result = subprocess.check_output(['whois', domain]).decode()
        f.write(result)

def dig_dis(domain):
    """Run dig against the user input."""
    with open('fetchDom.txt', 'a') as f:
        f.write("\n---- DIG ----\n")
        result = subprocess.check_output(['dig', domain]).decode()
        f.write(result)

def host_dis(domain):
    """Run host against the user input."""
    with open('fetchDom.txt', 'a') as f:
        f.write("\n---- HOST ----\n")
        result = subprocess.check_output(['host', domain]).decode()
        f.write(result)

def nsl_dis(domain):
    """Run nslookup against the user input."""
    with open('fetchDom.txt', 'a') as f:
        f.write("\n---- NSLOOKUP ----\n")
        result = subprocess.check_output(['nslookup', domain]).decode()
        f.write(result)

def fetch_dom(domain):
    """Fetch domain details."""
    who_dis(domain)
    dig_dis(domain)
    host_dis(domain)
    nsl_dis(domain)

# Main

# Check for required tools
required_tools = ['whois', 'dig', 'host', 'nslookup']
for tool in required_tools:
    if not shutil.which(tool):
        print(f"{tool} is required but it's not installed. Exiting.")
        exit(1)

# Get user input
domain = input("Please enter a domain name: ")

# Check for empty input
if not domain:
    print("You didn't enter a domain name. Exiting.")
    exit(1)

# Fetch domain details
remove_dom()
fetch_dom(domain)

# Open file based on OS
os_type = platform.system()
if os_type == "Linux":
    os.system('xdg-open fetchDom.txt')
elif os_type == "Darwin":
    os.system('open fetchDom.txt')
else:
    print("Results saved to fetchDom.txt")
