#!/usr/bin/env bash

# Script Name:                  Domain Analyzer
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      Analyze domain using various tools and save the result to a text file.

# Declare Functions

# Remove existing domain results file
removeDom() {
  rm -f fetchDom.txt
}

# Run whois against the user input
WhoDis() {
  echo -e "\n---- WHOIS ----" | tee -a fetchDom.txt
  whois "$userInput" | tee -a fetchDom.txt
}

# Run dig against the user input
DigDis() {
  echo -e "\n---- DIG ----" | tee -a fetchDom.txt
  dig "$userInput" | tee -a fetchDom.txt
}

# Run host against the user input
HostDis() {
  echo -e "\n---- HOST ----" | tee -a fetchDom.txt
  host "$userInput" | tee -a fetchDom.txt
}

# Run nslookup against the user input
NslDis() {
  echo -e "\n---- NSLOOKUP ----" | tee -a fetchDom.txt
  nslookup "$userInput" | tee -a fetchDom.txt
}

# Fetch domain details
fetchDom() {
  WhoDis
  DigDis
  HostDis
  NslDis
}

# Main

# Check for required tools
for cmd in whois dig host nslookup; do
  if ! command -v $cmd &> /dev/null; then
    echo "$cmd is required but it's not installed. Exiting."
    exit 1
  fi
done

# Get user input
read -p "Please enter a domain name: " userInput

# Check for empty input
if [[ -z "$userInput" ]]; then
  echo "You didn't enter a domain name. Exiting."
  exit 1
fi

# Fetch domain details
removeDom
fetchDom

# Open file based on OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  xdg-open fetchDom.txt
elif [[ "$OSTYPE" == "darwin"* ]]; then
  open fetchDom.txt
else
  echo "Results saved to fetchDom.txt"
fi
