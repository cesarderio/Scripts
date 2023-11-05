#!/bin/bash

# Script Name:                  System Information Script
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      Display system information about various components using lshw.

# Functions to display system information

Name() {
    echo "Name:"
    hostname
}

CPU() {
    echo "CPU:"
    sudo lshw -class cpu | grep -E -v "capabilities|version|*-cpu"
}

RAM() {
    echo "RAM:"
    sudo lshw -class memory | grep -A 3 "memory"
}

Display() {
    echo "Display Adapter:"
    sudo lshw -class display | grep -E -v "display|version|logical"
}

Network() {
    echo "Network Adapter:"
    sudo lshw -class network | grep -v "network"
}

# Main function to call other functions and display system info
DisplaySystemInfo() {
    Name
    CPU
    RAM
    Display
    Network
}

# Invoke main function
DisplaySystemInfo
